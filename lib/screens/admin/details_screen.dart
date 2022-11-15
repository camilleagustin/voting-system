import 'package:flutter/material.dart';
import 'package:voting_app/extract_arguments.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepOrange),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${args.docId}',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Position: ${args.position.toUpperCase()}',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Party: ${args.party.toUpperCase()}',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
