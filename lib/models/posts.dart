// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);






class PostsModel {
    PostsModel({
        this.message,
        this.success,
        this.data,
    });

    String message;
    bool success;
    Data data;

    factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
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
    List<RowData> rows;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"],
        rows: List<RowData>.from(json["rows"].map((x) => RowData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "rows": List<dynamic>.from(rows.map((x) => x.toJson())),
    };
}

class RowData {
    RowData({
        this.title,
        this.content,
        this.image,
        this.createdAt,
    });

    String title;
    String content;
    String image;
    DateTime createdAt;

    factory RowData.fromJson(Map<String, dynamic> json) => RowData(
        title: json["title"],
        content: json["content"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
    };
}
