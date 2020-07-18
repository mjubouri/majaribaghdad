// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);





class NotificationModel {
    NotificationModel({
        this.message,
        this.success,
        this.data,
    });

    String message;
    bool success;
    Data data;

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
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
    List<RowNotification> rows;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"],
        rows: List<RowNotification>.from(json["rows"].map((x) => RowNotification.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "rows": List<dynamic>.from(rows.map((x) => x.toJson())),
    };
}

class RowNotification {
    RowNotification({
        this.id,
        this.title,
        this.content,
        this.moduleType,
        this.moduleId,
        this.status,
        this.isActive,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String title;
    String content;
    String moduleType;
    int moduleId;
    dynamic status;
    bool isActive;
    DateTime createdAt;
    DateTime updatedAt;

    factory RowNotification.fromJson(Map<String, dynamic> json) => RowNotification(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        moduleType: json["moduleType"],
        moduleId: json["moduleId"],
        status: json["status"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "moduleType": moduleType,
        "moduleId": moduleId,
        "status": status,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
