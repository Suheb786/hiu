import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:hiu/decoration/input_decoration.dart';
import 'package:hiu/screens/phoneauthScreen.dart';

import 'package:hiu/widgets/buttons.dart';
import 'package:hiu/widgets/glassContainer.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff0000000),
          body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("We tried so far but couldn't reach the Servers"),
                );
              } else {
                return Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/hiu.png"),
                        FrostedGlass(
                          brdwdth: 2,
                          borderColor: LinearGradient(
                            colors: [
                              Color(0x99ffffff).withOpacity(0.28),
                              Color(0x66ffffff).withOpacity(0.17),
                              // Colors.white.withOpacity(0.60),
                              // Colors.white.withOpacity(0.10),
                              // Colors.white.withOpacity(0.05),
                              // Colors.white.withOpacity(0.09)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [
                              0.3,
                              0.8,

                              // 0.0, 0.39, 0.40, 1.0
                            ],
                          ),
                          height: 362.82,
                          width: 319.64,
                          isFrostedGlass: false,
                          baccha: LoginWidget(),
                          glassColor: LinearGradient(
                            colors: [
                              Color(0xccffffff).withOpacity(0.1),
                              Color(0x33ffffff).withOpacity(0.1)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [
                              2,
                              1,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget LoginWidget() {
    return Form(
      key: _formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Only ",
                  style: TextStyle(
                    fontFamily: 'Sofia',
                    fontWeight: FontWeight.w400,
                    color: Color(0xE3FFFFFF).withOpacity(0.7),
                    fontSize: 12,
                    letterSpacing: 1.5,
                  ),
                ),
                TextSpan(
                  text: "ADMIN ",
                  style: TextStyle(
                    fontFamily: 'Sofia',
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFCC16).withOpacity(0.71),
                    fontSize: 12,
                    letterSpacing: 1.5,
                  ),
                ),
                TextSpan(
                  text: "are Welcomed",
                  style: TextStyle(
                    fontFamily: 'Sofia',
                    fontWeight: FontWeight.w400,
                    color: Color(0xE3FFFFFF).withOpacity(0.7),
                    fontSize: 12,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 41,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (_val) {
                  if (_val!.isEmpty) {
                    return "Please Enter an Email";
                  } else if (!_val.contains("@")) {
                    return "invalid Email";
                  }
                },
                autofillHints: [AutofillHints.email],
                style: TextStyle(
                  color: Colors.white70,
                  letterSpacing: 1.2,
                  fontSize: 17,
                  fontFamily: 'Sofia',
                ),
                controller: emailcontroller,
                decoration: inptdecrtn(hinttext: "Email.."),
              ),
              width: 221.59,
              height: 47.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Color(0xFF62A183),
                  width: 0.71,
                ),
                color: Color(0x33084b26),
              ),
            ),
          ),
          SizedBox(
            height: 15.68,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              child: TextFormField(
                validator: (_val) {
                  if (_val!.isEmpty) {
                    // return "Please Enter Password";
                    //?-->>>TODO--?//
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Password can't be Empty")));
                    //?-->>>TODO--?//
                  } else if (_val
                          .replaceAll(RegExp(r"\s+"),
                              "") //replaceAll(RegExp(r"\s+") to do not count space
                          .length <
                      6) return "Password can't be less than 6 characters";
                },
                style: TextStyle(
                  color: Colors.white70,
                  letterSpacing: 1.2,
                  fontSize: 17,
                  fontFamily: 'Sofia',
                ),
                controller: passwordcontroller,
                obscureText: true,
                decoration: inptdecrtn(hinttext: "Password.."),
              ),
              width: 221.59,
              height: 47.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Color(0xFF62A183),
                  width: 0.71,
                ),
                color: Color(0x33084b26),
              ),
            ),
          ),
          SizedBox(
            height: 66.78,
          ),
          GreenButton(
            onClick: signIn,
            lambai: 48.49,
            chaudai: 136.99,
            text: Center(
              child: Text(
                "Get In",
                style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 17,
                    fontFamily: 'Sofia',
                    color: Colors.black.withOpacity(0.55)),
              ),
            ),
          ),
          SizedBox(height: 15.82),
          InkWell(
            splashColor: Colors.yellow.withOpacity(0.4),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PhoneAuthScreen()));
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Get In with an ",
                    style: TextStyle(
                      fontFamily: 'Sofia',
                      fontWeight: FontWeight.w400,
                      color: Color(0xE3FFFFFF).withOpacity(0.55),
                      fontSize: 11.86,
                      letterSpacing: 1.5,
                    ),
                  ),
                  TextSpan(
                    text: "OTP",
                    style: TextStyle(
                      fontFamily: 'Sofia',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFFD035),
                      fontSize: 11.86,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future signIn() async {
    if (_formkey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim(),
        );
        final email = emailcontroller.text;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Hi, $email")));
        Navigator.of(context).pushReplacementNamed('reg');
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }
  }
}
