import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiu/decoration/input_decoration.dart';
import 'package:hiu/widgets/buttons.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentControl extends StatefulWidget {
  const PaymentControl({Key? key}) : super(key: key);

  @override
  _PaymentControlState createState() => _PaymentControlState();
}

class _PaymentControlState extends State<PaymentControl> {
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
  } // Do something when an external wallet is selected}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Yellowbutton(
              hight: 51.68,
              width: 314.68,
              onClick: () {
                openCheckout();
              },
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
          ],
        ),
      ),
    );
  }
}
