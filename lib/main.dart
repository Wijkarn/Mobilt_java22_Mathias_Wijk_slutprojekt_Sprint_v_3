import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'translationPageDe.dart';
import 'translationPageEn.dart';
import 'translationPageFi.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //initializing firebase

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const HomePage(),
      '/TranslationPageEn': (context) => const TranslatePageEn(),
      '/TranslationPageDe': (context) => const TranslatePageDe(),
      '/TranslationPageFi': (context) => const TranslatePageFi(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Homepage'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/TranslationPageEn');
              },
              child: const Text('Go to English Translation'),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/TranslationPageDe');
              },
              child: const Text('Go to Danish Translation'),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/TranslationPageFi');
              },
              child: const Text('Go to Finish Translation'),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/HistoryPage');
              },
              child: const Text('Translation History'),
            ),
          ),
        ],
      ),
    );
  }
}