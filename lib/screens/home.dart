import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
