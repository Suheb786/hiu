import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hiu/widgets/buttons.dart';
import 'package:hiu/widgets/glassContainer.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("assets/images/bg.png"), // <-- BACKGROUND IMAGE
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/hiu.png'),
                SizedBox(
                  height: 80,
                ),
                Transform.rotate(
                  angle: 3.14,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFFFFFF).withOpacity(0.14),
                          Color(0xFFFFFFFF).withOpacity(0.56),
                        ],
                      ),
                    ),
                    width: 232.92,
                    height: 2.46,
                  ),
                ),
                SizedBox(
                  height: 33,
                ),
                Column(
                  children: [
                    FrostedGlass(
                      brdwdth: 2,
                      borderColor: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.40),
                          Colors.white.withOpacity(0.10),
                          Colors.white.withOpacity(0.05),
                          Colors.white.withOpacity(0.1)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 0.39, 0.40, 1.0],
                      ),
                      glassColor: LinearGradient(
                        colors: [
                          Color(0x4Dffffff).withOpacity(0.16),
                          Color(0x33ffffff).withOpacity(0.08)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      height: 222,
                      width: 261,
                      isFrostedGlass: false,
                      baccha: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.9),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 21,
                            ),
                            GreenButton(
                              lambai: 48.13,
                              chaudai: 175.31,
                              onClick: () {
                                Navigator.pushNamed(context, "lgn");
                              },
                              text: Center(
                                child: Text(
                                  "Maintainer",
                                  style: TextStyle(
                                      fontFamily: 'Sofia',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.86,
                                      letterSpacing: 2.53,
                                      color:
                                          Color(0xff004131).withOpacity(0.71)),
                                ),
                              ),
                            ),
                            SizedBox(height: 17.34),
                            Transform.rotate(
                              angle: 3.14,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFFFFF).withOpacity(0.56),
                                      Color(0xFFFFFFFF).withOpacity(0.14),
                                    ],
                                  ),
                                ),
                                width: 115.64,
                                height: 2.46,
                              ),
                            ),
                            SizedBox(height: 17.34),
                            Yellowbutton(
                              width: 175.31,
                              hight: 51.29,
                              onClick: () {
                                Navigator.pushNamed(context, 'phn');
                              },
                              text: Center(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "New ",
                                        style: TextStyle(
                                          fontFamily: 'Sofia',
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffCF00BA)
                                              .withOpacity(0.55),
                                          fontSize: 16.86,
                                          letterSpacing: 0.84,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Registration",
                                        style: TextStyle(
                                          fontFamily: 'Sofia',
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Colors.black45.withOpacity(0.55),
                                          fontSize: 16.86,
                                          letterSpacing: 0.84,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.73,
                            ),
                            InkWell(
                              onTap: () {},
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Alread a ",
                                      style: TextStyle(
                                        fontFamily: 'Sofia',
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 12,
                                        letterSpacing: 0.84,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Member ?",
                                      style: TextStyle(
                                        fontFamily: 'Sofia',
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffFF82A0),
                                        fontSize: 12,
                                        letterSpacing: 0.84,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18.27,
                    ),
                    InkWell(
                      onTap: () {
                        print("ji haan");
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "How it ",
                              style: TextStyle(
                                fontFamily: 'Sofia',
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 12,
                                letterSpacing: 0.84,
                              ),
                            ),
                            TextSpan(
                              text: "Works ?",
                              style: TextStyle(
                                fontFamily: 'Sofia',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF3BD66A),
                                fontSize: 12,
                                letterSpacing: 0.84,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
