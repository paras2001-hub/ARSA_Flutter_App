import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function onTap;

  ButtonWidget({
    this.text,
    this.onTap,
});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(25),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(25),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(5),
          child: Container(
            height: 50.0,
            width: 180.0,
            child: Center(
              child: Text(
                  text,
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 3,
                ),

              ),
            ),
          ),
        ),
      ),
    );
  }
}
