import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:burger_city/screens/signup.dart';
import 'package:burger_city/services/auth.dart';
import 'package:burger_city/screens/home.dart';

class Login extends StatefulWidget {
  BaseAuth auth = new Auth();
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = new GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _errorMessage = '';
  bool _isLoading = false;

  login() async {
    setState(() {
      this._isLoading = true;
    });
    try {
      _formKey.currentState.save();

      String userId = await widget.auth.signIn(_email, _password);
      print(userId);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } catch (e) {
      print(e.status);
      print(e.message);
    } finally {
      setState(() {
        this._isLoading = false;
      });
    }
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 0),
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
                                },
                                onSaved: (value) => _email = value.trim(),
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                              child: TextFormField(
                                obscureText: true,
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
                                },
                                onSaved: (value) => _password = value.trim(),
                              ),
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
                                  onPressed: () {
                                    login();
                                  },
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
                                      builder: (context) => SignUp()));
                            },
                            child: Text("New user? Sign up",
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
      ]),
    ));
  }
}
