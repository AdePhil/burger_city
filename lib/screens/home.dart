import 'package:burger_city/screens/login.dart';
import 'package:burger_city/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  BaseAuth auth = new Auth();
  Future<void> logout(context) async {
    try {
      await auth.signOut();
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: Center(
          child: GestureDetector(
            onTap: () {
              logout(context);
            },
            child: Text(
              "Welcome Home!",
              style: GoogleFonts.nunito(
                color: Theme.of(context).primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.w900,
                height: 35 / 31,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
