import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../widgets/scale_animation.dart';
import '../../../utils/article.dart';
import '../../../utils/errorWidget.dart';
import '../../article_details.dart';
import '../app_bar.dart';

class ContentCard extends StatelessWidget {
  final Article article;

  ContentCard(this.article);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
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
                      child: Hero(
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
                    )
                  : Container(),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  article.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 22),
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
      ),
      onTap: () {
        Navigator.of(context).push(ScaleRoute(page: ArticleDetails(article)));
      },
    );
  }
}
