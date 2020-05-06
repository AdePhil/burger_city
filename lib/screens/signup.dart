import 'package:burger_city/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:burger_city/screens/login.dart';
import 'package:burger_city/services/auth.dart';
import 'package:burger_city/utils/alert.dart';

class SignUp extends StatefulWidget {
  BaseAuth auth = new Auth();
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = new GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _username = '';
  String _errorMessage = '';
  bool _isLoading = false;
  bool _autoValidate = false;

  signUp() async {
    if (!isFormValid()) {
      setState(() {
        _autoValidate = true;
      });
      return;
    }
    setState(() {
      this._isLoading = true;
    });
    try {
      _formKey.currentState.save();
      print("here $_email $_password");
      String userId = await widget.auth.signUp(_email, _password, _username);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      print(userId);
    } catch (e) {
      print(e.message);
      Alert.showErrorAlert(context, 'Sorry', e.message);
    } finally {
      setState(() {
        this._isLoading = false;
      });
    }
  }

  isFormValid() {
    return _formKey.currentState.validate();
  }

  Widget buildCustomPrefixIcon(SvgPicture svg) {
    return Container(
      width: 0,
      height: 10,
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment(0, 0.0),
      child: svg,
    );
  }

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
          top: MediaQuery.of(context).size.height * 0.09,
          left: 0,
          width: MediaQuery.of(context).size.width,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/images/logo.png'),
          ]),
        ),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: 0,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: <Widget>[
                    SizedBox(height: 40),
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
                      "Sign up to continue Burger City",
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 35 / 31,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      autovalidate: _autoValidate,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 80,
                              child: TextFormField(
                                  onSaved: (value) {
                                    this._email = value.trim().toLowerCase();
                                  },
                                  decoration: InputDecoration(
                                      errorStyle: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                      isDense: true,
                                      focusedBorder: new OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 0.5,
                                          style: BorderStyle.none,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(6.0),
                                        ),
                                      ),
                                      border: new OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 0.5,
                                          style: BorderStyle.none,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(6.0),
                                        ),
                                      ),
                                      prefixIcon: buildCustomPrefixIcon(
                                          SvgPicture.asset(
                                        'assets/icons/mail-icon.svg',
                                        fit: BoxFit.cover,
                                      )),
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Email Address'),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  }),
                            ),
                            // SizedBox(
                            //   height: 18,
                            // ),
                            SizedBox(
                              height: 80,
                              child: TextFormField(
                                  onSaved: (value) {
                                    this._username = value.trim().toLowerCase();
                                  },
                                  decoration: InputDecoration(
                                      errorStyle: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                      focusedBorder: new OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 0.5,
                                          style: BorderStyle.none,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(6.0),
                                        ),
                                      ),
                                      isDense: true,
                                      border: new OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 0.5,
                                          style: BorderStyle.none,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(6.0),
                                        ),
                                      ),
                                      prefixIcon: buildCustomPrefixIcon(
                                          SvgPicture.asset(
                                        'assets/icons/lock-icon.svg',
                                        fit: BoxFit.cover,
                                      )),
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Username'),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter a valid username';
                                    }
                                    return null;
                                  }),
                            ),
                            // SizedBox(height: 20),
                            SizedBox(
                              height: 80,
                              child: TextFormField(
                                  onSaved: (value) {
                                    this._password = value.trim();
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      errorStyle: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                      isDense: true,
                                      focusedBorder: new OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 0.5,
                                          style: BorderStyle.none,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(6.0),
                                        ),
                                      ),
                                      border: new OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 0.5,
                                          style: BorderStyle.none,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(6.0),
                                        ),
                                      ),
                                      prefixIcon: buildCustomPrefixIcon(
                                          SvgPicture.asset(
                                        'assets/icons/lock-icon.svg',
                                        fit: BoxFit.cover,
                                      )),
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Password'),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter a valid passord';
                                    }
                                    return null;
                                  }),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(top: 35.0),
                              height: 48,
                              child: RaisedButton(
                                  onPressed: signUp,
                                  textColor: Colors.white,
                                  color: Theme.of(context).primaryColor,
                                  padding: const EdgeInsets.all(8.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  child: _isLoading
                                      ? Container(
                                          width: 20,
                                          height: 20,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              backgroundColor: Colors.white,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Theme.of(context)
                                                          .primaryColor),
                                            ),
                                          ),
                                        )
                                      : new Text(
                                          "Sign Up",
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
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: Text("Have an account? Login",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor)),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Row(
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
                      )
                    ],
                  ),
                )
              ],
            )),
        // Positioned(
        //     bottom: 150,
        //     left: 0,
        //     width: MediaQuery.of(context).size.width,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       mainAxisSize: MainAxisSize.max,
        //       children: <Widget>[
        //         GestureDetector(
        //           onTap: () {},
        //           child: Text("New user? Sign up",
        //               style: TextStyle(
        //                 color: Theme.of(context).primaryColor
        //               )),
        //         ),
        //       ],
        //     )),
        // Positioned(
        //     bottom: 60,
        //     left: 0,
        //     width: MediaQuery.of(context).size.width,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       mainAxisSize: MainAxisSize.max,
        //       children: <Widget>[
        //         Container(
        //           width: MediaQuery.of(context).size.width * 0.7,
        //           child: Text(
        //               "By signing up you indicate that you have read and agreed to the Patch Terms of Service",
        //               textAlign: TextAlign.center,
        //               style: GoogleFonts.nunito(
        //                 color: Colors.white,
        //                 fontSize: 12,
        //                 fontWeight: FontWeight.w500,
        //               )),
        //         ),
        //       ],
        //     ))
      ]),
    ));
  }
}

class d {}
