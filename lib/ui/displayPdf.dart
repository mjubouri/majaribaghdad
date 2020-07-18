import 'dart:async';

import 'package:flutter/material.dart';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:native_pdf_view/native_pdf_view.dart';

class PDFScreen extends StatefulWidget {
 // final String path;

  PDFScreen({Key key}) : super(key: key);

  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {

 PdfController _pdfController;

@override
  void initState() {
  _pdfController = PdfController(
      document: PdfDocument.openAsset('assets/pdf.pdf'),
    );
    super.initState();
  }
 @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }
  // void _loadFromAssets() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   doc = await PDFDocument.fromAsset('assets/pdf.pdf');
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  // void _loadFromUrl() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   doc = await PDFDocument.fromURL(
  //       'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf');
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
     title: Directionality(textDirection: TextDirection.rtl,
        child: Text("الهيكل التنظيمي")),
      ),
      body: PdfView(
            documentLoader: Center(child: CircularProgressIndicator()),
            pageLoader: Center(child: CircularProgressIndicator()),
            controller: _pdfController,
           
          
          ),
    );
  }
 

}