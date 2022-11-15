import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app/widgets/loading.dart';

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();
    String voteStatus;

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

        if (snapshot.data['vote status']) {
          voteStatus = 'Voted';
        } else {
          voteStatus = 'Not yet voted';
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Status',
              style: (TextStyle(
                color: Colors.black,
              )),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.deepOrange),
          ),
          body: Center(
            child: Container(
              padding: EdgeInsets.all(50.0),
              color: Colors.green,
              child: Text(
                voteStatus,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}
