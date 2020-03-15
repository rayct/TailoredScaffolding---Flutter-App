// App Design and Code Author: Raymond Colin Turner 
// Lead Developer/Software Engineer: Raymond Colin Turner.
// Copyright © 2020: Ellatronix Ltd.


import 'dart:io';
import 'dart:async';
// import 'package:pdf/widgets.dart' as pdf;
// import 'package:pdf/pdf.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
// import 'package:printing/printing.dart';
import '../widgets/pdf_viewer.dart';
import '../widgets/main_drawer.dart';


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
      final File file = File("${dir.path}/legaldisclaimer-ts.pdf");

      final File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      // Printing.printpdf(document:pdf);
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

      // final output = await getTemporaryDirectory();
      // final file = File("${output.path}/complaints-ts.pdf");
      // File urlFile = await file.writeAsBytes(pdf.save());
      // await Printing.layoutPdf(
      //   onLayout: (PdfPageFormat format) async => pdf.save());

      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // debugShowCheckedModeBanner: false,
      child: Scaffold(
        endDrawer:
      AppDrawer(),
        appBar: AppBar(
          centerTitle: true ,title: const Text("Legal Information"),
        ),
        body: Container(
          child: Center(
            child: Builder(
              builder: (context) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,

  // ** BUTTON ONE ** //
  children: <Widget>[
    FlatButton(
      color: Colors.black,
        textColor: Colors.white,
        padding: EdgeInsets.fromLTRB(55, 25, 55, 25),
        //splashColor: Colors.grey[600],
          child: Text("Complaints Policy", style: TextStyle(fontSize: 16)),
            //Icon(Icons.photo_album),
              onPressed: () {
              //var urlPDFPath;
              if (urlPDFPath != null) {
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) =>
                      PdfViewPage(path: urlPDFPath
                    ),
                  ),
                );
              }
            },
          ),
        // ** BUTTON TWO ** //
        SizedBox(
        height: 30,
        ),
          FlatButton(
            color: Colors.black,
              textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(60, 25, 60, 25),
                //splashColor: Colors.grey[600],
                  child: Text("Legal Disclaimer", style: TextStyle(fontSize: 16)),
                    onPressed: () {
                    //var urlMyPDFPath;
                    if (assetPDFPath != null) {
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) =>
                            PdfViewPage(path: assetPDFPath
                            ),
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}