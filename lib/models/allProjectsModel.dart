// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';


// String welcomeToJson(Welcome data) => json.encode(data.toJson());

class allProjectsModel {
    allProjectsModel({
        this.message,
        this.success,
        this.data,
    });

    String message;
    bool success;
    Data data;

    factory allProjectsModel.fromJson(Map<String, dynamic> json) => allProjectsModel(
        message: json["message"],
        success: json["success"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.count,
        this.rows,
    });

    int count;
    List<RowDataProjects> rows;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"],
        rows: List<RowDataProjects>.from(json["rows"].map((x) => RowDataProjects.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "rows": List<dynamic>.from(rows.map((x) => x.toJson())),
    };
}

class RowDataProjects {
    RowDataProjects({
        this.id,
        this.title,
        this.image,
        this.isActive,
        this.createdAt,
    });

    int id;
    String title;
    String image;
    bool isActive;
    DateTime createdAt;

    factory RowDataProjects.fromJson(Map<String, dynamic> json) => RowDataProjects(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
    };
}
