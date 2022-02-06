import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:hiu/screens/landingscreen.dart';
import 'package:hiu/screens/loginscreen.dart';
import 'package:hiu/screens/payment_controller.dart';
import 'package:hiu/screens/phoneauthScreen.dart';
import 'package:hiu/screens/registration_screen.dart';
import 'package:hiu/screens/temp.dart';

import 'package:hiu/services/phoneAuth_Services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthClass authClass = AuthClass();
  Widget currentPage = LoginScreen();

  @override
  void initState() {
    super.initState();
    // authClass.signOut();
    checkLogin();
  }

  checkLogin() async {
    String? tokne = await authClass.getToken();
    print("tokne");
    if (tokne != null)
      setState(() {
        RegistrationScreen();
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        // "temp": (ctx) => Temp(),
        "/": (ctx) => LandingScreen(),
        "lgn": (ctx) => LoginScreen(),
        "phn": (ctx) => PhoneAuthScreen(),
        "reg": (ctx) => RegistrationScreen(),
        "pay": (ctx) => PaymentControl(),
      },
    );
  }
}
