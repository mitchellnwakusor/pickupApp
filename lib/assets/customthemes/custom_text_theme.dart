import 'package:flutter/material.dart';

class CustomTextTheme {

  /// Light mode theme ///

  TextStyle startScreenLight = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 48.0
  );

  TextStyle startScreen_titleLight = const TextStyle(
    fontWeight: FontWeight.w800,
    color: Colors.white,
    fontSize: 40.0,
  );

  TextStyle startScreen_headerLight = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 32.0,
  );

  TextStyle btnLight = const TextStyle(
    letterSpacing: 1.0,
    color: Colors.white,
    fontSize: 16.0,
  );

  TextStyle labelLight = TextStyle(
    color: Colors.grey[500],
    fontSize: 16.0,
  );

  TextStyle startScreen_subheaderLight = const TextStyle(
      color: Colors.white70,
      fontSize: 16.0,
      letterSpacing: 1.0
  );

  TextStyle textLight = const TextStyle(
    color: Colors.white,
    fontSize: 16.0,
    letterSpacing: 1.0
  );

  TextStyle pageHeader = const TextStyle(
      color: Colors.blue,
      fontSize: 24.0,
    fontWeight: FontWeight.w600
  );

  TextStyle hyperlinkLight = const TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      letterSpacing: 1.0
  );

  TextStyle actionBtnLight = const TextStyle(
    color: Colors.blue,
    fontSize: 16.0,
  );

  /// Dark mode theme ///

  TextStyle startScreen_headerDark = const TextStyle(
    fontWeight: FontWeight.w800,
    color: Colors.blue,
    fontSize: 32.0,
  );

  TextStyle textDark = const TextStyle(
    color: Colors.black45,
    fontSize: 16.0,
    // letterSpacing: 1.0
  );

  TextStyle hyperlinkDark = TextStyle(
      color: Colors.blue[800],
      fontSize: 16.0,
      letterSpacing: 1.0
  );


  // TextStyle bannerDark = const TextStyle(
  //     fontWeight: FontWeight.bold,
  //     color: Colors.white,
  //     fontSize: 48.0
  // );
  //
  // TextStyle startScreen_subheaderDark = TextStyle(
  //   fontWeight: FontWeight.w400,
  //   color: Colors.grey[300],
  //   fontSize: 16.0,
  // );


}