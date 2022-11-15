import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:voting_app/constants.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _globalKey = GlobalKey<FormState>();

  final _ctrlName = TextEditingController();
  final _ctrlStudentNum = TextEditingController();
  final _ctrlYearAndCourse = TextEditingController();
  final _ctrlBirthDate = TextEditingController();
  final _ctrlAge = TextEditingController();
  final _ctrlAddress = TextEditingController();
  final _ctrlApplication = TextEditingController();
  final _ctrlPosition = TextEditingController();
  final _ctrlParty = TextEditingController();
  final _ctrlOrganization = TextEditingController();
  final _ctrlQuestion = TextEditingController();

  @override
  void dispose() {
    _ctrlName.dispose();
    _ctrlStudentNum.dispose();
    _ctrlYearAndCourse.dispose();
    _ctrlBirthDate.dispose();
    _ctrlAge.dispose();
    _ctrlAddress.dispose();
    _ctrlApplication.dispose();
    _ctrlPosition.dispose();
    _ctrlParty.dispose();
    _ctrlOrganization.dispose();
    _ctrlQuestion.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppName),
      ),
      body: Form(
        key: _globalKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(),
              child: Image.asset(
                'assets/apec.jpg',
                width: 300,
                height: 250,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'CANDIDACY FORM',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              '(Please fill in duplicate form)',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            nameTextField(),
            SizedBox(
              height: 20,
            ),
            studentTextField(),
            SizedBox(
              height: 20,
            ),
            courseTextField(),
            SizedBox(
              height: 20,
            ),
            birthdayTextField(),
            SizedBox(
              height: 20,
            ),
            ageTextField(),
            SizedBox(
              height: 20,
            ),
            addressTextField(),
            SizedBox(
              height: 20,
            ),
            appTextField(),
            SizedBox(
              height: 20,
            ),
            positionTextField(),
            SizedBox(
              height: 20,
            ),
            ppaTextField(),
            SizedBox(
              height: 20,
            ),
            nocTextField(),
            SizedBox(
              height: 20,
            ),
            Text(
                'Please answer the following questions in not more than three (3) sentences.'),
            SizedBox(
              height: 20,
            ),
            textTextField(),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (_globalKey.currentState.validate()) {
                  _sendForm();
                  users.doc(user.uid).update({'submitted form': true});
                  Navigator.popAndPushNamed(context, '/response');
                }
              },
              child: Center(
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  void _sendForm() {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('applications')
        .doc(_ctrlName.text);
    docRef.set({
      'name': _ctrlName.text,
      'student number': _ctrlStudentNum.text,
      'year and course': _ctrlYearAndCourse.text,
      'birthday': _ctrlBirthDate.text,
      'age': int.parse(_ctrlAge.text),
      'address': _ctrlAddress.text,
      'application': _ctrlApplication.text,
      'position': _ctrlPosition.text,
      'political party affiliation': _ctrlParty.text,
      'organization/council': _ctrlOrganization.text,
    });
  }

  Widget nameTextField() {
    return TextFormField(
      controller: _ctrlName,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Name",
        hintText: "Last Name, First Name MI.",
      ),
    );
  }

  Widget studentTextField() {
    return TextFormField(
      controller: _ctrlStudentNum,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 1,
        )),
        labelText: "Student Number",
        hintText: "ex:03-1920-04907",
      ),
    );
  }

  Widget courseTextField() {
    return TextFormField(
      controller: _ctrlYearAndCourse,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 1,
        )),
        labelText: "Year & Course",
        hintText: "ex: 2BSIT",
      ),
    );
  }

  Widget birthdayTextField() {
    return TextFormField(
      controller: _ctrlBirthDate,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 1,
        )),
        labelText: "Birthday",
        hintText: "mm-dd-yyyy",
      ),
    );
  }

  Widget ageTextField() {
    return TextFormField(
      controller: _ctrlAge,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 0.5,
        )),
        labelText: "Age",
      ),
    );
  }

  Widget addressTextField() {
    return TextFormField(
      controller: _ctrlAddress,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 1,
        )),
        labelText: "Current Address",
      ),
    );
  }

  Widget appTextField() {
    return TextFormField(
      controller: _ctrlApplication,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 1,
        )),
        labelText: "Candidate Application",
        hintText: "Organization",
      ),
    );
  }

  Widget positionTextField() {
    return TextFormField(
      controller: _ctrlPosition,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 1,
        )),
        labelText: "Position",
      ),
    );
  }

  Widget ppaTextField() {
    return TextFormField(
      controller: _ctrlParty,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 1,
        )),
        labelText: "Political Party Affiliation",
      ),
    );
  }

  Widget nocTextField() {
    return TextFormField(
      controller: _ctrlOrganization,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 1,
        )),
        labelText: "Name of Organization/Council",
      ),
    );
  }

  Widget textTextField() {
    return TextFormField(
      controller: _ctrlQuestion,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      minLines: 3,
      maxLines: 3,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 1,
        )),
        labelText: "Why do you want to be an officer?",
      ),
    );
  }
}
