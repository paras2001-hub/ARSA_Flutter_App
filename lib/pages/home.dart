import 'package:amazon_reveiw_sentiment_analysis/response/heroku_server_response.dart';
import 'package:amazon_reveiw_sentiment_analysis/widgets/widget.dart';
import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'resp_loading.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String review;

  HerokuServer herokuServer = new HerokuServer();

  final models = [
    'Naive bayes',
    'Decision Tree(uni-gram)',
    'Decision Tree(bi-grams)',
    'Support Vector Machine(uni-gram)',
    'Support Vector Machine(bi-grams)',
    'Multinomial NB(uni-grams)',
    'Multinomial NB(bi-grams)',
    'LSTM',
    'Neural Network'
  ];

  List<Widget> _buildItems() {
    return models
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }

  int modelNumber = 0;
  String model;
  bool loadingState = false;
  double radius = 15;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    print(modelNumber);

    return loadingState
        ? RespLoading()
        : GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                children: <Widget>[
                  Container(
                    height: size.height - 250,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.lightBlue[400],
                        Colors.blue[900],
                        Colors.black
                      ],
                    )),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 180),
                    curve: Curves.easeOutQuad,
                    top: keyboardOpen ? -(size.height / 5) : 0.0,
                    child: WaveAnimate(
                      size: size,
                      altitude: size.height / 3,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            Navigator.pushNamed(context, '/about');
                          },
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: keyboardOpen
                        ? const EdgeInsets.only(top: 70.0, right: 10)
                        : const EdgeInsets.only(top: 200.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SENTIMENT ANALYSIS",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 7,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(radius),
                            child: TextFormField(
                              textCapitalization: TextCapitalization.sentences,
                              onChanged: (val) {
                                review = val;
                                print(review);
                              },
                              validator: (val) => ((val.length < 30
                                  ? "Enter Review with atleast 30 characters."
                                  : null)),
                              minLines: 1,
                              maxLines: 3,
                              cursorColor: Colors.blue[800],
                              decoration: InputDecoration(
                                labelText: "Enter review text",
                                labelStyle: TextStyle(
                                  color: Colors.blue,
                                ),
                                prefixIcon: Icon(
                                  Icons.text_fields_rounded,
                                  size: 16,
                                  color: Colors.blue,
                                ),
                                filled: true,
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(radius),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(radius),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: keyboardOpen
                                ? size.height / 20
                                : size.height / 15,
                          ),
                          Material(
                            child: DirectSelect(
                                itemExtent: 35.0,
                                selectedIndex: modelNumber,
                                mode: DirectSelectMode.tap,
                                itemMagnification: 1,
                                backgroundColor: Colors.blue[300],
                                selectionColor: Colors.white30,
                                child: MySelectionItem(
                                  isForList: false,
                                  title: models[modelNumber],
                                ),
                                onSelectedItemChanged: (index) {
                                  setState(() {
                                    modelNumber = index;
                                  });
                                },
                                items: _buildItems()),
                          ),
                          SizedBox(
                            height: keyboardOpen
                                ? size.height / 10
                                : size.height / 5,
                          ),
                          ButtonWidget(
                              text: "Predict",
                              onTap: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    loadingState = true;
                                  });

                                  print(review);

                                  var body = [
                                    {
                                      "review": review,
                                      "modelNumber": modelNumber
                                    }
                                  ];
                                  var resp = await herokuServer.predict(body);
                                  setState(() {
                                    loadingState = false;
                                    Alert(
                                            context: context,
                                            title: "Result",
                                            desc: resp)
                                        .show();
                                  });
                                }
                              }),
                          SizedBox(
                            height: size.width / 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

class MySelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;

  const MySelectionItem({Key key, this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: isForList
          ? Padding(
              child: _buildItem(context),
              padding: EdgeInsets.all(10.0),
            )
          : Card(
              margin: EdgeInsets.symmetric(horizontal: 40.0),
              elevation: 5,
              child: Stack(
                children: <Widget>[
                  _buildItem(context),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down),
                  )
                ],
              ),
            ),
    );
  }

  _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
