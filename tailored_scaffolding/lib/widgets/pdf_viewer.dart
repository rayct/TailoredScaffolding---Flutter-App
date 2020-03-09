// App Design and Code Author: Raymond Colin Turner
// Lead Developer/Software Engineer: Raymond Colin Turner.
// Copyright © 2020: Ellatronix Ltd.


import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';


// ** Start of Root Code ** //

class PdfViewPage extends StatefulWidget {
  final String path;

  const PdfViewPage({Key key, this.path}) : super(key: key);
  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true ,title: const Text("Complaints Policy"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
                onPressed: () {
                  final RenderBox box = context.findRenderObject();
                    Share.share(" Share Something",
                      sharePositionOrigin:
                        box.localToGlobal(Offset.zero) &
                        box.size);
                      },
                    ),
                  ],
                ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            autoSpacing: true,
            enableSwipe: true,
            pageSnap: true,
            swipeHorizontal: true,
            nightMode: false,
            onError: (e) {
              print(e);
            },
            onRender: (_pages) {
              setState(() {
                _totalPages = _pages;
                pdfReady = true;
              });
            },
            onViewCreated: (PDFViewController vc) {
              _pdfViewController = vc;
            },
            onPageChanged: (int page, int total) {
              setState(() {});
            },
            onPageError: (page, e) {},
            ),
            !pdfReady
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Offstage()
          ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _currentPage > 0
            ? FloatingActionButton.extended(
                backgroundColor: Colors.black,
                label: Text("Go to ${_currentPage - 1}"),
                  onPressed: () {
                  _currentPage -= 1;
                  _pdfViewController.setPage(_currentPage);
                },
              )
            : Offstage(),
          _currentPage+1 < _totalPages
            ? FloatingActionButton.extended(
                backgroundColor: Colors.black54,
                label: Text("Go to ${_currentPage + 1}"),
                  onPressed: () {
                    _currentPage += 1;
                    _pdfViewController.setPage(_currentPage);
              },
            )
          : Offstage(),
        ],
      ),
    );
  }
}