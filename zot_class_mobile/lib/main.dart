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
  String term = "Term";
  String dep = "Department";
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
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text('\n\n'),
            DropdownSearch<String>(
                popupProps: const PopupProps.menu(
                    showSelectedItems: true,
                ),
                items: const ["Department", "ICS", "ART", "WRITING", "MATH", "EECS", "DANCE", "DRAMA", "POLISCI"],
                selectedItem: "Department",
                onChanged:(selectedItem) {
                  setState(() {
                    if(selectedItem != null) {
                      dep = selectedItem;
                    }
                    else {
                      dep = "Department";
                    }
                  });
                }
            ),
            const Text('\n'),
            DropdownSearch<String>(
                popupProps: const PopupProps.menu(
                    showSelectedItems: true,
                ),
                items: const ["Term", "2023 Winter Quarter", "2023 Fall Quarter", "2023 Spring Quarter"],
                selectedItem: "Term",
                onChanged: (selectedItem) {
                  setState(() {
                    if(selectedItem != null) {
                      term = selectedItem;
                    }
                    else {
                      term = "Term";
                    }
                  });
                },
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
          onPressed: (){
            if(dep != "Department" && term != "Term") {
              print(dep);
              print(term);
              print(myController1.text);
              print(myController2.text);
            }
            else {
              print("no");
            }
          },
          child: Text('Search', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        ),
          ],
        ),
      ),
    );
  }
}
