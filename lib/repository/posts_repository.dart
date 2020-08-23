import 'dart:convert';

import 'package:SewerBaghdad/models/PostModel.dart';
import 'package:SewerBaghdad/models/ProjectModel.dart';
import 'package:SewerBaghdad/models/TickerPosts.dart';
import 'package:SewerBaghdad/models/bannerModel.dart';
import 'package:SewerBaghdad/models/sendReportBody.dart';
import 'package:SewerBaghdad/ui/customWidget/strings.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class PostsRepository {
  Future<PostModel> getPosts(int p) async {
    final response = await get(baseUrl + "posts?p=$p&s=5");
    if (response.statusCode == 200) {
      return postModelFromJson(response.body);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  PostModel postModelFromJson(String str) =>
      PostModel.fromJson(json.decode(str));

  Future<ProjectModel> getAllProjects(int p) async {
    final response = await get(baseUrl + "projects?p=$p&s=5");
    if (response.statusCode == 200) {
      return projectModelFromJson(response.body);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<BannerModel> getBanners() async {
    print(baseUrl + "sliders");
    final response = await get(baseUrl + "sliders");
    if (response.statusCode == 200) {
      return bannerModelFromJson(response.body);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<TickerPosts> getNotification() async {
    print(baseUrl + "ticker_posts");
    final response = await get(baseUrl + "ticker_posts");
    if (response.statusCode == 200) {
      return tickerPostsFromJson(response.body);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<bool> createFeedback(SendReportBody body) async {
    final response = await post(baseUrl + "complaints",
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
        },
        body: json.encode({
          "name": body.name,
          "email": body.email,
          "content": body.content,
          "subject": body.subject,
          "phone": body.phone,
          "address": body.location,
          "message": 'such a test',
          "doc_number": body.docNumber,
          "doc_date": body.docDate
        }));
    Logger().d(response.request);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(json.decode(response.body)["message"]);
      return true;
    } else {
      throw Exception(json.decode(response.body));
    }
  }

}
