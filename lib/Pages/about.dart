
import 'package:amazon_reveiw_sentiment_analysis/core/pages.dart';
import 'package:amazon_reveiw_sentiment_analysis/widgets/widget.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  List<Pages> pages = [
    Pages(pageName: 'Overview ', route: '/overview'),
    Pages(pageName: 'Group Information', route: '/groupInformation'),
    Pages(pageName: 'Ml Model Description', route: '/mlModelDescription'),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: size.height - 200,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.lightBlue[400],
                      Colors.blue[900],
                      Colors.black
                    ])),
              ),
            ],
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 360),
            curve: Curves.easeOutQuad,
            child: WaveAnimate(
              size: size,
              altitude: size.height / 5,
              color: Colors.white,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.15),
                child: buildText('ABOUT', Colors.white, 7, 15),
              ),
              SizedBox(
                height: size.height * 0.15,
              ),
              buildText('Amazon Review', Colors.black38, 2, 30),
              buildText('Sentiment Analysis', Colors.black38, 2, 30),
              SizedBox(
                height: size.height * 0.05,
              ),
              Expanded(
                child: Stack(children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(53),
                          topRight: Radius.circular(53)),
                      gradient: LinearGradient(
                          colors: [
                            Colors.blue[700],
                            Colors.white,
                            Colors.lightBlue[200]
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.015, 0.25, 1]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30, left: 2, right: 2),
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(53),
                            topRight: Radius.circular(53)),
                      ),
                      child: Container(
                          child: ListView.builder(
                              itemCount: pages.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, pages[index].route);
                                    },
                                    title: Text(pages[index].pageName),
                                  ),
                                );
                              })),
                    ),
                  ),
                ]),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.05),
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }

  Text buildText(String text, Color color, double spacing, double size) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
        letterSpacing: spacing,
      ),
    );
  }
}
