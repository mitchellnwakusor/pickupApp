import 'package:flutter/material.dart';
import 'package:pickup/pages/canceltrip.dart';
import 'package:pickup/pages/changepassword.dart';
import 'package:pickup/pages/editprofile.dart';
import 'package:pickup/pages/loading.dart';
import 'package:pickup/pages/login.dart';
import 'package:pickup/pages/logisticsinfo.dart';
import 'package:pickup/pages/logisticssummary.dart';
import 'package:pickup/pages/otpverification.dart';
import 'package:pickup/pages/paymentcard.dart';
import 'package:pickup/pages/paymentmethodprofile.dart';
import 'package:pickup/pages/profile.dart';
import 'package:pickup/pages/signup.dart';
import 'package:pickup/pages/splashscreen.dart';
import 'package:pickup/pages/test.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: PaymentMethodProfile(),
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
      '/changePasswordScreen': (context) => const ChangePassword(),
      '/cancelTripScreen': (context) => const CancelTrip(),
      '/logisticsInfoScreen': (context) => const LogisticsInfo(),
      '/logisticsSummaryScreen': (context) => const LogisticsSummary(),
      '/otpVerificationScreen': (context) => const OTPVerification(),
    '/paymentMethodProfileScreen': (context) => const PaymentMethodProfile(),
    },
  ));
}

