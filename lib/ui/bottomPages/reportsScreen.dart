import 'dart:ui';

import 'package:SewerBaghdad/bloc/reportBloc.dart';
import 'package:SewerBaghdad/models/sendReportBody.dart';
import 'package:SewerBaghdad/repository/posts_repository.dart';
import 'package:SewerBaghdad/ui/customWidget/circularProgress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:toast/toast.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController docNumber = TextEditingController();
  TextEditingController docDate = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) {
          return ReportBloc(repo: PostsRepository());
        },
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Directionality(
                      child: Text(
                        "تقديم شكوى",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    Container(
                        child: Icon(
                          Icons.assignment,
                          color: Theme.of(context).primaryColor,
                          size: 28,
                        ),
                        margin: EdgeInsets.only(left: 5, right: 10)),
                  ],
                ),
              ),
              Directionality(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: Colors.deepOrangeAccent,
                        primaryColorDark: Colors.red,
                      ),
                      child: TextField(
                        controller: name,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 20),
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0),
                              ),
                            ),
                            hoverColor: Colors.amber,
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            hintText: "",
                            alignLabelWithHint: true,
                            labelText: "الأسم الكامل",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                backgroundColor: Colors.transparent,
                                decorationColor: Colors.transparent),
                            prefixIcon: const Icon(Icons.person),
                            helperText: "يرجى ادخال الأسم الكامل",
                            contentPadding: EdgeInsets.only(
                                left: 6, right: 6, top: 0, bottom: 15),
                            fillColor: Colors.white70),
                      ),
                    ),
                  ),
                  textDirection: TextDirection.rtl),
              Directionality(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: Colors.deepOrangeAccent,
                        primaryColorDark: Colors.red,
                      ),
                      child: TextField(
                        controller: location,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 20),
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0),
                              ),
                            ),
                            hoverColor: Colors.amber,
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            hintText: "",
                            alignLabelWithHint: true,
                            labelText: "العنوان",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                backgroundColor: Colors.transparent,
                                decorationColor: Colors.transparent),
                            prefixIcon: const Icon(Icons.pin_drop),
                            helperText: "أدخل العنوان",
                            contentPadding: EdgeInsets.only(
                                left: 6, right: 6, top: 0, bottom: 15),
                            fillColor: Colors.white70),
                      ),
                    ),
                  ),
                  textDirection: TextDirection.rtl),
              Directionality(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: Colors.deepOrangeAccent,
                        primaryColorDark: Colors.red,
                      ),
                      child: TextField(
                        controller: subject,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 18),
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0),
                              ),
                            ),
                            hoverColor: Colors.amber,
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            hintText: "",
                            alignLabelWithHint: true,
                            labelText: "موضوع الشكوى",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                backgroundColor: Colors.transparent,
                                decorationColor: Colors.transparent),
                            prefixIcon: const Icon(Icons.subject),
                            helperText: "يرجى أدخال موضوع الشكوى",
                            contentPadding: EdgeInsets.only(
                                left: 6, right: 6, top: 0, bottom: 15),
                            fillColor: Colors.white70),
                      ),
                    ),
                  ),
                  textDirection: TextDirection.rtl),
              Directionality(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: Colors.deepOrangeAccent,
                        primaryColorDark: Colors.red,
                      ),
                      child: TextField(
                        controller: content,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: TextStyle(fontSize: 18),
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0),
                              ),
                            ),
                            hoverColor: Colors.amber,
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            hintText: "",
                            alignLabelWithHint: true,
                            labelText: "تفاصيل الشكوى",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                backgroundColor: Colors.transparent,
                                decorationColor: Colors.transparent),
                            prefixIcon: const Icon(Icons.details),
                            helperText: "يرجى أدخال تفاصيل الشكوى",
                            contentPadding: EdgeInsets.only(
                                left: 6, right: 6, top: 0, bottom: 15),
                            fillColor: Colors.white70),
                      ),
                    ),
                  ),
                  textDirection: TextDirection.rtl),
              Directionality(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: Colors.deepOrangeAccent,
                        primaryColorDark: Colors.red,
                      ),
                      child: TextField(
                        maxLength: 11,
                        controller: phone,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(fontSize: 18),
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0),
                              ),
                            ),
                            hoverColor: Colors.amber,
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            hintText: "",
                            alignLabelWithHint: true,
                            labelText: "رقم الهاتف",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                backgroundColor: Colors.transparent,
                                decorationColor: Colors.transparent),
                            prefixIcon: const Icon(Icons.phone),
                            helperText: "يرجى أدخال رقم الهاتف",
                            contentPadding: EdgeInsets.only(
                                left: 6, right: 6, top: 0, bottom: 15),
                            fillColor: Colors.white70),
                      ),
                    ),
                  ),
                  textDirection: TextDirection.rtl),
              Directionality(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: Colors.deepOrangeAccent,
                        primaryColorDark: Colors.red,
                      ),
                      child: TextField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 18),
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0),
                              ),
                            ),
                            hoverColor: Colors.amber,
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            hintText: "",
                            alignLabelWithHint: true,
                            labelText: "البريد الألكتروني",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                backgroundColor: Colors.transparent,
                                decorationColor: Colors.transparent),
                            prefixIcon: const Icon(Icons.email),
                            helperText: "يرجى ادخال البريد الألكتروني",
                            contentPadding: EdgeInsets.only(
                                left: 6, right: 6, top: 0, bottom: 15),
                            fillColor: Colors.white70),
                      ),
                    ),
                  ),
                  textDirection: TextDirection.rtl),
              Directionality(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: Colors.deepOrangeAccent,
                        primaryColorDark: Colors.red,
                      ),
                      child: TextField(
                        controller: docNumber,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(fontSize: 18),
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0),
                              ),
                            ),
                            hoverColor: Colors.amber,
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            hintText: "",
                            alignLabelWithHint: true,
                            labelText: "رقم وصل الجباية",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                backgroundColor: Colors.transparent,
                                decorationColor: Colors.transparent),
                            prefixIcon: const Icon(Icons.insert_drive_file),
                            helperText: "يرجى ادخال رقم وصل الجباية",
                            contentPadding: EdgeInsets.only(
                                left: 6, right: 6, top: 0, bottom: 15),
                            fillColor: Colors.white70),
                      ),
                    ),
                  ),
                  textDirection: TextDirection.rtl),
              Directionality(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: Colors.deepOrangeAccent,
                        primaryColorDark: Colors.red,
                      ),
                      child: GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextField(
                            controller: docDate,
                            keyboardType: TextInputType.datetime,
                            style: TextStyle(fontSize: 18),
                            decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(20.0),
                                  ),
                                ),
                                hoverColor: Colors.amber,
                                filled: true,
                                hintStyle:
                                    new TextStyle(color: Colors.grey[800]),
                                hintText: "",
                                alignLabelWithHint: true,
                                labelText: "تاريخ وصل الجباية",
                                labelStyle: TextStyle(
                                    fontSize: 18,
                                    backgroundColor: Colors.transparent,
                                    decorationColor: Colors.transparent),
                                prefixIcon: const Icon(Icons.date_range),
                                helperText: "يرجى ادخال تاريخ وصل الجباية",
                                contentPadding: EdgeInsets.only(
                                    left: 6, right: 6, top: 0, bottom: 15),
                                fillColor: Colors.white70),
                          ),
                        ),
                      ),
                    ),
                  ),
                  textDirection: TextDirection.rtl),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: BlocBuilder<ReportBloc, ReportState>(
                        builder: (context, state) {
                      if (state is SendingReport) {
                        return Container(
                            width: 35,
                            height: 35,
                            child: Container(
                                width: 30, child: CircularProgress()));
                      }

                      if (state is ReportUninitialized) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: EdgeInsets.only(
                              top: 10, bottom: 10, left: 20, right: 20),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: RaisedButton(
                              color: Theme.of(context).primaryColor,
                              elevation: 5,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text("أرسال",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ),
                              onPressed: () async {
                                if (name.text.isNotEmpty &&
                                    location.text.isNotEmpty &&
                                    subject.text.isNotEmpty &&
                                    phone.text.isNotEmpty &&
                                    content.text.isNotEmpty) {
                                  BlocProvider.of<ReportBloc>(context).add(
                                      SendReport(
                                          SendReportBody(
                                              name: name.text,
                                              content: location.text,
                                              email: email.text,
                                              subject: subject.text,
                                              phone: phone.text,
                                              location: location.text,
                                              docDate: docDate.text,
                                              docNumber: docNumber.text),
                                          context: context));
                                } else if (phone.text.length < 11) {
                                  Toast.show(
                                      "يرجى أدخال رقم هاتف صحيح", context,
                                      duration: Toast.LENGTH_LONG,
                                      gravity: Toast.BOTTOM);
                                } else {
                                  Toast.show("يرجى أكمال جميع الحقول", context,
                                      duration: Toast.LENGTH_LONG,
                                      gravity: Toast.BOTTOM);
                                }
                              },
                            ),
                          ),
                        );
                      } else
                        return Container();
                        })
                  //

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    return DatePicker.showDatePicker(
        context, dateFormat: 'yyyy-M-d',
        locale: DateTimePickerLocale.ar,
        onConfirm: (date, value) {
          setState(() {
            docDate.text = date.toString();
          });
        });
  }

}
