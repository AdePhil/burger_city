import 'package:burger_city/screens/home.dart';
import 'package:burger_city/screens/signup.dart';
import 'package:burger_city/screens/welcome.dart';
import 'package:burger_city/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  BaseAuth auth = new Auth();
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() async {
    try {
      final FirebaseUser user = await widget.auth.getCurrentUser();
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
        return;
      }
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Welcome()));
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return new Container();
  }
}
