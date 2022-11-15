import 'package:flutter/material.dart';

class GreenOutlinedButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const GreenOutlinedButton({Key key, this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 14.0),
        primary: Colors.white,
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        side: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
      ),
    );
  }
}
