// App Design and Code Author: Raymond Colin Turner 
// Lead Developer/Software Engineer: Raymond Colin Turner.
// Copyright © 2020: Ellatronix Ltd.

// ** Start of Root Code ** //


//import 'dart:io';
import 'package:flutter/material.dart';

class CameraFAB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CameraFABState();
  }
}


class _CameraFABState extends State<CameraFAB> {
  @override
    Widget build(BuildContext context) {
      return FloatingActionButton(
        onPressed:() {},
        child: Icon(Icons.camera),
    );
  }
}
