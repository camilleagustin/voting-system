import 'package:flutter/material.dart';

class ResponseScreen extends StatelessWidget {
  const ResponseScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your response has been recorded',
              textAlign: TextAlign.center,
              style: TextStyle(

                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Back to Home',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
