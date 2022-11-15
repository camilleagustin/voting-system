import 'package:voting_app/models/radio_model.dart';

class ScreenArguments {
  final String screen;
  final String department;
  final String position;
  final String party;
  final String docId;
  final List<RadioModel> list;

  ScreenArguments(
      {this.screen,
      this.department,
      this.position,
      this.party,
      this.docId,
      this.list});
}
