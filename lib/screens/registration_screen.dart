import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hiu/widgets/buttons.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black26,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacementNamed('/');
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              Yellowbutton(
                hight: 51.68,
                width: 314.68,
                onClick: () {},
                text: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Pay",
                          style: TextStyle(
                            fontFamily: 'Sofia',
                            fontWeight: FontWeight.w400,
                            color: Color(0xffCF00BA).withOpacity(0.55),
                            fontSize: 16.86,
                            letterSpacing: 0.84,
                          ),
                        ),
                        TextSpan(
                          text: "to Proceed            ",
                          style: TextStyle(
                            fontFamily: 'Sofia',
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF090909).withOpacity(0.55),
                            fontSize: 16.86,
                            letterSpacing: 0.84,
                          ),
                        ),
                        TextSpan(
                          text: "1500 ₹",
                          style: TextStyle(
                            fontFamily: 'Sofia',
                            fontWeight: FontWeight.w400,
                            color: Colors.black45.withOpacity(0.55),
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
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
