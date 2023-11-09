import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslatePageRo extends StatefulWidget {
  const TranslatePageRo({super.key});

  @override
  State<TranslatePageRo> createState() => _TranslatePageRo();
}

class _TranslatePageRo extends State<TranslatePageRo> {
  // Initialize the Google Translator and TextEditingController.
  GoogleTranslator translator = GoogleTranslator();
  TextEditingController textController = TextEditingController();
  String translatedText = '';

  // Function to perform text translation and save the translation to Firebase Firestore.
  void translate() {
    String inputText = textController.text;

    // Use the translator library to translate the input text to Romanian ("ro").
    translator.translate(inputText, to: "ro").then((output) {
      setState(() {
        translatedText = output.text;
      });

      // Access the Firebase Firestore instance.
      final FirebaseFirestore storeDB = FirebaseFirestore.instance;

      // Create a data map to store the original and translated text.
      final data = <String, String>{
        "Original Text": inputText,
        "Translated Text": translatedText,
      };

      // Add the data to a "translations" collection in Firebase Firestore.
      storeDB.collection("translations").add(data).then((docRef) {
        print("Working!");
      }).catchError((error) {
        print(error);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red[900],
      appBar: AppBar(
        title: const Text('Translate Page'),
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
              Text(translatedText), // Display the translated text.
              const SizedBox(height: 30),
              TextFormField(
                controller: textController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    label: Center(
                  child: Text('Börja skriva för att översätta'),
                )),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: translate,
                // Trigger the translation when the button is pressed.
                child: const Text("Translate"),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
