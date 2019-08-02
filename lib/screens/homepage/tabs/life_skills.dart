import 'package:flutter/material.dart';

import './content_card.dart';

class LifeSkills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 12,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        if (index == 0) return ContentCard(true);
        return ContentCard(false);
      },
    );
  }
}
