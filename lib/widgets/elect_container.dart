import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:voting_app/extract_arguments.dart';

class ElectContainer extends StatefulWidget {
  final String position;
  final String department;

  const ElectContainer({Key key, this.position, this.department})
      : super(key: key);

  @override
  _ElectContainerState createState() => _ElectContainerState();
}

class _ElectContainerState extends State<ElectContainer> {
  final _ctrlFirstName = TextEditingController();
  final _ctrlLastName = TextEditingController();
  final _ctrlParty = TextEditingController();
  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  widget.position.toUpperCase(),
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Form(
                    key: _globalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          controller: _ctrlFirstName,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "First Name",
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: _ctrlLastName,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Last Name",
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: _ctrlParty,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Political Party Affiliation",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  if (_globalKey.currentState.validate()) {
                    _sendForm();
                    _ctrlFirstName.clear();
                    _ctrlLastName.clear();
                    _ctrlParty.clear();

                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(SnackBar(content: Text('Success!')));
                  }
                },
                child: Text("ADD"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/list',
                      arguments: ScreenArguments(
                          department: widget.department,
                          position: widget.position,
                          screen: 'delete'));
                },
                child: Text("DELETE"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/list',
                      arguments: ScreenArguments(
                          department: widget.department,
                          position: widget.position,
                          screen: 'view'));
                },
                child: Text("VIEW"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _sendForm() {
    String name = '${_ctrlFirstName.text} ${_ctrlLastName.text}';
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('candidates/${widget.department}/list')
        .doc(name);
    docRef.set({
      'name': name,
      'position': widget.position,
      'party': _ctrlParty.text,
      'votes': 0,
    });
  }
}
