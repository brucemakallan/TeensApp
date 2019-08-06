import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './content_card.dart';
import '../../../utils/article.dart';
import '../../../utils/assets.dart';
import '../../../utils/dates.dart';
import '../../../utils/errorWidget.dart';

class Devotionals extends StatelessWidget {
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
          List devotionals = jsonList
              .where((entity) =>
                  entity['category'] == Categories.DEVOTIONAL &&
                  entity['pinned'] == false)
              .toList();
          try {
            Map<String, dynamic> pinnedItem = jsonList.firstWhere((entity) =>
                entity['category'] == Categories.DEVOTIONAL &&
                entity['pinned'] == true);
            devotionals.insert(0, pinnedItem);
          } catch (e) {
            print('No pinned items found');
          }

          return ListView.builder(
            itemCount: devotionals.length,
            padding: EdgeInsets.all(8),
            itemBuilder: (context, index) {
              Map<String, dynamic> jsonObject = devotionals[index];
              Article devotional = Article(
                  jsonObject['heading1'],
                  jsonObject['body'],
                  CustomDate(jsonObject['dateCreated']).toAmericanDateTime(),
                  imageUrls: jsonObject['images']);
              return ContentCard(devotional);
            },
          );
        } else
          return Center(child: CircularProgressIndicator());
      },
    );
  }
}
