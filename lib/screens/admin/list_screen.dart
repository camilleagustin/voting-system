import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:voting_app/extract_arguments.dart';
import 'package:voting_app/widgets/loading.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepOrange),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('candidates/${args.department}/list')
              .where('position', isEqualTo: args.position)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Loading();
            }

            return ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                return ListTile(
                  title: Text(document.id),
                  onTap: () {
                    Navigator.pushNamed(context, '/list_wrapper',
                        arguments: ScreenArguments(
                            docId: document.id,
                            position: document['position'],
                            party: document['party'],
                            screen: args.screen,
                            department: args.department));
                  },
                );
              }).toList(),
            );
          }),
    );
  }
}
