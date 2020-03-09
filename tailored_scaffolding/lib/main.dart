// App Design and Code Author: Raymond Colin Turner 
// Lead Developer/Software Engineer: Raymond Colin Turner.
// Copyright © 2020: Ellatronix Ltd.

// ** Start of Root Code ** //

import 'package:flutter/material.dart';
import 'screens/landing_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Tailored Scaffolding',
          //debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Color(0xff242B3E),
            //primaryColor: Color(0xff1C273D),
            accentColor: Colors.deepOrange,
          ),
          initialRoute: LandingScreen.id,
          routes: {
            LandingScreen.id: (context) => LandingScreen(),
      },
    );
  } 
}
