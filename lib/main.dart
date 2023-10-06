import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'translationPage.dart';
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
      '/TranslationPage': (context) => const TranslatePage(),
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
                Navigator.pushNamed(context, '/TranslationPage');
              },
              child: const Text('Go to English Translation'),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/SpanishPage');
              },
              child: const Text('Go to Spanish Translation'),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/EstonianPage');
              },
              child: const Text('Get a joke translate'),
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