import 'dart:convert';
import 'package:http/http.dart' as http;

class Berita {
  Berita({
    this.status,
    this.totalResults,
    this.articles,
  });

  String? status;
  int? totalResults;
  List<Article>? articles;

  static Future<Berita> connectToAPI() async {
    String apiurl =
        "https://newsapi.org/v2/top-headlines?country=id&source=detik.com&category=health&pagesize=60&apiKey=f3590c47290449f2a41744dc5c687002";
    var apiResult = await http
        .get(Uri.parse(apiurl), headers: {"Accept": "application/json"});
    var jsonObject = json.decode(apiResult.body);
    var res = await http
        .get(Uri.parse(apiurl), headers: {"Accept": "application/json"});

    return Berita.fromJson(jsonObject);
  }

  factory Berita.fromJson(Map<String, dynamic> json) => Berita(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );
}

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"] == null ? null : json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"] == null ? null : json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] == null ? null : json["content"],
      );
}

class Source {
  Source({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
      );
}
