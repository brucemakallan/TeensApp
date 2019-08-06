import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../utils/errorWidget.dart';
import '../utils/article.dart';

class ArticleDetails extends StatelessWidget {
  final Article article;

  ArticleDetails(this.article);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Hero(
                tag: article.key,
                key: Key(article.key.toString()),
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
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  article.title,
                  style: TextStyle(fontSize: 23),
                ),
              ),
              Padding(padding: EdgeInsets.all(20), child: Text(article.date)),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: MarkdownBody(
                  data: article.description,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
