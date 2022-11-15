import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final String imagePath;

  const ImageButton({
    Key key,
    this.text,
    this.onTap,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        color: Colors.green,
        width: 110,
        child: Column(
          children: <Widget>[
            Image.asset(imagePath),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
