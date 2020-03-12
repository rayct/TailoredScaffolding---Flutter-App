// App Design and Code Author: Raymond Colin Turner 
// Lead Developer/Software Engineer: Raymond Colin Turner.
// Copyright © 2020: Ellatronix Ltd.

// ** Start of Root Code ** //

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:url_launcher/url_launcher.dart";
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';


  class ContactUs extends StatelessWidget {

  final String lat = "51.386555";
  final String lng = "0.160236";

  final String jasonsNumber = "07972612395";
  final String terrysNumber = "07944136117";
  final String emailAddress = "info@tailoredscaffolding.com";
  final String jasonemailAddress = "jason.bacon01@btinternet.com";
  final String smsJason = "07972612395";
  final String smsTerry = "07944136117";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: 
         AppDrawer(),
          appBar: AppBar(
          centerTitle: true ,title: const Text("Contact Us",
          style: TextStyle(color: Colors.white),
        ),
       ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Google Maps
                  ListTile(
                    leading: Icon(FontAwesomeIcons.mapMarkerAlt),
                    selected: false,
                    title: Text("Structure Office",
                    style: TextStyle(
                      letterSpacing: 0.50, fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black
                        ),
                      ),
                      subtitle: Text("Marwood House\n" "Stones Cross Road\n" "Crockenhill\n" "Kent\n" "BR8 8LT\n",
                      style: TextStyle(
                      letterSpacing: 0.0, fontSize: 16.0, color: Colors.black
                        ),
                      ),
                      onTap: () async {
                        final String googleMapsUrl = "comgooglemaps://?center=$lat,$lng";
                        final String appleMapsUrl = "https://maps.apple.com/?q=$lat,$lng";

                      if (await canLaunch(googleMapsUrl)) {
                          await launch(googleMapsUrl);
                      }
                      if (await canLaunch(appleMapsUrl)) {
                          await launch(appleMapsUrl, forceSafariVC: false);
                    } else {
                          throw "Couldn't launch URL";
                      }
                    },
                  // Jason's Phone Number
                  ),
                  ListTile(
                    leading: Icon(Icons.phone_in_talk),
                    selected: false,
                    title: Text("Call Jason",
                    style: TextStyle(
                      letterSpacing: 0.0, fontSize: 16.0, color: Colors.black
                      ),
                    ),
                      onTap: () async {
                        String telephoneUrl = "tel:$jasonsNumber";

                      if (await canLaunch(telephoneUrl)) {
                          await launch(telephoneUrl);
                    } else {
                          throw "Can't phone that number.";
                      }
                    },
                  ),
                  // Terry's Phone Number
                  ListTile(
                    leading: Icon(Icons.phone_in_talk),
                    selected: false,
                    title: Text("Call Terry",
                    style: TextStyle(
                      letterSpacing: 0.0, fontSize: 16.0, color: Colors.black
                      ),
                    ),
                      onTap: () async {
                        String telephoneUrl = "tel:$terrysNumber";

                      if (await canLaunch(telephoneUrl)) {
                          await launch(telephoneUrl);
                    } else {
                          throw "Can't phone that number.";
                      }
                    },
                  ),
                  // Website Address
                  ListTile(
                    leading: Icon(Icons.web),
                    selected: false,
                    title: Text("Website",
                    style: TextStyle(
                      letterSpacing: 0.0, fontSize: 16.0, color: Colors.black
                      ),
                    ),
                      onTap: () async {
                        const url = "https:www.tailoredscaffolding.com";
                      if (await canLaunch(url)) {
                          await launch(url, forceWebView: true);
                    } else {
                          throw "Could not launch $url";
                      }
                    },
                  ),
                  // Email Function - Tailored Scaffolding
                  ListTile(
                    leading: Icon(Icons.email),
                    selected: false,
                    title: Text("info@tailoredscaffolding.com",
                    style: TextStyle(
                      letterSpacing: 0.0, fontSize: 16.0, color: Colors.black
                      ),
                    ),
                    onTap: () async {
                      const emailaddress = 'mailto:info@tailoredscaffolding.com?subject=Sample Subject&body=This is a Sample email for Tailored Scaffolding';
                      if(await canLaunch(emailaddress)) {
                        await launch(emailaddress);
                      }  else {
                        throw 'Could not Email';
                      }   
                    },
                  ),
                  // Email Function - Jason Bacon BTinternet
                  ListTile(
                    leading: Icon(Icons.email),
                    selected: false,
                    title: Text("jason.bacon01@btinternet.com",
                    style: TextStyle(
                      letterSpacing: 0.0, fontSize: 16.0, color: Colors.black
                      ),
                    ),
                    onTap: () async {
                      const jasonemailaddress = 'mailto:jason.bacon01@btinternet.com?subject=Sample Subject&body=This is a Sample email for Jason Bacon';
                      if(await canLaunch(jasonemailaddress)) {
                        await launch(jasonemailaddress);
                      }  else {
                        throw 'Could not Email';
                      }   
                    },
                  ),
                  // SMS Jason
                  ListTile(
                    leading: Icon(FontAwesomeIcons.sms),
                    selected: false,
                    title: Text("SMS Jason",
                    style: TextStyle(
                      letterSpacing: 0.0, fontSize: 16.0, color: Colors.black
                      ),
                    ),
                    onTap: () async {
                      const phonenumber = "sms:07972612395";
                      if(await canLaunch(phonenumber)) {
                        await launch(phonenumber);
                      }  else {
                        throw 'Could not Send Text Message';
                      }
                    }
                  ),
                  // SMS Terry
                  ListTile(
                    leading: Icon(FontAwesomeIcons.sms),
                    selected: false,
                    title: Text("SMS Terry",
                    style: TextStyle(
                      letterSpacing: 0.0, fontSize: 16.0, color: Colors.black
                      ),
                    ),
                    onTap: () async {
                      const phonenumber = "sms:07944136117";
                      if(await canLaunch(phonenumber)) {
                        await launch(phonenumber);
                      }  else {
                        throw 'Could not Send Text Message';
                      }
                    }
                  )
              ]
            ),
          ),
        );
      }
    }