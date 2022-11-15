import 'package:flutter/material.dart';
import 'package:voting_app/extract_arguments.dart';
import 'package:voting_app/widgets/image_button.dart';

class CollegeDepartmentScreen extends StatefulWidget {
  @override
  _CollegeDepartmentScreenState createState() =>
      _CollegeDepartmentScreenState();
}

class _CollegeDepartmentScreenState extends State<CollegeDepartmentScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as ScreenArguments;
    print(args.screen);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "College",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.deepOrange),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ImageButton(
                    text: 'CSS',
                    imagePath: 'assets/css.png',
                    onTap: () {
                      Navigator.pushNamed(context, '/college_wrapper',
                          arguments: ScreenArguments(
                              screen: args.screen, department: 'css'));
                    },
                  ),
                  ImageButton(
                    text: 'CITE',
                    imagePath: 'assets/cite.png',
                    onTap: () {
                      Navigator.pushNamed(context, '/college_wrapper',
                          arguments: ScreenArguments(
                              screen: args.screen, department: 'cite'));
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ImageButton(
                    text: 'CMA',
                    imagePath: 'assets/cma.png',
                    onTap: () {
                      Navigator.pushNamed(context, '/college_wrapper',
                          arguments: ScreenArguments(
                              screen: args.screen, department: 'cma'));
                    },
                  ),
                  ImageButton(
                    text: 'CEA',
                    imagePath: 'assets/cea.png',
                    onTap: () {
                      Navigator.pushNamed(context, '/college_wrapper',
                          arguments: ScreenArguments(
                              screen: args.screen, department: 'cea'));
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ImageButton(
                    text: 'CHS',
                    imagePath: 'assets/chs.png',
                    onTap: () {
                      Navigator.pushNamed(context, '/college_wrapper',
                          arguments: ScreenArguments(
                              screen: args.screen, department: 'chs'));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
