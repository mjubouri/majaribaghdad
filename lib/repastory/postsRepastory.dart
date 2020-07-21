import 'dart:convert';

import 'package:SewerBaghdad/models/allProjectsModel.dart';
import 'package:SewerBaghdad/models/createReportResponse.dart';
import 'package:SewerBaghdad/models/notificationSlider.dart';
import 'package:SewerBaghdad/models/posts.dart';
import 'package:SewerBaghdad/models/sendReportBody.dart';
import 'package:SewerBaghdad/ui/customWidget/strings.dart';
import 'package:http/http.dart';

class PostsRepastory {
  Future<PostsModel> getPosts(int p) async {
    final response = await get(baseUrl + "content/posts?p=$p&s=5");
    if (response.statusCode == 200) {
      return postsModelFromJson(response.body);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  PostsModel postsModelFromJson(String str) =>
      PostsModel.fromJson(json.decode(str));

  Future<allProjectsModel> getAllProjects(int p) async {
    final response = await get(baseUrl + "content/projects?p=$p&s=5");
    if (response.statusCode == 200) {
      return allProjectsModelFromJson(response.body);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  allProjectsModel allProjectsModelFromJson(String str) =>
      allProjectsModel.fromJson(json.decode(str));

  Future<PostsModel> getBanners() async {
    final response = await get(baseUrl + "content/banners");
    if (response.statusCode == 200) {
      return postsModelFromJson(response.body);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<NotificationModel> getNotification() async {
    final response = await get(baseUrl + "notification/all");
    if (response.statusCode == 200) {
      return notificationModelFromJson(response.body);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  NotificationModel notificationModelFromJson(String str) =>
      NotificationModel.fromJson(json.decode(str));
  String name;
  String email;
  String content;
  String subject;
  String phone;
  String location;

  Future<CreateReportResponse> createFeedbck(SendReportBody body) async {
    final response = await post(baseUrl + "feedback/feedback",
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "name": body.name,
          "email": body.email.toString(),
          "content": body.content,
          "subject": body.subject,
          "phone": body.phone,
          "location": body.location
        }));
    if (response.statusCode == 201 || response.statusCode == 200) {
      //   print(json.decode(response.body)["message"]);
      return createReportResponseFromJson(response.body);
    } else {
      throw Exception(json.decode(response.body)["message"]);
    }
  }

  CreateReportResponse createReportResponseFromJson(String str) =>
      CreateReportResponse.fromJson(json.decode(str));
}
