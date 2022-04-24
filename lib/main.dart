import 'package:flutter/material.dart';
import 'package:pickup/pages/changepassword.dart';
import 'package:pickup/pages/editprofile.dart';
import 'package:pickup/pages/loading.dart';
import 'package:pickup/pages/login.dart';
import 'package:pickup/pages/paymentcard.dart';
import 'package:pickup/pages/profile.dart';
import 'package:pickup/pages/signup.dart';
import 'package:pickup/pages/splashscreen.dart';
import 'package:pickup/pages/test.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/splashScreen': (context) => const StartScreen(),
      '/signupScreen': (context) =>  const Signup(),
      '/loginScreen': (context) => const Login(),
      '/profileScreen': (context) => const ProfileScreen(),
      '/editProfileScreen': (context) => const EditProfile(),
      '/testScreen': (context) => const Test(),
      '/paymentCardScreen': (context) =>  const PaymentCard(),
      '/changePasswordScreen': (context) => const ChangePassword()
    },
  ));
}

