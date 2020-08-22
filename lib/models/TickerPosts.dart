// To parse this JSON data, do
//
//     final tickerPosts = tickerPostsFromJson(jsonString);

import 'dart:convert';

TickerPosts tickerPostsFromJson(String str) => TickerPosts.fromJson(json.decode(str));

String tickerPostsToJson(TickerPosts data) => json.encode(data.toJson());

class TickerPosts {
  TickerPosts({
    this.data,
  });

  List<Datum> data;

  factory TickerPosts.fromJson(Map<String, dynamic> json) => TickerPosts(
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.content,
  });

  int id;
  String content;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    content: json["content"] == null ? null : json["content"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "content": content == null ? null : content,
  };
}
