 // App Design and Code Author: Raymond Colin Turner
// Lead Developer/Software Engineer: Raymond Colin Turner.
// Copyright © 2020 Ellatronix Ltd.

// ** Start of Root Code ** //

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tailored_scaffolding/widgets/image_input.dart';
//import 'package:tailored_scaffolding/widgets/image.dart';
import '../widgets/main_drawer.dart';
//import '../widgets/image_picker.dart';
//import 'dart:io';
//import 'dart:async';
//import 'submit_contact.dart';
//import 'contact_server.dart';
//import '../widgets/image.dart';
//import 'package:intl/intl.dart';
//import '../ui_elements/camera_fab.dart';
//import 'package:tailored_scaffolding/ui_elements/camera_fab.dart';

//................ App Drawer Set to Right Side .............................//
class LandingScreen extends StatefulWidget {
  static String id = 'LandingScreen';
  LandingScreen({Key key, this.title}) : super(key: key);
  final String title;

  //SubmitContact newSubmitContact = new SubmitContact();

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }

  @override
  _LandingScreenState createState() => new _LandingScreenState();
}

bool isValidEmail(String input) {
  final RegExp regex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  return regex.hasMatch(input);
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class _LandingScreenState extends State<LandingScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //var _submitForm;
    var newSubmitContact;
    return Scaffold(
      key: _scaffoldKey,

      //return SafeArea(
      //child: Scaffold(
      //------------------------------- Drawer -----------------------------------//
      endDrawer: AppDrawer(),
      //------------------------------ Top App Bar --------------------------------//
      appBar: AppBar(
        //centerTitle: true ,title: const Text("Quick Quote" ,style: TextStyle(color: Color(0xff283961)),),
        centerTitle: true,
        title: const Text(
          "Quick Quote",
          style: TextStyle(color: Colors.white),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      // onPressed:() {

      // },
      // child: Icon(Icons.add_a_photo,color: Colors.black,),
      // //backgroundColor: Colors.orange,
      // backgroundColor: Color(0xffFFCE00),

      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //       ),
      //     );
      //   }

      //   Future imagepicker() async {
      //     var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      //     setState(() {
      //       _image = image;
      //     });
      //   }
      // }

      backgroundColor: Colors.white,
      body: new Center(
        child: SafeArea(
          child: new Form(
            key: _formKey,
            autovalidate: true,
            child: new ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),

                Container(
                  padding: EdgeInsets.all(9.0),
                  width: 200,
                  child: SafeArea(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(30)
                      ],
                      validator: (val) =>
                          val.isEmpty ? 'Name is required' : null,
                      onSaved: (val) => newSubmitContact.name = val,
                      decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.black)),
                          prefixIcon: Icon(Icons.people),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Color(0xffFD9609))
                              //borderSide: BorderSide(color: Colors.deepOrange)
                              ),
                          labelText: "Name."),
                    ),
                  ),
                ),

                //................ Email Text Field ..................//

                //SizedBox(
                //height: 05.0,
                //),
                Container(
                  padding: EdgeInsets.all(9.0),
                  width: 200,
                  child: SafeArea(
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(30)
                      ],
                      decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide:
                                  BorderSide(color: Colors.indigo[900])),
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              //borderSide: BorderSide(color: Color(0xffFD9609))
                              borderSide: BorderSide(color: Colors.deepOrange)),
                          labelText: "Email."),
                    ),
                  ),
                ),

                //................ Phone Text Field ..................//

                //SizedBox(
                //height: 05.0,
                //),

                Container(
                  padding: EdgeInsets.all(9.0),
                  width: 200,
                  child: SafeArea(
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      //validator: (value) => isValidPhoneNumber(value) ? null : 'Phone number must be entered as (###)###-####',
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.black)
                              //borderSide: BorderSide(color: Color(0xff1C273D)
                              ),
                          prefixIcon: Icon(Icons.phone_in_talk),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              //borderSide: const BorderSide(color: Color(0xffFD9609))
                              borderSide: BorderSide(color: Colors.deepOrange)),
                          labelText: "Phone."),
                    ),
                  ),
                ),

                // SizedBox(
                //   height: 50.0,
                // ),

                ImageInput(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//],
//),
//),
//],

//  Container(
//   child: Column(
//     children: <Widget>[
//       FlatButton(
//         child: Icon(Icons.send, color: Colors.black,),
//         //child: Text("Submit"),
//         shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(14.0),
//         ),
//         color: Color(0xffFFCE00),
//         textColor: Colors.black,
//     //padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
//     padding: EdgeInsets.all(20.0),
//       onPressed: () {},

// bottomNavigationBar: BottomAppBar(
//   shape: CircularNotchedRectangle(),
//   color: Colors.white,
//   notchMargin: 2.0,
//   clipBehavior: Clip.antiAlias,
// child: new Row(
//   mainAxisSize: MainAxisSize.max,
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: <Widget>[
//     IconButton(icon: Icon(Icons.home), onPressed: () {},),
//     IconButton(icon: Icon(Icons.share), onPressed: () {},),
//     ],
//   ),
// ),
