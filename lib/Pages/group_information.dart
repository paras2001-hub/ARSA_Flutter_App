import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class GroupInformation extends StatelessWidget {
  String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Group Information'),
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
                buildHeading(' Mentor '),
                SizedBox(
                  height: 10,
                ),
                buildChild('Prof. Vidya Zope'),
                SizedBox(
                  height: 30,
                ),
                buildHeading('Group Members'),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () async {
                      url =
                          'https://www.linkedin.com/in/paras-patil-586a66178/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        Alert(
                            context: context,
                            title: 'Problem occured',
                            desc: 'Can\'t Launch the url!');
                      }
                    },
                    child: buildChild('Paras Patil')),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                      url =
                          'https://www.linkedin.com/in/vishesh-mittal-606134169';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        Alert(
                            context: context,
                            title: 'Problem occured',
                            desc: 'Can\'t Launch the url!');
                      }
                    },
                  child: buildChild('Vishesh Mittal')),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () async {
                      url =
                          'https://www.linkedin.com/in/kapish-madhwani-a37b1a1aa/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        Alert(
                            context: context,
                            title: 'Problem occured',
                            desc: 'Can\'t Launch the url!');
                      }
                    },
                    child: buildChild('Kapish Madhwani')),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                      url =
                          'https://www.linkedin.com/in/kaustubh-keny-951a391b5/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        Alert(
                            context: context,
                            title: 'Problem occured',
                            desc: 'Can\'t Launch the url!');
                      }
                    },
                  child: buildChild('Kaustubh Keny')),
                SizedBox(
                  height: 10,
                ),
                buildChild('Aryan Bedi')  
              ],
            ),
          ),
        ),
      ),
    );
  }

  Center buildChild(String val) {
    return Center(
        child: Text(
      val,
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
    ));
  }

  Center buildHeading(String val) {
    return Center(
        child: Text(
      val,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        letterSpacing: 7,
      ),
    ));
  }
}
