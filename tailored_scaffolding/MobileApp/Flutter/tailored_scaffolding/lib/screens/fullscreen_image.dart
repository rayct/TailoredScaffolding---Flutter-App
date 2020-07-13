// App Design and Code Author: Raymond Colin Turner
// Lead Developer/Software Engineer: Raymond Colin Turner.
// Copyright © 2020: Ellatronix Ltd.

//..Start of Root Code..//

import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  String imgPath;
  @override
  FullScreenImage(this.imgPath);
  final LinearGradient backgroundGradient = new LinearGradient(
      colors: [new Color(0x10000000), new Color(0x30000000)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  // this.webView.getSettings().setSupportZoom(true);
  // this.webView.getSettings().setBuiltInZoomControls(true);

//================================= TO DO ================================//
//====================== Change Scaffold to Safe Area ====================//
  // ************** TO DO **************** //
  // ********** ADD IMAGE CROP *********** //

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //return new Scaffold(
        body: new SizedBox.expand(
          child: new Container(
            decoration: new BoxDecoration(gradient: backgroundGradient),
            child: new Stack(
              children: <Widget>[
                new Align(
                  alignment: Alignment.center,
                  child: new Hero(
                    tag: imgPath,
                    child: new Image.network(imgPath),
                  ),
                ),
                new Align(
                  alignment: Alignment.topCenter,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new AppBar(
                        elevation: 0.0,
                        backgroundColor: Colors.transparent,
                        leading: new IconButton(
                          icon: new Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
