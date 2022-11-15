import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app/extract_arguments.dart';
import 'package:voting_app/services/auth.dart';
import 'package:voting_app/widgets/big_green_button.dart';

class AdminHomeScreen extends StatelessWidget {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigGreenButton(
              label: 'Elect',
              onPressed: () => navigateSchoolLevel(context, 'elect'),
            ),
            SizedBox(
              height: 10,
            ),
            BigGreenButton(
              label: 'View votes results',
              onPressed: () => navigateSchoolLevel(context, 'result'),
            ),
          ],
        ),
      ),
    );
  }

  void navigateSchoolLevel(BuildContext context, String screen) =>
      Navigator.pushNamed(context, '/school_level',
          arguments: ScreenArguments(screen: screen));
}
