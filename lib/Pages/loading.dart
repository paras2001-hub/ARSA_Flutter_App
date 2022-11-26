import 'package:amazon_reveiw_sentiment_analysis/response/heroku_server_response.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  HerokuServer herokuServer = new HerokuServer();
  void pushHome() {
    Future.delayed(Duration(seconds: 2), () async {

      bool result = await DataConnectionChecker().hasConnection;
      HerokuServer heroku = new HerokuServer();
      if (result) {
        heroku.startUp();
        Navigator.pushReplacementNamed(context, "/home");
      }
       else {
        Alert(context: context,
            title: 'Network error',
            desc: 'Please check your network connection and restart the app.'
        ).show();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    pushHome();
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    double _size = 30;
    double _lineSpacing = 5;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/X - 4.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: (_height / 4) + 80,
              ),
              Center(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: _lineSpacing + 15,
                      ),
                      buildText(_size, 'Amazon'),
                      SizedBox(
                        height: _lineSpacing,
                      ),
                      buildText(_size, 'Review'),
                      SizedBox(
                        height: _lineSpacing,
                      ),
                      buildText(_size, ' Sentimental '),
                      SizedBox(
                        height: _lineSpacing,
                      ),
                      buildText(_size, 'Analysis'),
                      SizedBox(
                        height: _lineSpacing + 15,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 120),
              SpinKitRing(
                color: Colors.white,
                lineWidth: 3,
              )
            ],
          ),
        ],
      ),
    );
  }

  Text buildText(double _size, String s) {
    return Text(
      s,
      style: TextStyle(fontSize: _size, color: Colors.white, shadows: <Shadow>[
        Shadow(blurRadius: 2, color: Colors.black38, offset: Offset(0, 5)),
      ]),
    );
  }
}
