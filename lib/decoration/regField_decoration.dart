import 'package:flutter/material.dart';

InputDecoration registrationField(String hinttext) {
  return InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      filled: true,
      fillColor: Color(0x6600370C),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.5),
          borderSide: BorderSide(color: Color(0xffEA3B3B), width: 2)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.5),
          borderSide: BorderSide(color: Color(0xFFEAA73B), width: 1)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xA1FFFFFF), width: 1),
          borderRadius: BorderRadius.circular(3.5)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xD0DB9E2C), width: 1.5),
          borderRadius: BorderRadius.circular(3.5)),
      hintStyle: TextStyle(
          letterSpacing: 1.0,
          color: Colors.white54,
          fontSize: 14,
          fontFamily: 'Sofia'),
      hintText: hinttext);
}
