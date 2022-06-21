import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pickup/assets/customthemes/custom_color_theme.dart';
import 'package:pickup/assets/customthemes/custom_text_theme.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({Key? key}) : super(key: key);

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {

  final CustomColorTheme _customColorTheme = CustomColorTheme();
  final CustomTextTheme _customTextTheme = CustomTextTheme();

  late bool isFirstLaunch;

  //functions to run on init
 firstLaunch() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? firstLaunch = preferences.getBool('first_launch');

    if(firstLaunch != null && !firstLaunch){ //if not first launch
      //check if user is logged in
      return false;
    }
    else{
      preferences.setBool('first_launch', false);
      return true;
    }

  }

  startupLoading() async{
    isFirstLaunch = await firstLaunch();
    Duration duration = const Duration(seconds: 3);
    return Timer(duration, () {
      // print(isFirstLaunch);
      if(isFirstLaunch){
        Navigator.pushReplacementNamed(context, '/landingScreen');
      }
      else if(!isFirstLaunch /* and User not logged in*/){
        Navigator.pushReplacementNamed(context, '/signupScreen');
      }
      // else{
      //   Navigator.pushReplacementNamed(context, '/homeScreen');
      // }
    });
  }

  @override
  void initState(){
    super.initState();
    startupLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _customColorTheme.backgroundColor,
      body: Center(child: Text('Pickup!', style: _customTextTheme.startScreenLight)),
    );
  }
}
