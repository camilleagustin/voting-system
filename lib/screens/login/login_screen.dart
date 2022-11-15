import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app/services/auth.dart';
import 'package:voting_app/widgets/loading.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginKey = GlobalKey<FormState>();
  final _ctrlUsername = TextEditingController();
  final _ctrlPassword = TextEditingController();
  bool _obscureText = true;
  bool isLoading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text(
                'Login',
                style: (TextStyle(color: Colors.black)),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _loginKey,
                child: Column(
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      onSaved: (value) => _ctrlUsername.text = value,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: _ctrlUsername,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.green),
                      ),
                    ),
                    TextFormField(
                      obscureText: _obscureText,
                      textInputAction: TextInputAction.done,
                      onSaved: (value) => _ctrlPassword.text = value,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: _ctrlPassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.green),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(_obscureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _submit,
                            child: Text(
                              "Submit",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  _submit() {
    final _form = _loginKey.currentState;
    if (_form.validate()) {
      _form.save();
      _loginUser();
    } else {
      print("Form is Invalid");
    }
  }

  _loginUser() async {
    setState(() {
      isLoading = true;
    });

    final logMessage = await context
        .read<AuthenticationService>()
        .signIn(email: _ctrlUsername.text, password: _ctrlPassword.text);

    if (logMessage != "Signed In") {
      setState(() {
        isLoading = false;
        if (logMessage == "No user found for that email.") {
          error = 'Account does not exist';
        } else if (logMessage == "Wrong password provided for that user.") {
          error = 'Password is incorrect';
        } else {
          error = 'Something went wrong';
        }
      });
    }
  }
}
