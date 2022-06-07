import 'package:flutter/material.dart';

class Validator{

  String isRequired(String? value){
    String text = '';
    if (value == null ||
        value.trim().isEmpty) {
      text = 'This field is required.';
    }
    return text;
  }
  String? validEmail(String? value){
    if (value == null || value.trim().isEmpty) {
      return 'This field is required.';
    }
    String pattern = r'\w+@\w+\.\w+';
    if (!RegExp(pattern)
        .hasMatch(value)) {
      return 'Invalid E-mail address format.';
    }
    return null;
  }
  String? validMobileNo(String? value){
    if (value == null ||
        value.trim().isEmpty) {
      return 'This field is required.';
    }
    if (value.length < 10) {
      return 'Mobile number is less than 11 digits';
    }
    if (value.length > 10) {
      return 'Mobile number is more than 11 digits';
    }
    return null;
  }
  String? validPassword(String? value){
    if (value == null ||
        value.trim().isEmpty) {
      return 'This field is required';
    }
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    if (!RegExp(pattern)
        .hasMatch(value)) {
      return 'Password should contain an uppercase letter, lowercase letter, number, symbol and should be more than 8 digits';
    }
    return null;
  }
  String? confirmPassword(String? value,TextEditingController password){
    if (value == null ||
        value.trim().isEmpty) {
      return 'This field is required';
    }
    if (password.text.trim() != value) {
      return 'Password does not match';
    }
    return null;
  }



}