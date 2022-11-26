import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Overview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          shadowColor: Colors.white,
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                    'This application is designed to showcase the performance of different models for prediction of the resultant sentiment on a given review. Right now, we support the following models :-'),
                SizedBox(
                  height: 10,
                ),
                buildText('\t 1) Naive Bayes'),
                SizedBox(
                  height: 10,
                ),
                buildText('\t 2) Decision Tree(uni-gram)'),
                SizedBox(
                  height: 10,
                ),
                buildText('\t 3) Decision Tree(bi-grams)'),
                SizedBox(
                  height: 10,
                ),
                buildText('\t 4) Support Vector Machine(uni-gram)'),
                SizedBox(
                  height: 10,
                ),
                buildText('\t 5) Support Vector Machine(bi-grams)'),
                SizedBox(
                  height: 10,
                ),
                buildText('\t 6)Multinomial Naive Bayes(unii-grams)'),
                SizedBox(
                  height: 10,
                ),
                buildText('\t 7) Multinomial Naive Bayes(bi-grams)'),
                SizedBox(
                  height: 10,
                ),
                buildText('\t 8) LSTM'),
                SizedBox(
                  height: 10,
                ),
                buildText('\t 9) Neural Network'),
                SizedBox(
                  height: 20,
                ),
                buildText('Further information about the respective models is given in \'ML Model Description\' Section. More models will be added in future.'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text buildText(String val) {
    return Text(
      val,
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 15,
      ),
    );
  }
}
