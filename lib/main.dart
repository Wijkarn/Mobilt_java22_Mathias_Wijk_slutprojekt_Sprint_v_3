import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'translationPageDe.dart';
import 'translationPageEn.dart';
import 'translationPageFi.dart';
import 'translationPageChuckNorris.dart';
import 'firebase_options.dart';

// This is the main entry point of the Flutter application.
Future<void> main() async {
  // Ensure that Flutter is initialized and Firebase services are ready.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize the Flutter app and define routes for different pages.
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const HomePage(),
      '/TranslationPageEn': (context) => const TranslatePageEn(),
      '/TranslationPageDe': (context) => const TranslatePageDe(),
      '/TranslationPageFi': (context) => const TranslatePageFi(),
      '/TranslateChuckNorris': (context) => const TranslateChuckNorris(),
    },
  ));
}

// This is the homepage of the app.
class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Button to navigate to the English translation page.
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/TranslationPageEn');
              },
              child: const Text('Go to English Translation'),
            ),
          ),
          const SizedBox(height: 20),
          // Button to navigate to the Danish translation page.
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/TranslationPageDe');
              },
              child: const Text('Go to Danish Translation'),
            ),
          ),
          const SizedBox(height: 20),
          // Button to navigate to the Finnish translation page.
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/TranslationPageFi');
              },
              child: const Text('Go to Finish Translation'),
            ),
          ),
          const SizedBox(height: 20),
          // Button to navigate to the Romanian translation page.
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/TranslateChuckNorris');
              },
              child: const Text('Translate Chuck Norris joke to Swedish'),
            ),
          ),
        ],
      ),
    );
  }
}
