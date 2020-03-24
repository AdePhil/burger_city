import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _current = 0;
  var _splashMessage = [
    {'text1': 'World\'s', 'text2': 'Gratest', 'text3': 'Burgers'},
    {'text1': 'World\'s', 'text2': 'Sweetest', 'text3': 'Burgers'},
    {'text1': 'World\'s', 'text2': 'Most Amazing', 'text3': 'Burgers'},
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    ExactAssetImage('assets/images/burger_splash_screen.png'),
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.60), BlendMode.darken),
                fit: BoxFit.cover)),
        child: Stack(children: [
          Positioned(
            top: 85,
            left: 0,
            width: MediaQuery.of(context).size.width,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset('assets/images/logo.png')]),
          ),
          Positioned(
            bottom: 81,
            left: 0,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CarouselSlider(
                  height: 110.0,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  autoPlayInterval: Duration(seconds: 2),
                  onPageChanged: (index) => setState(() {
                    _current = index;
                  }),
                  items: _splashMessage.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: width,
                          margin: const EdgeInsets.only(left: 30, right: 30),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: item['text1'],
                                style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  height: 35 / 31,
                                ),
                              ),
                              TextSpan(text: '\n'),
                              TextSpan(
                                text: item['text2'],
                                style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontSize: 31,
                                  fontWeight: FontWeight.bold,
                                  height: 35 / 31,
                                ),
                              ),
                              TextSpan(text: '\n'),
                              TextSpan(
                                text: item['text3'],
                                style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontSize: 31,
                                  fontWeight: FontWeight.bold,
                                  height: 35 / 31,
                                ),
                              ),
                            ]),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: _splashMessage.asMap().entries.map((entry) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.only(top: 10.0, left: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == entry.key
                                ? Colors.white
                                : Color(0x80ffffff)),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 30.0, left: 30, right: 30),
                  height: 48,
                  child: RaisedButton(
                      onPressed: () {},
                      textColor: Colors.white,
                      color: Color(0xffFF9F1C),
                      padding: const EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      child: new Text(
                        "Get started here",
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
        ]),
      ),
    );
  }
}
