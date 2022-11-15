import 'package:flutter/material.dart';

class BlueOutlinedButton extends StatelessWidget {
  final String text;

  const BlueOutlinedButton({Key key, this.text}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Text(
        'VOTE',
      ),
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        side: BorderSide(color: Colors.black, width: 2.0,),
      ),
    );
  }
}
