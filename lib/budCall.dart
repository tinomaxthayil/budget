// main.dart
import 'package:flutter/material.dart';
import 'budgetList.dart';
import 'budgetDisp.dart';
import 'list.dart';

class budPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// MaterialApp is the base Widget for your Flutter Application
    /// Gives us access to routing, context, and meta info functionality.
    return MaterialApp(
      title: 'Budget',
      // Make all our text default to white
      // and backgrounds default to dark
      home: MyHomePage(title: 'Budget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  List<budList> bud = []
    ..add(budList('Food', 2500))
    ..add(budList('Rent', 2000))
    ..add(budList('Movies', 500))
    ..add(budList('Travel', 500))
    ..add(budList('Party', 1000));
  Widget build(BuildContext context) {
    return Container(
          color: Colors.white,
          child: Center(
            // Changed code
            child: BList(bud), // Changed code
          )
    );
        
  }
}