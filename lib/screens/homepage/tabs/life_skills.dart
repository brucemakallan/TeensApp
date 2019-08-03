import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './content_card.dart';
import '../../../utils/article.dart';
import '../../../utils/assets.dart';
import '../../../utils/dates.dart';

class LifeSkills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: http.get(Constants.API_URL),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) return Text('has error');

          List jsonList = jsonDecode(snapshot.data.body);
          List lifeSkills = jsonList
              .where((entity) => entity['category'] == 'LIFE SKILL')
              .toList();
          return ListView.builder(
            itemCount: lifeSkills.length,
            padding: EdgeInsets.all(8),
            itemBuilder: (context, index) {
              Map<String, dynamic> jsonObject = lifeSkills[index];
              Article lifeSkill = Article(
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
}
