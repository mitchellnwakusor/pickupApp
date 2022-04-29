import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Hello, nice to meet you!',style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white70,
                  letterSpacing: 1.0
                ),),
              ),
               const SizedBox(height: 8.0,),
               const Text('Get a new logistics experience',style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),),
              Container(
                height: 360,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/home_banner.png'),
                  opacity: 0.8,
                  fit: BoxFit.values[5]
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(const StadiumBorder()),
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        minimumSize:
                            MaterialStateProperty.all(const Size(0, 48.0))),
                    onPressed: (
                        ) {
                      Navigator.pushNamed(context, '/signupScreen');
                    },
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 1.0),
                    ),
                  ),
                 const SizedBox(height: 24.0),
                  TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(const StadiumBorder()),
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        minimumSize:
                        MaterialStateProperty.all(const Size(0, 48.0))),
                    onPressed: () {
                      Navigator.pushNamed(context, '/loginScreen');
                    },
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 1.0),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
