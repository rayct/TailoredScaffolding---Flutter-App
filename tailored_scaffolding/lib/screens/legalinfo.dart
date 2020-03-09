// App Design and Code Author: Raymond Colin Turner 
// Lead Developer/Software Engineer: Raymond Colin Turner.
// Copyright © 2020: Ellatronix Ltd.


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../widgets/pdf_viewer.dart';


// ** Start of Root Code ** //

//void main() => runApp(MyApp());

class LegalInfo extends StatefulWidget {
  @override
  _LegalInfoState createState() => _LegalInfoState();
}

class _LegalInfoState extends State<LegalInfo> {
  String assetPDFPath = "";
  String urlPDFPath = "";

  @override
  void initState() {
    super.initState();

    getFileFromAsset("assets/documents/legaldisclaimer-ts.pdf").then((f) {
      setState(() {
        assetPDFPath = f.path;
        print(assetPDFPath);
      });
    });

    getFileFromUrl("https://firebasestorage.googleapis.com/v0/b/tailored-scaffolding.appspot.com/o/documents%2Fcomplaints-ts.pdf?alt=media&token=9d1116cc-34e2-475b-9f32-32e596273793").then((f) {
      setState(() {
        urlPDFPath = f.path;
        print(urlPDFPath);
      });
    });
  }

  Future<File> getFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/legaldisclaimer-ts.pdf");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }

  Future<File> getFileFromUrl(String url) async {
    try {
      var data = await http.get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mypdfonline.pdf");

      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter PDF Tutorial"),
        ),
        body: Center(
          child: Builder(
            builder: (context) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.amber,
                      child: Text("Open from URL"),
                      onPressed: () {
                        if (urlPDFPath != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PdfViewPage(path: urlPDFPath)));
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      color: Colors.cyan,
                      child: Text("Open from Asset"),
                      onPressed: () {
                        if (assetPDFPath != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PdfViewPage(path: assetPDFPath)));
                        }
                      },
                    )
                  ],
                ),
          ),
        ),
      ),
    );
  }
}