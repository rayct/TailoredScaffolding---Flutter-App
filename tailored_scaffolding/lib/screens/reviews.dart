// App Design and Code Author: Raymond Colin Turner
// Lead Developer/Software Engineer: Raymond Colin Turner.
// Copyright © 2020: Ellatronix Ltd.

//..Start of Root Code..//

import '../widgets/web_view_container.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class Reviews extends StatelessWidget {
  Reviews({Key key}) : super(key: key);

  // === static URL links === //
  // == 'https://trustedtraders.which.co.uk/businesses/tailored-scaffolding' ==/
  // == 'https://www.checkatrade.com/TailoredScaffolding' ==/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: AppDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Feedback and Reviews",
            style: const TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),

                  // Which Trusted Traders: Image Button 1 //
                  Container(
                    color: Colors.white,
                    child: FlatButton(
                      splashColor: Colors.grey[300],
                      highlightColor: Colors.white,
                      color: Colors.white,
                      padding: EdgeInsets.all(25.0),
                      onPressed: () {
                        // Navigator.pop(context); // Closes the Drawer
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViewContainer(
                                'https://trustedtraders.which.co.uk/businesses/tailored-scaffolding'),
                          ),
                        );
                      },
                      child: Image.asset(
                          "assets/images/AccreditorsLogo/lg-4.png"), // Which Logo
                    ),
                  ),

                  // Checkatrade: Image Button 2 //
                  Container(
                    color: Colors.white,
                    child: FlatButton(
                      splashColor: Colors.grey[300],
                      highlightColor: Colors.white,
                      color: Colors.white,
                      padding: EdgeInsets.all(25.0),
                      onPressed: () {
                        // Navigator.pop(context); // Closes the Drawer
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViewContainer(
                                'https://www.checkatrade.com/TailoredScaffolding'),
                          ),
                        );
                      },
                      child: Image.asset(
                          "assets/images/AccreditorsLogo/lg-1.png"), // Checkatrade Logo
                    ),
                  ),

                  // CSCS: Image Button 3 //
                  Container(
                    color: Colors.white,
                    child: FlatButton(
                      splashColor: Colors.grey[300],
                      highlightColor: Colors.white,
                      color: Colors.white,
                      onPressed: () {},
                      padding: EdgeInsets.all(25.0),
                      child:
                          Image.asset("assets/images/AccreditorsLogo/lg-3.png"),
                    ),
                  ),

                  // CISRS: Image Button 4 //
                  Container(
                    color: Colors.white,
                    child: FlatButton(
                      splashColor: Colors.grey[300],
                      highlightColor: Colors.white,
                      color: Colors.white,
                      onPressed: () {},
                      padding: EdgeInsets.all(25.0),
                      child:
                          Image.asset("assets/images/AccreditorsLogo/lg-2.png"),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
