// App Design and Code Author: Raymond Colin Turner 
// Lead Developer/Software Engineer: Raymond Colin Turner.
// Copyright © 2020: Ellatronix Ltd.

// ** Start of Root Code ** //


import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: 
         AppDrawer(),
        appBar: AppBar(
        centerTitle: true ,title: const Text("Abouts Us",
        style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: SafeArea(
          child: Container(
          padding: const EdgeInsets.all(40),
              child: Text(
                'Established in 2000\n'
                'Tailored Scaffolding has since had a high interest in'
                'terms of keeping up to date with latest State-of-the-art Scaffolding Technologies and trends. '
                'Versatility & applicability, supports-infrastructure, resources, experience, compared to other organisations in this business. '
                'Tailored Scaffolding stress on effective innovation, economy, safety, speed of elevation right through to the dismantling of our scaffolding systems. '
                'Our equipment is manufactured to international standards to maintain uniformity. In particular, a tailored scaffolding system is considered one of londons leading specialists. '
                'There are a number of Innovative and highly efficient systems which have been introduced by us and are still being implemented in today’s market.'
                ' As a consequence a large number of leading construction Organisations in overseas countries are already adopting the Tailored Scaffolding Design.'
                ' With Our engineering skills, established experience and Innovation makes for good marketing and after-sales-services networks.',
            
              style: TextStyle(height: 1.7, fontSize: 14, letterSpacing: 0.0),
              softWrap: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}