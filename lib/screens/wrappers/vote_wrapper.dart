import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:voting_app/extract_arguments.dart';
import 'package:voting_app/screens.dart';
import 'package:voting_app/screens/user/already_voted_screen.dart';
import 'package:voting_app/widgets/loading.dart';

class VoteWrapper extends StatelessWidget {

  const VoteWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }

        if (snapshot.data['vote status'] == true) {
          return AlreadyVotedScreen();
        }
        return SchoolLevelScreen();
      },
    );
  }
}
