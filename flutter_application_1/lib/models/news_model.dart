import 'dart:convert';

Pokedex pokedexFromJson(String str) => Pokedex.fromJson(json.decode(str));

class Pokedex {
  Status status;
  List<Article> articles;

  Pokedex({
    required this.status,
    required this.articles,
  });

  factory Pokedex.fromJson(Map<String, dynamic> json) => Pokedex(
        status: Status.fromJson(json["status"]),
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );
}

class Article {
  int id;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  Article({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"],
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );
}

class Status {
  String status;

  Status({
    required this.status,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        status: json["status"],
      );
}
