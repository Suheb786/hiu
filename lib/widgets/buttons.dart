import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GreenButton extends StatelessWidget {
  final Widget text;
  final double chaudai;
  final double lambai;
  final void Function()? onClick;
  const GreenButton({
    Key? key,
    required this.lambai,
    required this.chaudai,
    required this.text,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        child: text,
        width: chaudai,
        height: lambai,
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
      ),
    );
  }
}

class Yellowbutton extends StatelessWidget {
  final Widget text;
  final double hight;
  final double width;
  final void Function()? onClick;

  const Yellowbutton(
      {Key? key,
      required this.text,
      this.onClick,
      required this.hight,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        child: text,
        width: width,
        height: 51.29,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.03),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.1,
              0.75,
              1,
            ],
            colors: [
              Color(0xfffbe6c2),
              Color(0xfff0c929),
              Color(0xfff48b29),
            ],
          ),
        ),
      ),
    );
  }
}
