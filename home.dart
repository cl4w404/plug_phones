import 'package:flutter/material.dart';
import 'package:plug_phones/main.dart';
import 'package:flutter/gestures.dart';
import 'package:plug_phones/settings/authentication_services.dart';

class myHome extends StatefulWidget {
  @override
  State<myHome> createState() => _myHomePage();
}

class _myHomePage extends State<myHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome '),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            onPressed: () {},
            child: Center(
              child: Text('Sign Out'),
            ),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
