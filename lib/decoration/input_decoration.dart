import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

InputDecoration inptdecrtn({required String hinttext}) {
  return InputDecoration(
      errorStyle: TextStyle(
          color: Colors.redAccent.withOpacity(0.9),
          fontFamily: "Sofia",
          fontSize: 10),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      hintStyle: TextStyle(
          letterSpacing: 1.0,
          color: Colors.white54,
          fontSize: 17,
          fontFamily: 'Sofia'),
      hintText: hinttext);
}
