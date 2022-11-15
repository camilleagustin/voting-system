import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:voting_app/extract_arguments.dart';

class DeleteCandidateScreen extends StatelessWidget {
  const DeleteCandidateScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as ScreenArguments;
    CollectionReference candidates = FirebaseFirestore.instance
        .collection('candidates/${args.department}/list');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepOrange),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      return showDialog(
                        context: context,
                        builder: (alert) => AlertDialog(
                          title: Text('Delete Data'),
                          content: Text(
                              'Are you sure you want to delete this data?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  candidates.doc(args.docId).delete();
                                  Navigator.of(alert).pop();
                                  Navigator.pop(context);
                                },
                                child: Text('Yes',
                                    style: TextStyle(fontSize: 18.0))),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(alert).pop();
                                },
                                child: Text('No',
                                    style: TextStyle(fontSize: 18.0))),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    child: Text(
                      'DELETE',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
