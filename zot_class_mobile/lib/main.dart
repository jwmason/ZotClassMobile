// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zot Class Mobile',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Zot Class Mobile'), 
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    final myController1 = TextEditingController();
    final myController2 = TextEditingController();
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  minimumSize: Size(200, 80),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
  ));

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  // String selectedValueTerm = "Term";
  // String selectedValueDep = "Department";
  // String selectedValueCC= "Course Code";
  // String selectedValueCT = "Course Title";

    // setState(() {
    //   // This call to setState tells the Flutter framework that something has
    //   // changed in this State, which causes it to rerun the build method below
    //   // so that the display can reflect the updated values. If we changed
    //   // _counter without calling setState(), then the build method would not be
    //   // called again, and so nothing would appear to happen.


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).


          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text('\n\n'),
            DropdownSearch<String>(
                popupProps: const PopupProps.menu(
                    showSelectedItems: true,
                ),
                items: const ["Department", "ICS", "ART", "WRITING", "MATH", "EECS", "DANCE", "DRAMA", "POLISCI"],
                onChanged: print,
                selectedItem: "Department",
            ),
            const Text('\n'),
            DropdownSearch<String>(
                popupProps: const PopupProps.menu(
                    showSelectedItems: true,
                ),
                items: const ["Term", "2023 Winter Quarter", "2023 Fall Quarter", "2023 Spring Quarter"],
                onChanged: print,
                selectedItem: "Term",
            ),
            const Text('\n'),
            TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Course Code:',
            ),
            controller: myController1
          ),
          const Text('\n'),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Course Name:',
            ),
            controller: myController2
          ),
          const Text('\n'),
          ElevatedButton(
          style: raisedButtonStyle,
          onPressed: () { },
          child: Text('Search', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        ),
          ],
        ),
      ),
    );
  }
}
