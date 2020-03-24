import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatelessWidget {
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage('assets/images/burger_splash_screen.png'),
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.60), BlendMode.darken),
              fit: BoxFit.cover)),
      child: Stack(children: [
        Positioned(
          top: 85,
          left: 0,
          width: MediaQuery.of(context).size.width,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/images/logo.png'),
          ]),
        ),
        Positioned(
            top: 250,
            left: 0,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Welcome Back!",
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    height: 35 / 31,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Login to continue Burger City",
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 35 / 31,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: TextFormField(
                              decoration: InputDecoration(
                                  icon: SvgPicture.asset(
                                    'assets/icons/mail-icon.svg',
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Email Address'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              }),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3))),
                          child: TextFormField(
                              decoration: InputDecoration(
                                  icon: SvgPicture.asset(
                                    'assets/icons/lock-icon.svg',
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Password'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              }),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Remember Me",
                              style: GoogleFonts.nunito(
                                color: Colors.white.withOpacity(0.66),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                height: 35 / 31,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Forgot password?",
                                style: GoogleFonts.nunito(
                                  color: Colors.white.withOpacity(0.66),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  height: 35 / 31,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(top: 35.0),
                          height: 48,
                          child: RaisedButton(
                              onPressed: () {},
                              textColor: Colors.white,
                              color: Color(0xffFF9F1C),
                              padding: const EdgeInsets.all(8.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              child: new Text(
                                "Log In",
                                style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
        Positioned(
            bottom: 150,
            left: 0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Text("New user? Sign up",
                      style: TextStyle(
                        color: Color(0xffFF9F1C),
                      )),
                ),
              ],
            )),
        Positioned(
            bottom: 60,
            left: 0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                      "By signing up you indicate that you have read and agreed to the Patch Terms of Service",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ],
            ))
      ]),
    ));
  }
}
