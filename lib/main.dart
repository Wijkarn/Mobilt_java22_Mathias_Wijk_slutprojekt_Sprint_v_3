import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'translationPage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //initilizing firebase

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/TranslationPage': (context) => TranslatePage(),
    },
  ));
}

//creating routes to all my dart files

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Homepage'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/TranslationPage');
              },
              child: Text('Go to English Translation'),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/SpanishPage');
              },
              child: Text('Go to Spanish Translation'),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/EstonianPage');
              },
              child: Text('Get a joke translate'),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/HistoryPage');
              },
              child: Text('Translation History'),
            ),
          ),
        ],
      ),
    );
  }
}