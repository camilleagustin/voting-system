import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:voting_app/extract_arguments.dart';
import 'package:voting_app/models/vote_model.dart';
import 'package:voting_app/widgets/chart.dart';

class ResultsScreen extends StatefulWidget {
  final String department;

  const ResultsScreen({Key key, this.department}) : super(key: key);

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as ScreenArguments;
    String department = args.department != null
        ? args.department
        : widget.department;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          department.toUpperCase(),
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.deepOrange),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            VoteChart(
              position: 'president',
              data: getNames('president', department),
            ),
            VoteChart(
              position: 'vice president',
              data: getNames('vice president', department),
            ),
            VoteChart(
              position: 'secretary',
              data: getNames('secretary', department),
            ),
            VoteChart(
              position: 'treasurer',
              data: getNames('treasurer', department),
            ),
            VoteChart(
              position: 'auditor',
              data: getNames('auditor', department),
            ),
            VoteChart(
              position: 'information officer',
              data: getNames('information officer', department),
            ),
            VoteChart(
              position: 'peace officer',
              data: getNames('peace officer', department),
            ),
            VoteChart(
              position: 'interfaith(catholic)',
              data: getNames('interfaith(catholic)', department),
            ),
            VoteChart(
              position: 'interfaith(noncatholic)',
              data: getNames('interfaith(noncatholic)', department),
            ),
            VoteChart(
              position: 'outreach officer',
              data: getNames('outreach officer', department),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Votes>> getNames(String position, String department) async {
    print(department);
    List<Votes> list = [];
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('candidates/$department/list')
        .where('position', isEqualTo: position)
        .get();
    snapshot.docs.forEach((doc) {
      list.add(Votes(name: doc.id, votes: doc['votes']));
    });

    return list;
  }
}
