import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentResumeApp(),
    );
  }
}

class StudentResumeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          'App Name',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
    icon: Icon(Icons.menu), // The icon you want to display
    onPressed: () {
      // Handle menu icon press
      print('Menu button pressed');
    },
  ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,width:250,
                 decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg'))
                 ),
                ),
                // CircleAvatar(
                //   radius: 50,
                //   backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg')
                // ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Student Name',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('Email Address'),
                    Text('Roll Number'),
                  ],
                ),
                Spacer(),
                SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Resume Details:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Skills: [Your Skills]'),
                  Text('Education Details: [Your Education]'),
                  Text('Internship Details: [Your Internship]'),
                  Text('Project Details: [Your Projects]'),
                  SizedBox(height: 200),
                ],
              ),
            ),
              ],
            ),
            
            Spacer(),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[300],
              child: Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text('Contact Address: Website Link'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}