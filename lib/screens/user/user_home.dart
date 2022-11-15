import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app/constants.dart';
import 'package:voting_app/extract_arguments.dart';
import 'package:voting_app/services/auth.dart';
import 'package:voting_app/widgets/big_green_button.dart';

class UserHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton.icon(
            onPressed: () async {
              context.read<AuthenticationService>().signOut();
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            label: Text('Logout',
                style: TextStyle(color: Colors.white, fontSize: 18)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 400,
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 100),
                child: Text(
                  kAppName,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              SizedBox(
                height: 200.0,
              ),
              BigGreenButton(
                  label: 'Vote',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/vote_wrapper',
                      arguments: ScreenArguments(screen: 'vote'),
                    );
                  }),
              SizedBox(
                height: 10,
              ),
              BigGreenButton(
                label: 'Form',
                onPressed: () => Navigator.pushNamed(context, '/form_wrapper'),
              ),
              SizedBox(
                height: 10,
              ),
              BigGreenButton(
                label: 'Status',
                onPressed: () => Navigator.pushNamed(context, '/status'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
