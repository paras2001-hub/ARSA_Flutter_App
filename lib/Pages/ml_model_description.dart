import 'package:flutter/material.dart';

class MlModelDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ml Model Description'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          shadowColor: Colors.white,
          elevation: 30,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHeading('Naive Bayes :'),
                  SizedBox(
                    height: 5,
                  ),
                  buildChild(
                      'A Naive Bayes classifier is a probabilistic machine learning model that’s used for classification task. The crux of the classifier is based on the Bayes theorem.'),
                  SizedBox(
                    height: 5,
                  ),
                  Image.asset(
                    'assets/asset1.png',
                    filterQuality: FilterQuality.high,
                  ),
                  buildChild(
                      'The variable A is the class variable, which represents if it is suitable condition or not given the conditions. Variable B represent the parameters/features.'),
                  SizedBox(
                    height: 5,
                  ),
                  buildChild(
                      'Naive Bayes algorithms are mostly used in sentiment analysis, spam filtering, recommendation systems etc. They are fast and easy to implement but their biggest disadvantage is that the requirement of predictors to be independent.'),
                  SizedBox(
                    height: 10,
                  ),
                  buildHeading('Decision Tree :'),
                  SizedBox(
                    height: 5,
                  ),
                  buildChild(
                      'Decision-Tree is a tree-structured classifier, where internal nodes represent the features of a dataset, branches represent the decision rules and each leaf node represents the outcome.'),
                  SizedBox(
                    height: 5,
                  ),
                  buildChild(
                      'It is simple to understand as it follows the same process which a human follow while making any decision in real-life. Also, there is less requirement of data cleaning compared to other algorithms.'),
                  SizedBox(
                    height: 7,
                  ),
                  Image.asset(
                    'assets/decision-tree-classification-algorithm.png',
                    filterQuality: FilterQuality.high,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildHeading('Support Vector machine :'),
                  SizedBox(
                    height: 5,
                  ),
                  buildChild(
                      'A Support Vector Machine (SVM) is a discriminative classifier formally defined by a separating hyperplane. In other words, given labeled training data (supervised learning), the algorithm outputs an optimal hyperplane which categorizes new examples. SVMs are really good for text classification.'),
                  SizedBox(
                    height: 5,
                  ),
                  buildChild(
                      '(Hyperplanes are decision boundaries that help classify the data points. Data points falling on either side of the hyperplane can be attributed to different classes.)'),
                  SizedBox(
                    height: 5,
                  ),
                  buildChild(
                      'However, it requires a long time for training and the size of trained model is huge.'),
                  SizedBox(
                    height: 5,
                  ),
                  Image.asset(
                    'assets/index3_souoaz.png',
                    filterQuality: FilterQuality.high,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildHeading('Count Vectorizer : '),
                  SizedBox(
                    height: 5,
                  ),
                  buildChild(
                      'The CountVectorizer provides a simple way to both tokenize a collection of text documents and build a vocabulary of known words, but also to encode new documents using that vocabulary.'),
                  SizedBox(
                    height: 7,
                  ),
                  Image.asset(
                    'assets/download.png',
                    filterQuality: FilterQuality.high,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildHeading('LSTM :'),
                  SizedBox(
                    height: 5,
                  ),
                  buildChild(
                      "The cell state acts as a transport highway that transfers relative information all the way down the sequence chain. The cell state carries relevant information throughout the processing of the sequence. So even information from the earlier time steps can make its way to later time steps, reducing the effects of short-term memory and this information gets added or removed to the cell state via gates"),
                  SizedBox(
                    height: 5,
                  ),
                  buildChild(
                      "The gates are different neural networks that decide which information is allowed on the cell state."),
                  SizedBox(
                    height: 5,
                  ),
                  buildChild(
                      'There are three different gates that regulate information flow in an LSTM cell:'),
                  SizedBox(
                    height: 5,
                  ),
                  buildChild('''1) Forget gate\n2) Input gate\n3) Output gate'''),
                  SizedBox(
                    height: 7,
                  ),
                  Image.asset(
                    'assets/lstm.png',
                    filterQuality: FilterQuality.high,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildHeading('Neural Network :'),
                  SizedBox(
                    height: 7,
                  ),
                  buildChild('The Neural Network is constructed from 3 type of layers:'),
                  SizedBox(
                    height: 5,
                  ),
                  buildChild('Input layer — initial data for the neural network.'),
                  SizedBox(
                    height: 5,
                  ),
                  buildChild('Hidden layers — intermediate layer between input and output layer and place where all the computation is done.'),
                  SizedBox(
                    height: 5,
                  ),
                  buildChild('Output layer — produce the result for given inputs.'),
                  SizedBox(
                    height: 5,
                  ),  
                  buildChild('Each node is connected with each node from the next layer and each connection has particular weight. Weight can be seen as an impact that that node has on the node from the next layer.'),
                  SizedBox(
                    height: 5,
                  ),
                  Image.asset(
                    'assets/nn.png',
                    filterQuality: FilterQuality.high,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Text buildChild(String val) {
    return Text(
      val,
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
    );
  }

  Text buildHeading(String val) {
    return Text(
      val,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
