import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ContentCard extends StatelessWidget {
  final bool hasImage;

  ContentCard(this.hasImage);

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
            hasImage
                ? Align(
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl: "https://picsum.photos/id/77/1600/900",
                      placeholder: (context, url) =>
                          new CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          new Icon(Icons.error),
                    ),
                  )
                : Container(),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Title',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                softWrap: true,
              ),
            ),
            Padding(padding: EdgeInsets.all(10), child: Text('Date')),
          ],
        ),
      ),
    );
  }
}
