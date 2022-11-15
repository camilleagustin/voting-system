import 'package:flutter/material.dart';
import 'package:voting_app/extract_arguments.dart';
import 'package:voting_app/widgets/image_button.dart';

class SchoolLevelScreen extends StatelessWidget {
  const SchoolLevelScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as ScreenArguments;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ImageButton(
                text: 'SHS',
                imagePath: 'assets/shs.png',
                onTap: () {
                  Navigator.pushNamed(context, '/shs_wrapper',
                      arguments: ScreenArguments(screen: args.screen));
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              ImageButton(
                text: 'College',
                imagePath: 'assets/college.png',
                onTap: () {
                  Navigator.pushNamed(context, '/college',
                      arguments: ScreenArguments(screen: args.screen));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
