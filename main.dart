import 'package:flutter/material.dart';
import 'package:plug_phones/pages/login.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter/gestures.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plug_phones/settings/authentication_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plug wa samsung',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = '';
  var password = '';
  var phone = '';
  var email = '';
  bool _isHidden = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(children: <Widget>[
          Positioned(
            bottom: 50,
            right: 300,
            child: Container(
              alignment: Alignment.centerRight,
              height: 700.0,
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
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.all(100),
                  child: Column(children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.perm_identity),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 40.0),
                          labelText: "Name",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.length < 4) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: (value) => setState(() => name = value!)),
                    const SizedBox(
                      height: 15,
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
                          prefixIcon: Icon(Icons.phone_android),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 40.0),
                          labelText: "Phone No",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mobile number';
                          }
                          return null;
                        },
                        onSaved: (value) => setState(() => phone = value!)),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      obscureText: _isHidden,
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
                      onPressed: () {
                        final isValid = _formKey.currentState!.validate();
                        if (isValid) {
                          _formKey.currentState!.save();
                          final value = email;
                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                              content: Text('Your enail is $email'),
                            ));
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      label: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(
                        Icons.person_add,
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
                        text: 'already a member??',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Login!! ',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => login()));
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
            bottom: 50,
            left: 300,
            child: Container(
              color: Colors.blue,
              height: 700.0,
              width: 400.0,
              alignment: Alignment.centerLeft,
            ),
          ),
        ]),
      ),
    );
  }
}
