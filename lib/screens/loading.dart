import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late bool isFirstLaunch;

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

  // fakes loading
  void loadData() async{
    isFirstLaunch = await firstLaunch();
    Future.delayed(const Duration(seconds: 3), (){
      if(isFirstLaunch){
        // Navigator.pushReplacementNamed(context, '/landingScreen');
      }
      else if(!isFirstLaunch /* and User not logged in*/){
        // Navigator.pushReplacementNamed(context, '/signupScreen');
      }
      Navigator.pushNamed(context, '/splashScreen');
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
          child: Text(
              'PickUp!',
            style: TextStyle(
              fontSize: 56.0,
              fontWeight: FontWeight.bold,
              color: Colors.white

            ),
          )
      )
    );
  }
}
