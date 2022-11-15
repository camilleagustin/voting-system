import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app/extract_arguments.dart';
import 'package:voting_app/models/radio_model.dart';
import 'package:voting_app/widgets/vote_container.dart';

class VoteScreen extends StatelessWidget {
  final String department;

  const VoteScreen({Key key, this.department}) : super(key: key);

  static String president = '';
  static String vicePresident = '';
  static String secretary = '';
  static String treasurer = '';
  static String auditor = '';
  static String informationOfficer = '';
  static String peaceOfficer = '';
  static String interfaithCatholic = '';
  static String interfaithNonCatholic = '';
  static String outreachOfficer = '';

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    CollectionReference candidates =
        FirebaseFirestore.instance.collection('candidates/$department/list');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          department.toUpperCase(),
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepOrange),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              VoteContainer(
                position: 'president',
                candidates: getNames('president'),
              ),
              VoteContainer(
                position: 'vice president',
                candidates: getNames('vice president'),
              ),
              VoteContainer(
                position: 'secretary',
                candidates: getNames('secretary'),
              ),
              VoteContainer(
                position: 'treasurer',
                candidates: getNames('treasurer'),
              ),
              VoteContainer(
                position: 'auditor',
                candidates: getNames('auditor'),
              ),
              VoteContainer(
                position: 'information officer',
                candidates: getNames('information officer'),
              ),
              VoteContainer(
                position: 'peace officer',
                candidates: getNames('peace officer'),
              ),
              VoteContainer(
                position: 'interfaith(catholic)',
                candidates: getNames('interfaith(catholic)'),
              ),
              VoteContainer(
                position: 'interfaith(noncatholic)',
                candidates: getNames('interfaith(noncatholic)'),
              ),
              VoteContainer(
                position: 'outreach officer',
                candidates: getNames('outreach officer'),
              ),
              ElevatedButton(
                onPressed: () {
                  _updateVoteCount(
                    name: president,
                    candidates: candidates,
                  );
                  _updateVoteCount(
                    name: vicePresident,
                    candidates: candidates,
                  );
                  _updateVoteCount(
                    name: secretary,
                    candidates: candidates,
                  );
                  _updateVoteCount(
                    name: treasurer,
                    candidates: candidates,
                  );
                  _updateVoteCount(
                    name: auditor,
                    candidates: candidates,
                  );
                  _updateVoteCount(
                    name: informationOfficer,
                    candidates: candidates,
                  );
                  _updateVoteCount(
                    name: peaceOfficer,
                    candidates: candidates,
                  );
                  _updateVoteCount(
                    name: interfaithCatholic,
                    candidates: candidates,
                  );
                  _updateVoteCount(
                    name: interfaithNonCatholic,
                    candidates: candidates,
                  );
                  _updateVoteCount(
                    name: outreachOfficer,
                    candidates: candidates,
                  );

                  users.doc(user.uid).update({'vote status': true});
                  Navigator.popAndPushNamed(context, '/thank_you',
                      arguments: ScreenArguments(department: 'cite'));
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<List<RadioModel>> getNames(String position) async {
    List<RadioModel> list = [];
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('candidates/$department/list')
        .where('position', isEqualTo: position)
        .get();
    snapshot.docs.forEach((doc) {
      list.add(RadioModel(isSelected: false, text: doc.id));
    });

    return list;
  }

  _updateVoteCount({String name, CollectionReference candidates}) async {
    DocumentReference documentReference = candidates.doc(name);
    print(name);
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      int newVoteCount = snapshot['votes'] + 1;

      transaction.update(documentReference, {'votes': newVoteCount});
    });
  }
}
