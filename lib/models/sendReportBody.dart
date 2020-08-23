import 'package:flutter/material.dart';

class SendReportBody {
  SendReportBody({
    @required this.name,
    this.email,
    @required this.content,
    @required this.subject,
    @required this.phone,
    @required this.location,
    @required this.docNumber,
    @required this.docDate,
  });

  String name;
  String email;
  String content;
  String subject;
  String phone;
  String location;
  String docNumber;
  String docDate;
}
