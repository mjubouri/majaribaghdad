// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);





// String welcomeToJson(CreateReportResponse data) => json.encode(data.toJson());

class CreateReportResponse {
    CreateReportResponse({
        this.message,
        this.success,
        this.data,
    });

    String message;
    bool success;
    Data data;

    factory CreateReportResponse.fromJson(Map<String, dynamic> json) =>
     CreateReportResponse(
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
        this.id,
        this.name,
        this.email,
        this.agent,
        this.content,
        this.ip,
        this.subject,
        this.phone,
        this.location,
        this.updatedAt,
        this.createdAt,
    });

    int id;
    String name;
    String email;
    String agent;
    String content;
    String ip;
    String subject;
    String phone;
    String location;
    DateTime updatedAt;
    DateTime createdAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        agent: json["agent"],
        content: json["content"],
        ip: json["ip"],
        subject: json["subject"],
        phone: json["phone"],
        location: json["location"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "agent": agent,
        "content": content,
        "ip": ip,
        "subject": subject,
        "phone": phone,
        "location": location,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
    };
}
