class Article {
  final int key;
  final String title;
  final String description;
  final String date;
  final List<dynamic> imageUrls;

  Article(this.key, this.title, this.description, this.date, {this.imageUrls});

  bool hasImage() => imageUrls.length > 0;
}
