// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    this.data,
    this.links,
    this.meta,
  });

  List<PostData> data;
  Links links;
  Meta meta;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    data: json["data"] == null ? null : List<PostData>.from(json["data"].map((x) => PostData.fromJson(x))),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links == null ? null : links.toJson(),
    "meta": meta == null ? null : meta.toJson(),
  };
}

class PostData {
  PostData({
    this.id,
    this.title,
    this.content,
    this.image,
  });

  int id;
  String title;
  String content;
  String image;

  factory PostData.fromJson(Map<String, dynamic> json) => PostData(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    content: json["content"] == null ? null : json["content"],
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "content": content == null ? null : content,
    "image": image == null ? null : image,
  };
}

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String first;
  String last;
  dynamic prev;
  dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"] == null ? null : json["first"],
    last: json["last"] == null ? null : json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first == null ? null : first,
    "last": last == null ? null : last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"] == null ? null : json["current_page"],
    from: json["from"] == null ? null : json["from"],
    lastPage: json["last_page"] == null ? null : json["last_page"],
    path: json["path"] == null ? null : json["path"],
    perPage: json["per_page"] == null ? null : json["per_page"],
    to: json["to"] == null ? null : json["to"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage == null ? null : currentPage,
    "from": from == null ? null : from,
    "last_page": lastPage == null ? null : lastPage,
    "path": path == null ? null : path,
    "per_page": perPage == null ? null : perPage,
    "to": to == null ? null : to,
    "total": total == null ? null : total,
  };
}
