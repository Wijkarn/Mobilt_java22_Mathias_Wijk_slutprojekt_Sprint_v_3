import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:translator/translator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TranslatePageRo(),
    );
  }
}

class TranslatePageRo extends StatefulWidget {
  const TranslatePageRo({super.key});

  @override
  State<TranslatePageRo> createState() => _TranslatePageRo();
}

class _TranslatePageRo extends State<TranslatePageRo> {
  GoogleTranslator translator = GoogleTranslator();
  String translatedText = '';
  bool isLoading = false;

  Future<Map<String, dynamic>> fetchChuckNorrisJoke() async {
    final response = await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load Chuck Norris joke');
    }
  }

  void translateChuckNorrisJoke() async {
    setState(() {
      isLoading = true;
    });

    try {
      Map<String, dynamic> jokeData = await fetchChuckNorrisJoke();
      String jokeText = jokeData['value'] as String;

      translator.translate(jokeText, to: "sv").then((output) {
        setState(() {
          translatedText = output.text;
          isLoading = false;
        });
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chuck Norris Joke Translator'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40),
              isLoading
                  ? CircularProgressIndicator() // Display a loading indicator while fetching and translating.
                  : Text(translatedText), // Display the translated joke.
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: translateChuckNorrisJoke,
                child: const Text("Translate Chuck Norris Joke To Swedish"),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
