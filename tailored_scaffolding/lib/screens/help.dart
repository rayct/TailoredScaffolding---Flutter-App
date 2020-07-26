// App Design and Code Author: Raymond Colin Turner
// Lead Developer/Software Engineer: Raymond Colin Turner.
// Copyright © 2020: Ellatronix Ltd.

//..Start of Root Code..//

import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      endDrawer: new AppDrawer(), //new Line
      appBar: new AppBar(
        centerTitle: true,
        title: const Text("Help", style: TextStyle(color: Colors.white)),
        //centerTitle: true ,title: const Text("Help Page" ,style: const TextStyle(color: Color(0xffFD9609)),),
      ),
      backgroundColor: Colors.white,
      body: new Center(
        child: SafeArea(
          child: Text(
            'Help Page',
            style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
}

// App Design and Code Author: Raymond Colin Turner
// Lead Developer/Software Engineer: Raymond Colin Turner.
// Copyright © 2020: Ellatronix Ltd.

//..Start of Root Code..//

// import 'package:flutter/material.dart';
// import '../widgets/main_drawer.dart';
// //import 'package:http/http.dart';

// class Legal extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         endDrawer:
//          AppDrawer(),
//         appBar:
//           AppBar(
//           //centerTitle: true ,title: const Text("Quick Quote" ,style: TextStyle(color: Color(0xffFD9609)),),
//           centerTitle: true ,title: const Text("Legal" ,style: TextStyle(color: Colors.white),),

//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(25),

//           itemBuilder: (BuildContext context, int index) => EntryItem(data[index]),
//           itemCount: data.length,
//         ),
//       ),
//     );
//   }
// }

// // One entry in the multilevel list displayed by this app.
// class Entry {
//   Entry(this.title, [this.children = const <Entry>[]]);
//   final String title;
//   final List<Entry> children;
// }

// // The entire multilevel list displayed by this app.
// final List<Entry> data = <Entry>[Entry('Complaints Policy',
//     <Entry>[
//       Entry('We always endeavor to provide the best service and products for our customers. However, on rare occasions, we recognise that there may be times where our customers may not be completely satisfied.'),
//       Entry('To ensure we are able to put things rights as soon as we can, please read our complaints procedure below and we will respond promptly to ensure complete satisfaction.'),
//       Entry('As soon as possible after the completion of the works, please inspect the work to ensure everything has beencarried out to our usual high standards.'),
//       Entry('In the unlikely event there is anything you are not completely satisfied with, please contact us as soon as you can inorder that we can rectify any problems as soon as possible.'),
//       Entry('Our Procedure'),
//       Entry('Either call us, write to us or email us on the details above.'),
//       Entry('We aim to respond within 2 days of receiving your complaint and where possible, will provide you with a date to remedy any issues raised.'),
//       Entry('Where we are unable to resolve your complaint using our own complaints procedure, as a Which? Trusted trader weuse Dispute Resolution Ombudsman for dispute resolution. In the unlikely event that we cannot remedy yourcomplaint to your satisfaction you may wish to refer your complaint to them. If you wish to do so please contact Which? Trusted traders in the first instance on ​0117 456 6031​.'),
//       Entry("You can Download a copy of the Complaints Policy Here."),
//     ],
//   ),
//     Entry('Legal Disclaimer',
//       <Entry>[
//         Entry("Some of the images shown are for illustration purposes only and may not be an exact representation."),
//         Entry("Except for the ‘Portfolio’ Page which is solely intended to display a gallery and a true illustrative representation of historic, and work currently being carried out by Tailored Scaffolding."),
//         Entry("Tailored Scaffolding reserves the right to change images and specifications at any time without any prior notice."),
//     ],
//   ),
// ];

// // Displays one Entry. If the entry has children then it's displayed
// // with an ExpansionTile.
// class EntryItem extends StatelessWidget {
//   const EntryItem(this.entry);

//   final Entry entry;

//   Widget _buildTiles(Entry root) {
//     if (root.children.isEmpty)
//       return ListTile(title: Text(root.title));
//     return ExpansionTile(
//       key: PageStorageKey<Entry>(root),
//       title: Text(root.title),
//       children: root.children.map<Widget>(_buildTiles).toList(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _buildTiles(entry);
//   }
// }

// void main() {
//   runApp(Legal());
// }
