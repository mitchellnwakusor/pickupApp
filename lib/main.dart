
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pickup/maps/infoHandler/app_info.dart';
import 'package:pickup/screens/canceltrip.dart';
import 'package:pickup/screens/changepassword.dart';
import 'package:pickup/screens/editprofile.dart';
import 'package:pickup/screens/landing_screen.dart';
import 'package:pickup/screens/login.dart';
import 'package:pickup/screens/logisticsinfo.dart';
import 'package:pickup/screens/logisticssummary.dart';
import 'package:pickup/screens/otpverification.dart';
import 'package:pickup/screens/paymentcard.dart';
import 'package:pickup/screens/paymentmethodprofile.dart';
import 'package:pickup/screens/profile.dart';
import 'package:pickup/screens/signup_screen.dart';
import 'package:pickup/screens/startup_screen.dart';
import 'package:pickup/screens/test.dart';
import 'package:provider/provider.dart';

Future main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp(
    child: ChangeNotifierProvider(
      create: (context) => AppInfo(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
         // home: StartScreen(),
        initialRoute: '/',
        routes: {
          // '/': (context) => const PassengerDestination(),

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
      ),
    ),
  ));
}

class MyApp extends StatefulWidget {
  final Widget? child;

  MyApp({this.child});

static void restartApp(BuildContext context)
{
  context.findAncestorStateOfType<_MyAppState>()!.restartApp();
}

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  Key key =UniqueKey();
  void restartApp()
  {
    setState(() {
      key =UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
        key: key,
        child: widget.child!,
    );
  }
}


