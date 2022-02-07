import 'package:arsa_02/functionality/tf_prediction.dart';
import 'package:arsa_02/widgets/labelled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:arsa_02/functionality/lemma_sentence.dart';

class Home extends StatelessWidget {
  Lemmatization _lemmatization = new Lemmatization();
  Classifier _classifier = new Classifier();
  String _review;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            LabelledTextField(
              labelledtext: "Enter Text",
              preIcon: Icons.text_fields_rounded,
              color: Colors.redAccent,
              obscureText: false,
              onChanged: (val) {
                _review = val;
              },
            ),
            FlatButton(onPressed: () async {
              print(_lemmatization.tolemma(_review));
              print(_classifier.classify(_review));
            }, child: Text('Predict'))
          ],
        ),
      ),
    );
  }
}

