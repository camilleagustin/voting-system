import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app/extract_arguments.dart';
import 'package:voting_app/screens.dart';
import 'package:voting_app/screens/results_screen.dart';
import 'package:voting_app/widgets/loading.dart';

class CollegeWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as ScreenArguments;

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

        if (snapshot.data['role'] == 'admin') {
          if (args.screen == 'result') {
            return ResultsScreen(
              department: args.department,
            );
          }
          return ElectScreen(
            department: args.department,
          );
        }
        if (args.screen == 'result') {
          return ResultsScreen(
            department: args.department,
          );
        }
        return VoteScreen(
          department: args.department,
        );
      },
    );
  }
}
