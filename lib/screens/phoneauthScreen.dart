import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hiu/screens/registration_screen.dart';
import 'package:hiu/services/phoneAuth_Services.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({Key? key}) : super(key: key);

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  int start = 30;
  bool wait = false;
  String buttonName = "Send";
  TextEditingController phonecontroller = TextEditingController();
  AuthClass authClass = AuthClass();
  String verficationIDFinal = "";
  String smsCode = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                textfield(),
                button(),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Enter 6 Digit OTP",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                otpField(),
                const SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Send OTP again ",
                        style:
                            TextStyle(fontSize: 16, color: Colors.yellowAccent),
                      ),
                      TextSpan(
                          text: "00:$start ",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.blue)),
                      const TextSpan(
                          text: "sec ",
                          style: TextStyle(
                              fontSize: 16, color: Colors.yellowAccent))
                    ],
                  ),
                ),
                letsRegisterButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  Widget otpField() {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width - 34,
      fieldWidth: 50,
      otpFieldStyle: OtpFieldStyle(
          backgroundColor: Color(0xFF252525), borderColor: Colors.white),
      style: TextStyle(fontSize: 17, color: Colors.white),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        print("Completed: " + pin);
        setState(() {
          smsCode = pin;
        });
      },
    );
  }

  Widget button() {
    return TextButton(
        onPressed: wait
            ? null
            : () async {
                startTimer();
                setState(() {
                  start = 30;
                  wait = true;
                  buttonName = "Resend";
                });
                await authClass.verifyPhoneNmber(
                    "+91 ${phonecontroller.text}", context, setData);
              },
        child: Text(
          buttonName,
          style: TextStyle(
              color: wait ? Colors.greenAccent : Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ));
  }

  Widget textfield() {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xFF363636),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: phonecontroller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Enter Your Phone Number",
          hintStyle: TextStyle(color: Colors.white54, fontSize: 17),
          contentPadding: EdgeInsets.symmetric(vertical: 19, horizontal: 8),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
            child: Text(
              "(+91)",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget letsRegisterButton() {
    return ElevatedButton(
        onPressed: () {
          authClass.signInwithPhoneNumber(verficationIDFinal, smsCode, context);
        },
        child: Text("Let's Register"));
  }

  void setData(verificationID) {
    setState(() {
      verficationIDFinal = verificationID;
    });
    startTimer();
  }
}
