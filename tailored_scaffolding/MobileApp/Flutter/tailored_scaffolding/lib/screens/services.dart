// App Design and Code Author: Raymond Colin Turner 
// Lead Developer/Software Engineer: Raymond Colin Turner.
// Copyright © 2020: Ellatronix Ltd.

// ** Start of Root Code ** //

import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';


class Services extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: 
            AppDrawer(),
        appBar: 
            AppBar(
          //centerTitle: true ,title: const Text("Quick Quote" ,style: TextStyle(color: Color(0xffFD9609)),),
          centerTitle: true ,title: const Text("Scaffolding Services" ,style: TextStyle(color: Colors.white),),
        
        ),
        backgroundColor: Colors.white, 
        body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
          itemBuilder: (BuildContext context, int index) => EntryItem(data[index]),
          itemCount: data.length,            
        ),
      ),
    );
  }
}
        

//===================================== TO DO ====================================//
//------------------ Add Material Card Desin To The List Tiles -------------------//
//===================================== TO DO ====================================//

// One entry in the multilevel list displayed by this app.

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
  
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[Entry('Temporary Roof Solutions',
    <Entry>[
      Entry('Our Temporary Roof Solutions deliver a range of sizes in Different Options at a fraction of the price of a composite crane dependant roofing alternative.'),
      Entry('Tailored Scaffolding’s bespoke roof build techniques will allow your project to continue without the need to worry about the weather, or having to hire a crane to get your Temporary Roof in place.'),
      Entry('Tried and Tested Our Tube and Fitting roof alternative is particularly ideal for Roofing Contractors, and complete new roof projects large, and small, and as our construction methods eliminate the need for any Crane lifts.')
    ],
  ),
  Entry('Scaffolding With Tube',
    <Entry>[
      Entry("Tailored scaffolding consist of scaffold tube, boards and fittings."),
      Entry("Scaffold tube is attached using various couplers, clamps and scaffold fittings."),
      Entry("Unlike other System Scaffolds, our tube and fitting systems are not prefabricated."),
      Entry("Tailored scaffold tube is used with various types of fittings to build a braced, stable structure, with platforms (known as lifts) where scaffold boards are installed."),
      Entry("This will provide a safe, stable working platform where tradesmen can safely gain access to work from the scaffold with tools, machinery and equipment."),
      //Entry(""),
      //Entry(""),
    ],
  ),
  Entry('Access Towers and Form Work',
    <Entry>[
      Entry('Here at Tailored Scaffolding Our access platforms and towers provide many different purposes for working at height view the working at height regulations) from general platforms and towers for building progressive brickwork, decorating platforms and tailored scaffolding'),
      Entry(''),
    ],
  ),
  Entry('Scaffold For Full Redecoration',
    <Entry>[
      Entry("Tailored Scaffolding is very skilled and qualified with a combined experience of over 20 years in the trade. This experience and wealth of knowledge has enabled us to develop and refine our service so we can deliver a high quality tailored scaffolding service at a cost effective price."),
      Entry("Tailored Scaffolding prides itself on delivering a fast and tidy elevation service that is tailored to each client’s individual needs and requirements."),
      Entry("Tailored we do understand the importance of causing minimal disruption to the premises and surrounding areas and work hard to ensure this is achieved wherever possible."),
    ],
  ),
  Entry('Safety Support',
    <Entry>[
      Entry("Our Innovative approach, with reliability and very competitive prices. It’s our focus on these that"),
      Entry("have made us one of the leading supplier’s of scaffolding for the South and Commercial, Industrial and Residential clients"),
      Entry("Terry and Me provide services that are consistently chosen by local councils and major companies so you can be sure that you’re working with a company you can trust"),
    ],
  ),
  Entry('Scaffolding Inspection Involve',
    <Entry>[
      Entry("We can perform scheduled and tailored scaffolding inspections to monitor compliance and supplement the statutory inspections carried out by or on behalf of the client."),
      Entry("A full written report is provided and digital photographs can be included to support our findings and recommendations."),
    ],
  ),
  Entry('Shoring Up and Propping',
    <Entry>[
      Entry(''),
      Entry(''),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    
    if (root.children.isEmpty)
      return ListTile(title: Text(root.title));
      return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map<Widget>(_buildTiles).toList(
      ),
    );

    
  }
  

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

void main() {
  runApp(Services());
}
