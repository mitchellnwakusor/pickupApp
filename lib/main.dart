
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pickup/screens/canceltrip.dart';
import 'package:pickup/screens/changepassword.dart';
import 'package:pickup/screens/editprofile.dart';
import 'package:pickup/screens/login.dart';
import 'package:pickup/screens/logisticsinfo.dart';
import 'package:pickup/screens/logisticssummary.dart';
import 'package:pickup/screens/otpverification.dart';
import 'package:pickup/screens/paymentcard.dart';
import 'package:pickup/screens/paymentmethodprofile.dart';
import 'package:pickup/screens/profile.dart';
import 'package:pickup/screens/signup_screen.dart';
import 'package:pickup/screens/landing_screen.dart';
import 'package:pickup/screens/startup_screen.dart';
import 'package:pickup/screens/test.dart';

Future main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      // home: OTPVerification(),
    // home: Signup(),
    initialRoute: '/',
    routes: {
      '/': (context) => const StartupScreen(),
      '/landingScreen': (context) => const LandingScreen(),
      '/signupScreen': (context) =>  const Signup(),
      '/loginScreen': (context) => const Login(),
      '/profileScreen': (context) => const ProfileScreen(),
      '/editProfileScreen': (context) => const EditProfile(),
      '/testScreen': (context) => const Test(),
      '/addPaymentCardScreen': (context) =>  const PaymentCard(),
      '/changePasswordScreen': (context) => const ChangePassword(),
      '/cancelTripScreen': (context) => const CancelTrip(),
      '/logisticsInfoScreen': (context) => const LogisticsInfo(),
      '/logisticsSummaryScreen': (context) => const LogisticsSummary(),
      '/otpVerificationScreen': (context) => const OTPVerification(),
    '/paymentMethodProfileScreen': (context) => const PaymentMethodProfile(),
    },
  ));
}

