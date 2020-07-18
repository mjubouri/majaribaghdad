

import 'package:flutter/material.dart';

class SendReportBody {
    SendReportBody({
        @required this.name,
         this.email,
        @required this.content,
        @required this.subject,
        @required this.phone,
        @required this.location,
    });

    String name;
    String email;
    String content;
    String subject;
    String phone;
    String location;
}
