import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:plug_phones/main.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:email_validator/email_validator.dart';
import 'package:plug_phones/settings/authentication_services.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _LoginPage();
}

class _LoginPage extends State<login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plug wa samsung',
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  var password = '';
  var email = '';
  bool _isHidden = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Stack(children: <Widget>[
            Positioned(
              bottom: 100,
              right: 300,
              child: Container(
                alignment: Alignment.centerRight,
                height: 600.0,
                width: 600.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.white,
                      Colors.white,
                    ],
                  ),
                ),
                child: Form(
                  child: Container(
                    padding: EdgeInsets.all(100),
                    child: Column(children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                          onSaved: (value) => setState(() => email = value!)),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 40.0),
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.length < 8) {
                            return 'Enter atleast 8 characters';
                          }
                          return null;
                        },
                        onSaved: (value) => setState(() => password = value!),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      RaisedButton.icon(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        label: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        textColor: Colors.white,
                        splashColor: Colors.red,
                        color: Colors.lightBlue,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: 1.0,
                          width: 130.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      ButtonBar(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SignInButton(
                            Buttons.Google,
                            text: "Sign up with Google",
                            onPressed: () {
                              print('googled');
                            },
                          ),
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Not yet registered?? ',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Register!! ',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyHomePage()));
                                  },
                                style: TextStyle(
                                  color: Colors.blue,
                                )),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: 300,
              child: Container(
                color: Colors.blue,
                height: 600.0,
                width: 400.0,
                alignment: Alignment.centerLeft,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
