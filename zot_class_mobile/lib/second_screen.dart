import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CoursesPage extends StatefulWidget {
  final String department;
  final String term;
  final String courseCode;
  final String courseName;

  const CoursesPage({super.key, required this.department, required this.term, required this.courseCode, required this.courseName});

  @override
  State<CoursesPage> createState() => _CoursesPageState(department: department, term: term, courseCode: courseCode, courseName: courseName);
}

class _CoursesPageState extends State<CoursesPage> {
  final apiURL = "https://zot-class-mobile.herokuapp.com/";
  final String department;
  final String term;
  final String courseCode;
  final String courseName;

  _CoursesPageState({required this.department, required this.term, required this.courseCode, required this.courseName});

    //sample data
  List<String> course = <String>[];
  List<List<String>> code = <List<String>>[];
  List<List<String>> instructors = <List<String>>[];
  List<List<String>> units = <List<String>>[];
  List<String> meetings = <String>['ICS 45', 'Writing 60', 'Math 2B', 'ICS 60','EECS 31',
  'Writing 39B','Math 2D', 'CompSci 161', 'BME 12', 'BioSci 90', 'Math 2A', 'Writing 50'];

  void getSpecifics() async {
    var url = "${apiURL}parameters?term=${term.replaceAll(' ', '%20')}&department=${department}";
    if (courseCode != "") {
      url += "&courseCodes=${courseCode}";
      if (courseName != "") {
        url += "&courseTitle=${courseName}";
      }
    }
    else if (courseName != "") {
      url += "&courseTitle=${courseName}";
    }

    var response = http.get(Uri.parse(url));
    response.then((value) {
      var courses = [];
      var temp = [];
      var codeTemp = [];
      var instructorsTemp = [];
      var unitTemp = [];
      List<List<String>> unit = [];
      List<List<String>> codes = [];
      List<List<String>> instructorsList = [];
      for (int i = 0; i < jsonDecode(value.body).length; i++) {
        courses.add(jsonDecode(value.body)[i]['courseTitle']);
        temp.add(jsonDecode(value.body)[i]['sections']);
        for (int e = 0; e <jsonDecode(value.body)[i]['sections'].length; e++) {
          codeTemp.add(jsonDecode(value.body)[i]['sections'][e]['sectionCode']);
          unitTemp.add(jsonDecode(value.body)[i]['sections'][e]['units']);
          instructorsTemp.add(jsonDecode(value.body)[i]['sections'][e]['instructors'][0]);
        }
        codes.add(List<String>.from(codeTemp));
        instructorsList.add(List<String>.from(instructorsTemp));
        unit.add(List<String>.from(unitTemp));
        unitTemp = [];
        codeTemp = [];
        instructorsTemp = [];
      }
      setState(() {
      course = List<String>.from(courses);
      code = codes;
      instructors = instructorsList;
      units = unit;
      });
    });
   }

  @override
  initState() {
    super.initState();
    getSpecifics();
  }

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
 
            SizedBox(
              height: 600,
              child: 
              ListView.builder(
      
                padding: const EdgeInsets.all(10),
                itemCount: course.length,
                itemBuilder: (BuildContext context, int index) {
                  String codeString = "";
                  for(int n = 0; n < code[index].length; n++) {
                    codeString += "Code:${code[index][n]}   Instructors:${instructors[index][n]}   Units:${units[index][n]}\n";
                  }
                  return Container(
                    height: 100,
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Course: ${course[index]}',
                              style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            ),
                          ],
                        ),
                  
                        OutlinedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white24),
                            foregroundColor: MaterialStateProperty.all(Colors.black),
                          ),
                          child: const Text('info'),
                          onPressed: (){
                            showDialog(context: context, builder: (BuildContext context){
                              return AlertDialog(
                                title: const Text('Sections'),
                                content: Text(codeString),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed:() {
                                      Navigator.of(context).pop();
                                    }, 
                                    child: const Text('close'),
                                    )
                                ],
                              );
                            });

                          } ,
                          
                        )
                        ]
                        ),
                  );
                }
              )
            ),
        ]
        ),
        
      ),
    );
  }
}