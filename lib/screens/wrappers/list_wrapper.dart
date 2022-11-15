import 'package:flutter/material.dart';
import 'package:voting_app/extract_arguments.dart';
import 'package:voting_app/screens.dart';
class ListWrapper extends StatelessWidget {
  const ListWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as ScreenArguments;
    print(args.screen);
    if (args.screen == 'delete') {
      return DeleteCandidateScreen();
    }
    return DetailsScreen();
  }
}
