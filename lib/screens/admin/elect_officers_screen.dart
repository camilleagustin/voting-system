import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting_app/widgets/elect_container.dart';

class ElectScreen extends StatefulWidget {
  final String department;

  const ElectScreen({Key key, this.department}) : super(key: key);

  @override
  _ElectScreenState createState() => _ElectScreenState();
}

class _ElectScreenState extends State<ElectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.department.toUpperCase(),
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepOrange),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              ElectContainer(
                position: 'president',
                department: widget.department,
              ),
              SizedBox(
                height: 25.0,
              ),
              ElectContainer(
                position: 'vice president',
                department: widget.department,
              ),
              SizedBox(
                height: 25.0,
              ),
              ElectContainer(
                position: 'secretary',
                department: widget.department,
              ),
              SizedBox(
                height: 25.0,
              ),
              ElectContainer(
                position: 'treasurer',
                department: widget.department,
              ),
              SizedBox(
                height: 25.0,
              ),
              ElectContainer(
                position: 'auditor',
                department: widget.department,
              ),
              SizedBox(
                height: 25.0,
              ),
              ElectContainer(
                position: 'information officer',
                department: widget.department,
              ),
              SizedBox(
                height: 25.0,
              ),
              ElectContainer(
                position: 'peace officer',
                department: widget.department,
              ),
              SizedBox(
                height: 25.0,
              ),
              ElectContainer(
                position: 'interfaith(catholic)',
                department: widget.department,
              ),
              SizedBox(
                height: 25.0,
              ),
              ElectContainer(
                position: 'interfaith(noncatholic)',
                department: widget.department,
              ),
              SizedBox(
                height: 25.0,
              ),
              ElectContainer(
                position: 'outreach officer',
                department: widget.department,
              ),
              SizedBox(
                height: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
