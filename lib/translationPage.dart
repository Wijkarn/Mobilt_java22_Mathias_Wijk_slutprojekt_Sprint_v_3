import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslatePage extends StatefulWidget {
  const TranslatePage({super.key});

  @override
  State<TranslatePage> createState() => _TranslatePage();
}

class _TranslatePage extends State<TranslatePage> {
  GoogleTranslator translator = GoogleTranslator();
  TextEditingController textController = TextEditingController();
  String translatedText = '';

  void translate() {
    String inputText = textController.text;
    translator.translate(inputText, to: "en").then((output) {
      setState(() {
        translatedText = output.text;
      });

      final FirebaseFirestore storeDB = FirebaseFirestore.instance;
      final data = <String, String>{
        "Original Text": inputText,
        "Translated Text": translatedText,
      };
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
              Text(translatedText),
              const SizedBox(height: 30),
              TextFormField(
                controller: textController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    label: Center(
                      child: Text('Börja skriva för att översätta'),
                    )
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: translate,
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