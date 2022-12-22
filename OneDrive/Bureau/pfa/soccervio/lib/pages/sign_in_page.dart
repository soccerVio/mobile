// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soccervio/util/constance.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    var screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    var screenwidth = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // ignore: prefer_const_literals_to_create_immutables
            colors: [
              Color.fromARGB(255, 50, 51, 52),
              Color.fromARGB(255, 0, 0, 0),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight / 2 - 80,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   'LOGO',
                  //   style: GoogleFonts.kanit(
                  //     color: Colors.white,
                  //     textStyle: TextStyle(
                  //       fontWeight: FontWeight.w400,
                  //       fontSize: 50,
                  //     ),
                  //   ),
                  // ),
                  Image.asset(
                    MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? "assets/images/logo-1.png"
                        : "assets/images/logo-2.png",
                    height: 200,
                  ),
                  Text(
                    'WELCOME BACK',
                    style: GoogleFonts.kanit(
                      color: Colors.white,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: backgroundCol,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 120, 205, 186),
                      spreadRadius: 3,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              top: 40,
                              left: 83,
                            ),
                            child: Text(
                              'SIGN IN',
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 230,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          decoration: InputDecoration(hintText: 'E-Mail'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 230,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Password'),
                        ),
                      ),
                    ),
                    InkWell(
                      // onTap: () => Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ChatScreen(),
                      //   ),
                      // ),
                      child: Container(
                        margin: EdgeInsets.only(top: 25),
                        width: 230,
                        height: 50,
                        color: green,
                        child: Center(
                          child: Text(
                            'Sign in',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Forgot password ?',
                      style: TextStyle(color: blue),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Text.rich(
                      TextSpan(
                        text: '''Don't have an account ?''',
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            text: '  Sign up',
                            style: TextStyle(color: blue),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
