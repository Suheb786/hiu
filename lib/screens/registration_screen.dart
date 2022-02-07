import 'package:flutter/cupertino.dart';

import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:hiu/decoration/regField_decoration.dart';

import 'package:hiu/widgets/buttons.dart';

import 'package:hiu/widgets/glassContainer.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

String buttonText = "DD/MM/YY";
final TextEditingController _firstname = TextEditingController();
final TextEditingController _lastname = TextEditingController();
final TextEditingController _email = TextEditingController();
final TextEditingController _address = TextEditingController();

class _RegistrationScreenState extends State<RegistrationScreen> {
  DateTime dateTime = DateTime.now();
  late Razorpay _razorpay;
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black26,
        body: Stack(
          children: [
            Center(
                child: Image.asset(
              'assets/images/regbg.png',
            )),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 260,
                      child: RichText(
                          text: TextSpan(children: [
                        WidgetSpan(
                            child: GradientText(
                          "When ",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 12,
                              height: 1.25,
                              fontFamily: "Sofia",
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.9),
                          colors: [Color(0xb3BEBEBE), Color(0xff7a7a7a)],
                        )),
                        WidgetSpan(
                            child: GradientText("opportunity ",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 13,
                                    height: 1.25,
                                    fontFamily: "Sofia",
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.9),
                                colors: const [
                              Color(0xff998417),
                              Color(0xff6f6639)
                            ])),
                        WidgetSpan(
                            child: GradientText("doesn't knock",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 12,
                                    height: 1.25,
                                    fontFamily: "Sofia",
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.9),
                                colors: [
                              Color(0xff5e5e5e),
                              Color(0xff4f4f4f)
                            ])),
                        WidgetSpan(
                            child: GradientText("          Hiu build the door.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    height: 1.25,
                                    fontFamily: "Sofia",
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.9),
                                colors: [
                              Color(0xb3BEBEBE).withOpacity(0.85),
                              Color(0x80A6A6A6).withOpacity(0.5)
                            ])),
                      ])),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FrostedGlass(
                      brdwdth: 0.7,
                      isFrostedGlass: false,
                      height: MediaQuery.of(context).size.height - 180,
                      width: MediaQuery.of(context).size.width - 10,
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
                      glassColor: LinearGradient(
                        colors: [
                          Color(0x99ffffff).withOpacity(0.06),
                          Color(0x66ffffff).withOpacity(0.02)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [
                          2,
                          1,
                        ],
                      ),
                      baccha: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 16,
                                width: 18,
                              ),
                              //*Registration Text//
                              GradientText(
                                "Registration :",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 34,
                                  fontFamily: "Sofia Pro",
                                  fontWeight: FontWeight.w700,
                                ),
                                colors: [
                                  Color(0xb3A6A6A6).withOpacity(0.95),
                                  Color(0x40A6A6A6)
                                ],
                                gradientType: GradientType.linear,
                                gradientDirection: GradientDirection.ttb,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 65,
                          ),
                          //*Label Text {Name} //
                          Row(
                            children: const [
                              SizedBox(
                                width: 18,
                              ),
                              Text(
                                "First Name",
                                style: TextStyle(
                                  color: Color(0xf2d3d3d3),
                                  fontSize: 14.16,
                                  letterSpacing: 0.71,
                                  fontFamily: "Sofia",
                                ),
                              ),
                              SizedBox(
                                width: 93,
                              ),
                              Text(
                                "Last Name",
                                style: TextStyle(
                                  fontFamily: "Sofia",
                                  color: Color(0xf2d3d3d3),
                                  fontSize: 14.16,
                                  letterSpacing: 0.71,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 9.7,
                          ),
                          //*TextField {Name} //
                          Row(
                            children: [
                              SizedBox(
                                width: 17.23,
                              ),
                              SizedBox(
                                height: 47.08,
                                width: 150.79,
                                child: TextFormField(
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      color: Color(0xE3FFFFFF),
                                      fontSize: 14,
                                      fontFamily: 'Sofia'),
                                  controller: _firstname,
                                  decoration: registrationField("Mohammad"),
                                ),
                              ),
                              SizedBox(
                                width: 17.23,
                              ),
                              SizedBox(
                                height: 47.08,
                                width: 150.79,
                                child: TextFormField(
                                  style: const TextStyle(
                                      letterSpacing: 1.0,
                                      color: Color(0xE3FFFFFF),
                                      fontSize: 14,
                                      fontFamily: 'Sofia'),
                                  controller: _lastname,
                                  decoration: registrationField("Alam"),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //*Label Text {Email} //
                          Row(
                            children: const [
                              SizedBox(
                                width: 18,
                              ),
                              Text(
                                "Phone No.",
                                style: TextStyle(
                                  color: Color(0xf2d3d3d3),
                                  fontSize: 14.16,
                                  letterSpacing: 0.71,
                                  fontFamily: "Sofia",
                                ),
                              ),
                              SizedBox(
                                width: 93,
                              ),
                              Text(
                                "Email ID",
                                style: TextStyle(
                                  fontFamily: "Sofia",
                                  color: Color(0xf2d3d3d3),
                                  fontSize: 14.16,
                                  letterSpacing: 0.71,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 9.7,
                          ),
                          //*TextField {Email} //
                          Row(
                            children: [
                              SizedBox(
                                width: 17.23,
                              ),
                              SizedBox(
                                height: 47.08,
                                width: 121,
                                child: TextFormField(
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      color: Color(0xE3FFFFFF),
                                      fontSize: 14,
                                      fontFamily: 'Sofia'),
                                  decoration: registrationField("9876543210"),
                                ),
                              ),
                              SizedBox(
                                width: 17.23,
                              ),
                              SizedBox(
                                height: 47.08,
                                width: 184.98,
                                child: TextFormField(
                                  style: const TextStyle(
                                      letterSpacing: 1.0,
                                      color: Color(0xE3FFFFFF),
                                      fontSize: 14,
                                      fontFamily: 'Sofia'),
                                  controller: _email,
                                  decoration: registrationField("Email"),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.7,
                          ),
                          //*Label Text {Family, DOB, PinCode} //
                          Row(
                            children: const [
                              SizedBox(
                                width: 18,
                              ),
                              Text(
                                "Family Members",
                                style: TextStyle(
                                  color: Color(0xf2d3d3d3),
                                  fontSize: 14.16,
                                  letterSpacing: 0.71,
                                  fontFamily: "Sofia",
                                ),
                              ),
                              SizedBox(
                                width: 43,
                              ),
                              Text(
                                "DOB",
                                style: TextStyle(
                                  fontFamily: "Sofia",
                                  color: Color(0xf2d3d3d3),
                                  fontSize: 14.16,
                                  letterSpacing: 0.71,
                                ),
                              ),
                              SizedBox(
                                width: 57,
                              ),
                              Text(
                                "PinCode",
                                style: TextStyle(
                                  fontFamily: "Sofia",
                                  color: Color(0xf2d3d3d3),
                                  fontSize: 14.16,
                                  letterSpacing: 0.71,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 9.89,
                          ),
                          //*TextField {Family, PinCode} //
                          Row(
                            children: [
                              SizedBox(
                                width: 17.23,
                              ),
                              SizedBox(
                                height: 40.08,
                                width: 39,
                                child: TextFormField(
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      color: Color(0xE3FFFFFF),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Sofia'),
                                  decoration: registrationField("4"),
                                ),
                              ),
                              SizedBox(
                                width: 103,
                              ),
                              //*Date Picker //
                              InkWell(
                                onTap: () => showSheet(
                                  context,
                                  child: buildDatePicker(),
                                  onClicked: () {
                                    final value =
                                        DateFormat('MM/dd/yy').format(dateTime);

                                    // ScaffoldMessenger.of(context)
                                    //     .showSnackBar(SnackBar(
                                    //   content: Text("Selected $value"),
                                    // ));
                                    buttonText = "$value";
                                    Navigator.pop(context);
                                  },
                                ),
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      buttonText,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.0,
                                          color: Color(0xA1FFFFFF),
                                          fontSize: 10,
                                          fontFamily: 'Sofia'),
                                    ),
                                  ),
                                  height: 40.08,
                                  width: 76,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xA1FFFFFF)),
                                      color: Color(0x6600370C),
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ),
                              //? {Alternative}  TextField for DOB
                              // SizedBox(
                              //   height: 40.08,
                              //   width: 39,
                              //   child: TextFormField(
                              //     style: const TextStyle(
                              //         letterSpacing: 1.0,
                              //         color: Color(0xE3FFFFFF),
                              //         fontWeight: FontWeight.bold,
                              //         fontSize: 14,
                              //         fontFamily: 'Sofia'),
                              //     controller: _email,
                              //     decoration: registrationField("Email"),
                              //   ),
                              // ),
                              // SizedBox(
                              //   width: 2,
                              // ),
                              // SizedBox(
                              //   height: 40.08,
                              //   width: 39,
                              //   child: TextFormField(
                              //     style: const TextStyle(
                              //         letterSpacing: 1.0,
                              //         color: Color(0xE3FFFFFF),
                              //         fontWeight: FontWeight.bold,
                              //         fontSize: 14,
                              //         fontFamily: 'Sofia'),
                              //     controller: _email,
                              //     decoration: registrationField("Email"),
                              //   ),
                              // ),
                              // SizedBox(
                              //   width: 2,
                              // ),
                              // SizedBox(
                              //   height: 40.08,
                              //   width: 39,
                              //   child: TextFormField(
                              //     style: const TextStyle(
                              //         letterSpacing: 1.0,
                              //         color: Color(0xE3FFFFFF),
                              //         fontWeight: FontWeight.bold,
                              //         fontSize: 14,
                              //         fontFamily: 'Sofia'),
                              //     controller: _email,
                              //     decoration: registrationField("Email"),
                              //   ),
                              // ),
                              SizedBox(
                                width: 30,
                              ),
                              SizedBox(
                                height: 40.08,
                                width: 70,
                                child: TextFormField(
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0,
                                      color: Color(0xE3FFFFFF),
                                      fontSize: 12,
                                      fontFamily: 'Sofia'),
                                  controller: _email,
                                  decoration: registrationField("xxx"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Yellowbutton(
                      hight: 51.68,
                      width: 300,
                      onClick: () {
                        openCheckout();
                      },
                      text: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Pay ",
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
                                  fontWeight: FontWeight.w600,
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDatePicker() {
    return Center(
      child: SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          minimumYear: 1940,
          maximumYear: DateTime.now().year,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      ),
    );
  }

  static void showSheet(BuildContext context,
      {required Widget child, required VoidCallback onClicked}) {
    showCupertinoModalPopup(
        context: context,
        builder: (ctx) {
          return CupertinoActionSheet(
            actions: [
              child,
            ],
            cancelButton: CupertinoActionSheetAction(
                onPressed: onClicked, child: Text("Done")),
          );
        });
  }

  openCheckout() {
    var option = {
      'key': 'rzp_test_moG7BkvICzm1ZR',
      'amount': 1500 * 100, //in the smallest currency sub-unit.
      'name': 'HiU Enterprize.',
      // Generate order_id using Orders API
      'description': 'Registration Entry Fees',
      'timeout': 230, // in seconds
      'prefill': {'contact': '9876543120', 'email': 'team@softkru.com'},
      "external": {
        "wallets": ["paytm"]
      }
    };
    try {
      _razorpay.open(option);
    } catch (e) {
      print(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Successfull");
  } // Do something when payment succeeds}

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment Failed");
  } // Do something when payment fails}

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("External Wallet");
  }
}





















//! User Signed in Email String on screen !//
//   body: Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         IconButton(
//           onPressed: () {
//             FirebaseAuth.instance.signOut();
//             Navigator.of(context).pushReplacementNamed('/');
//           },
//           icon: Icon(
//             Icons.logout,
//             color: Colors.white,
//           ),
//         ),
//         Yellowbutton(
//           hight: 51.68,
//           width: 314.68,
//           onClick: () {},
//           text: Center(
//             child: RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: "Pay",
//                     style: TextStyle(
//                       fontFamily: 'Sofia',
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xffCF00BA).withOpacity(0.55),
//                       fontSize: 16.86,
//                       letterSpacing: 0.84,
//                     ),
//                   ),
//                   TextSpan(
//                     text: "to Proceed            ",
//                     style: TextStyle(
//                       fontFamily: 'Sofia',
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF090909).withOpacity(0.55),
//                       fontSize: 16.86,
//                       letterSpacing: 0.84,
//                     ),
//                   ),
//                   TextSpan(
//                     text: "1500 ₹",
//                     style: TextStyle(
//                       fontFamily: 'Sofia',
//                       fontWeight: FontWeight.w400,
//                       color: Colors.black45.withOpacity(0.55),
//                       fontSize: 16.86,
//                       letterSpacing: 0.84,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 50,
//         ),
//       ],
//     ),
//   ),
// ),
