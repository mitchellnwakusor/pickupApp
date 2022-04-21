import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // fakes loading
  void loadData(){
    Future.delayed(const Duration(seconds: 3), (){
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
