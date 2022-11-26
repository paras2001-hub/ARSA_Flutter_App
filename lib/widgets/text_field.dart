import 'package:flutter/material.dart';

class LabelledTextField extends StatelessWidget {
  final String labelledtext;
  final Function onChanged;
  final IconData preIcon;

  LabelledTextField({
    this.labelledtext,
    this.onChanged,
    this.preIcon,
  });

  final double radius = 15;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(radius),
      child: TextFormField(
        
        textCapitalization: TextCapitalization.sentences,
        onChanged: onChanged,
        validator: (val) => ((val.length < 30 ? "Enter Review with atleast 30 characters." : null)) ,
        minLines: 1,
        maxLines: 3,
        cursorColor: Colors.blue[800],
        decoration: InputDecoration(
          labelText: labelledtext,
          labelStyle: TextStyle(
            color: Colors.blue,
          ),
          prefixIcon: Icon(
            preIcon,
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
    );
  }
}
