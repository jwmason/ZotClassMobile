import 'package:flutter/material.dart';


class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CoursesPage()),
            );
          },
        ),
      ),
    );
  }
}

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    //sample data
    final List<String> course = <String>['ICS 45', 'Writing 60', 'Math 2B', 'ICS 60','EECS 31',
    'Writing 39B','Math 2D', 'CompSci 161', 'BME 12', 'BioSci 90', 'Math 2A', 'Writing 50'];
    final List<String> code = <String>['54321','55555','12345', '129381','444444','111111','222222','333333','4444444','555555',
    '333333','099999'];

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
                            Text('Code: ${code[index]}',
                                style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
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
                                title: const Text('sample'),
                                content: const Text('test content'),
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