import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hiu/screens/registration_screen.dart';
import 'package:hiu/services/phoneAuth_Services.dart';
import 'package:hiu/widgets/buttons.dart';
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
                Image.asset("assets/images/hiu.png"),
                SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textfield(),
                    SizedBox(width: 32),
                    sendbutton(),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.rotate(
                        angle: 3.14,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFFFFFF).withOpacity(0.56),
                                Color(0xFFFFFFFF).withOpacity(0.14),
                              ],
                            ),
                          ),
                          width: 113.62,
                          height: 2.46,
                        ),
                      ),
                      SizedBox(width: 22.38),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Enter  OTP",
                          style: TextStyle(
                              fontFamily: "Sofia",
                              fontSize: 14.16,
                              letterSpacing: 0.5,
                              color: Color(0xccffffff)),
                        ),
                      ),
                      SizedBox(width: 22.38),
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
                          width: 113.62,
                          height: 2.46,
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
                        text: "Send OTP again in ",
                        style: TextStyle(
                            fontFamily: "Sofia",
                            fontSize: 14,
                            letterSpacing: 0.5,
                            color: Color(0xccA5EAD1)),
                      ),
                      TextSpan(
                          text: "00:$start ",
                          style: const TextStyle(
                              fontSize: 14, color: Color(0xccFF82A0))),
                      const TextSpan(
                        text: "sec",
                        style: TextStyle(
                          fontFamily: "Sofia",
                          fontSize: 14,
                          letterSpacing: 0.5,
                          color: Color(0xccA5EAD1),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 83),
                Yellowbutton(
                  onClick: () {
                    authClass.signInwithPhoneNumber(
                        verficationIDFinal, smsCode, context);
                  },
                  hight: 51.68,
                  width: 176.63,
                  text: Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Get ",
                              style: TextStyle(
                                  fontFamily: "Sofia",
                                  fontSize: 17,
                                  letterSpacing: 0.5,
                                  color: Color(0x8cCF00BA))),
                          TextSpan(
                              text: 'In',
                              style: TextStyle(
                                  fontFamily: "Sofia",
                                  fontSize: 17,
                                  letterSpacing: 0.5,
                                  color: Color(0x8c000000)))
                        ],
                      ),
                    ),
                  ),
                ),
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
      keyboardType: TextInputType.number,
      width: MediaQuery.of(context).size.width - 30,
      fieldWidth: 47,
      otpFieldStyle: OtpFieldStyle(
        enabledBorderColor: Color(0x66BDBDBD),
        focusBorderColor: Color(0xccffcc16),
        backgroundColor: Color(0xFF222222),
      ),
      style: TextStyle(
          fontSize: 20, fontFamily: "Sofia", color: Color(0xB3ffcc16)),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.box,
      onCompleted: (pin) {
        print("Completed: " + pin);
        setState(() {
          smsCode = pin;
        });
      },
    );
  }

  Widget sendbutton() {
    return Container(
      height: 28.32,
      width: 66.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.03),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.1,
            0.7,
            1,
          ],
          colors: [Color(0xffa6ffe4), Color(0xff2dd0a9), Color(0xff00b88c)],
        ),
      ),
      child: Center(
        child: TextButton(
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
                  fontFamily: "Sofia",
                  color: wait ? Color(0xE6409247) : Color(0xE6014A60),
                  fontWeight: FontWeight.w400,
                  fontSize: 14.16),
            )),
      ),
    );
  }

  Widget textfield() {
    return Container(
      width: MediaQuery.of(context).size.width - 180,
      height: 47.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.16),
        border: Border.all(
          color: Color(0xcc9fffd1),
          width: 0.71,
        ),
        color: Color(0x55064D26),
      ),
      child: TextFormField(
        style: TextStyle(
            color: Color(0xCCFFF16F),
            fontFamily: 'Sofia',
            letterSpacing: 0.5,
            fontWeight: FontWeight.w400,
            fontSize: 16.16),
        controller: phonecontroller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Enter Your Phone No.",
          hintStyle: TextStyle(
              fontFamily: "Sofia", color: Colors.white54, fontSize: 14.16),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(vertical: 17, horizontal: 15),
            child: Text(
              "(+91)",
              style: TextStyle(
                fontFamily: 'Sofia',
                color: Colors.white70,
                fontSize: 14.16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setData(verificationID) {
    setState(() {
      verficationIDFinal = verificationID;
    });
    startTimer();
  }
}
