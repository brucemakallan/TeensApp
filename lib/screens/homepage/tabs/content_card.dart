import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../utils/article.dart';
import '../../../utils/errorWidget.dart';

class ContentCard extends StatelessWidget {
  final Article article;

  ContentCard(this.article);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            article.hasImage()
                ? Align(
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl: article.imageUrls[0],
                      placeholder: (context, url) => Padding(
                            padding: EdgeInsets.all(10),
                            child: CircularProgressIndicator(),
                          ),
                      errorWidget: (context, url, error) => Padding(
                            padding: EdgeInsets.all(10),
                            child: CustomError('Could not find Image'),
                          ),
                    ),
                  )
                : Container(),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                article.title,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                article.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                softWrap: true,
              ),
            ),
            Padding(padding: EdgeInsets.all(10), child: Text(article.date)),
          ],
        ),
      ),
    );
  }
}
