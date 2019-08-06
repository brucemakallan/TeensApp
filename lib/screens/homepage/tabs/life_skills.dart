import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './content_card.dart';
import '../../../utils/article.dart';
import '../../../utils/assets.dart';
import '../../../utils/dates.dart';
import '../../../utils/errorWidget.dart';

class LifeSkills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: http.get(Constants.API_URL),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return CustomError('Error fetching List. Please refresh');
          }
          // get life skills and ensure that the pinned item is the latest
          List jsonList = jsonDecode(snapshot.data.body);
          List lifeSkills = jsonList
              .where((entity) =>
                  isLifeSkill(entity['category']) && entity['pinned'] == false)
              .toList();
          try {
            Map<String, dynamic> pinnedItem = jsonList.firstWhere((entity) =>
                isLifeSkill(entity['category']) && entity['pinned'] == true);
            lifeSkills.insert(0, pinnedItem);
          } catch (e) {
            print('No pinned items found');
          }

          return ListView.builder(
            itemCount: lifeSkills.length,
            padding: EdgeInsets.all(8),
            itemBuilder: (context, index) {
              Map<String, dynamic> jsonObject = lifeSkills[index];
              Article lifeSkill = Article(
                  index,
                  jsonObject['heading1'],
                  jsonObject['body'],
                  CustomDate(jsonObject['dateCreated']).toAmericanDateTime(),
                  imageUrls: jsonObject['images']);
              return ContentCard(lifeSkill);
            },
          );
        } else
          return Center(child: CircularProgressIndicator());
      },
    );
  }

  bool isLifeSkill(category) => (category == Categories.ONESELF ||
      category == Categories.OTHERS ||
      category == Categories.PROBLEM_SOLVING);
}
