// App Design and Code Author: Raymond C. TURNER
// Lead Developer/Software Engineer: Raymond C. TURNER
// Copyright © 2020: Ellatronix Ltd. and Codestak.io

// ** Start of Root Code ** //

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../screens/fullscreen_image.dart';
import '../widgets/main_drawer.dart';
import 'dart:async';

// *************** TO DO ************** //
// ***** Implement Pinch and Zoom ***** //

class ImageGallery extends StatefulWidget {
  @override
  _ImageGallery createState() => new _ImageGallery();
}

class _ImageGallery extends State<ImageGallery> {
  //Uint8List imagesList;
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> imagesList;

  final CollectionReference collectionReference =
      Firestore.instance.collection("images");

  // @override
  // void initState(){
  //   super.initState();
  //   if(!imageData.containsKey(widget._index)){
  //     getImage();
  //   } else {
  //     this.setState((){
  //       imagesData = imageData[widget._index];
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        imagesList = datasnapshot.documents;
      });
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      endDrawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Image Gallery",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: imagesList != null
          ? new StaggeredGridView.countBuilder(
              padding: const EdgeInsets.all(8.0),
              crossAxisCount: 4,
              itemCount: imagesList.length,
              itemBuilder: (context, i) {
                String imgPath = imagesList[i].data['url'];
                return new Material(
                  elevation: 7.0,
                  borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
                  child: new InkWell(
                    onTap: () {
                      //_sendAnalytics();
                      //createInterstitialAd()
                      //..load()
                      //..show();
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  new FullScreenImage(imgPath)));
                    },
                    child: new Hero(
                      tag: imgPath,
                      child: new FadeInImage(
                        fadeInDuration: const Duration(milliseconds: 1),
                        image: new NetworkImage(imgPath),
                        fit: BoxFit.cover,
                        placeholder:
                            new AssetImage('assets/images/TSLogo/ts_igph.png'),
                      ),
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (i) =>
                  new StaggeredTile.count(2, i.isEven ? 2 : 3),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            )
          : new Center(
              child: new CircularProgressIndicator(),
            ),
    ));
  }
}

// @override
//   void initState(){
//     super.initState();
//     if(!imageData.containsKey(widget._index)){
//       getImage();
//     } else {
//       this.setState((){
//         imageFile = imageData[widget._index];
//       });
//     }
//   }
