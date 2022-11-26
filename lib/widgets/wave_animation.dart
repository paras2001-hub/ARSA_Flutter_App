import 'package:amazon_reveiw_sentiment_analysis/widgets/clipper.dart';
import "package:flutter/material.dart";
import "dart:math" as Math;


class WaveAnimate extends StatefulWidget {
  final Size size;
  final Color color;
  final double altitude;

  WaveAnimate({
    this.size,
    this.altitude,
    this.color,
  });
  @override
  _WaveAnimateState createState() => _WaveAnimateState();
}

class _WaveAnimateState extends State<WaveAnimate> with TickerProviderStateMixin {

    AnimationController animationController;
    List <Offset> wavePoints = [];

    @override
    void initState() {
      super.initState();

      animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 5000),
      )..addListener(() {
        wavePoints.clear();
          final double _speed = animationController.value * 1080;
          final double _sphere = animationController.value * Math.pi * 2;
          final double _normaliser = Math.cos(_sphere);
          final double _width = Math.pi / 270;
          final double _height = 10;

          for (int i = 0; i <= widget.size.width.toInt(); ++i) {
            double _cal = Math.sin((_speed - i) * _width);
            wavePoints.add(
              Offset(
                i.toDouble(),
                _cal * _height * _normaliser + widget.altitude,
              ),
            );
          }
        });
      animationController.repeat();
    }


    @override
    Widget build(BuildContext context) {
      return AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          return ClipPath(
            clipper: ClipperWidget(
              waveList: wavePoints,
            ),
            child: Container(
              width: widget.size.width,
              height: widget.size.height,
              color: widget.color,
            ),
          );
        },
      );
    }

    
    @override
    void dispose() {
      animationController.dispose();
      super.dispose();
    }
}
