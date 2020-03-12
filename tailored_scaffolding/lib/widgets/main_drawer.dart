
// App Design and Code Author: Raymond Colin Turner 
// Lead Developer/Software Engineer: Raymond Colin Turner.
// Copyright © 2020: Ellatronix Ltd.

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../widgets/web_view_container.dart';
import '../screens/imagegallery.dart';
import '../screens/contactus.dart';
import '../screens/services.dart';
import '../screens/reviews.dart';
import '../screens/AboutUs.dart';
import '../screens/legalinfo.dart';
import '../screens/help.dart';
// import '../widgets/full_pdf_viewer.dart';


// ** Start of Root Code ** //

const String _AccountEmail = 'info@tailoredscaffolding.com';

class AppDrawer extends StatelessWidget {
  final String title;
  AppDrawer({Key key, this.title, bool centerTitle, AppBar appBar, Container body}) : super(key: key);

  String get pathPDF => null;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      //body: SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              padding: const EdgeInsets.all(2.0),
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  'Jason Bacon / Terry Crump',
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: const Text(
                  _AccountEmail,
                  style: TextStyle(color: Colors.white),
                ),
                currentAccountPicture:
                    Image.asset('assets/images/TSLogo/logo_0.png'),
                decoration: BoxDecoration(
                    //color: Colors.indigo[900]
                    color: Color(0xff242B3E)),
                ),
                decoration: BoxDecoration(
                  //color: Colors.indigo[900]
                  color: Color(0xff242B3E))),

          // SizedBox(
          //   height: 10.0,
          //         ),
          ListTile(
            title: Text("Services"),
            leading: Icon(Icons.build),
            onTap: () {
              // Update the state of the app
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Services()));
              // Then close the drawer
            },
          ),
          ListTile(
            title: Text("Image Gallery"),
            leading: Icon(Icons.photo_library),
            onTap: () {
              // Update the state of the app
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ImageGallery()));
              // Then close the drawer
            },
          ),
          ListTile(
            title: Text("Trusted Reviews"),
            leading: Icon(Icons.people),
            onTap: () {
              // Update the state of the app
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Reviews()));
              // Then close the drawer
            },
          ),
          ListTile(
            title: Text("Contact Us"),
            leading: Icon(Icons.phone),
            onTap: () {
              // Update the state of the app
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUs()));
              // Then close the drawer
            },
          ),
          ListTile(
            title: Text("About Us"),
            //leading: Icon(Icons.info),
            leading: Icon(
              FontAwesomeIcons.infoCircle,
            ),

            onTap: () {
              // Update the state of the app
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutUs()));
              // Then close the drawer
            },
          ),
          ListTile(
            title: Text("Legal"),
            leading: Icon(Icons.account_balance),
            onTap: () {
              // Update the state of the app
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LegalInfo()));
              // Then close the drawer
            },
          ),
          ListTile(
            title: Text("Help"),
            leading: Icon(Icons.help),
            //leading: Icon(FontAwesomeIcons.,),
            onTap: () {
              // Update the state of the app
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Help()));
              // Then close the drawer
            },

            //=================== Bottom Drawer Section ==========================================//
          ),
          SizedBox(
            height: 1.0,
          ),
          Container(
            // This align moves the children to the bottom
            child: Align(
              alignment: FractionalOffset.center,
              // This container holds all the children that will be aligned
              // on the bottom and should not scroll with the above ListView
              child: Container(
                child: Column(children: <Widget>[
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 35.0,
                  ),

//============================= Social Media For Bottom Drawer =====================//

                  ListTile(
                    title: Text("Facebook"),
                    //leading: Icon(FontAwesomeIcons.facebookSquare, color: Color(0xff3351a3),),
                    leading: Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.black,
                    ),
                    onTap: () {
                      // Navigator.pop(context); // Closes the Drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewContainer(
                              'https://www.facebook.com/jasonandterry/?__tn__=%2Cd%2CP-R&eid=ARDWvt7BhBlgYed9DiyU2b1QZ1H4CcRMDPSvhivk9cZqnaQ6oQUV-H2--5BTq5-j6Lsj-9bBea3KkxBW'),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text("Twitter"),
                    leading: Icon(
                      FontAwesomeIcons.twitter,
                      color: Colors.black,
                    ),
                    //leading: Icon(FontAwesomeIcons.twitter, color: Color(0xff1d8eee),),
                    onTap: () {
                      // Navigator.pop(context); // Closes the Drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              WebViewContainer('https://twitter.com'),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text("Instagram"),
                    leading: Icon(
                      FontAwesomeIcons.instagram,
                      color: Colors.black,
                    ),
                    //leading: Icon(FontAwesomeIcons.twitter, color: Color(0xff1d8eee),),
                    onTap: () {
                      // Navigator.pop(context); // Closes the Drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewContainer(
                              'https://www.instagram.com/tailored_scaffolding'),
                        ),
                      );
                    },

                    // ListTile(
                    // title: Text("Facebook"),
                    // leading: Icon(FontAwesomeIcons.facebookF, color: Colors.black,),
                    // onTap: ()  async {
                    //   var url = 'https://www.facebook.com/jasonandterry/?__tn__=%2Cd%2CP-R&eid=ARDWvt7BhBlgYed9DiyU2b1QZ1H4CcRMDPSvhivk9cZqnaQ6oQUV-H2--5BTq5-j6Lsj-9bBea3KkxBW';
                    //   if (await canLaunch(url)) {
                    //       await launch(url, forceWebView: false);
                    //   } else {
                    //       throw "Could not launch $url";
                    //       // Then close the drawer
                    //   }
                    // }
                    // ),
                    // ),
                    // ListTile(
                    // title: Text("Twitter"),
                    // leading: Icon(FontAwesomeIcons.twitter),
                    // onTap: () async {
                    //   var url = 'https://twitter.com/';
                    //   if (await canLaunch(url)) {
                    //     await launch(url, forceWebViewContainer: true);
                    //   } else {
                    //     throw 'Could not launch $url';
                    //     // Then close the drawer
                    //   }
                    // }
                    // ),
                    // ListTile(
                    // title: Text("Instagram"),
                    // leading: Icon(FontAwesomeIcons.instagram, color: Colors.black),
                    // onTap: () async {
                    //   var url = 'https://www.instagram.com/tailored_scaffolding';
                    //   if (await canLaunch(url)) {
                    //       await launch(url,); /*forceWebView: true);*/
                    //   } else {
                    //       throw "Could not launch $url";
                    //       // Then close the drawer
                    //   }
                    // },
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
