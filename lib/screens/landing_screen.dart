import 'package:flutter/material.dart';
import 'package:pickup/assets/customthemes/custom_color_theme.dart';
import 'package:pickup/assets/customthemes/custom_text_theme.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  CustomColorTheme colorTheme = CustomColorTheme();
  CustomTextTheme textTheme = CustomTextTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorTheme.backgroundColor,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
             children: [
        const Expanded(child: SizedBox(height: 64.0)),
              //HeaderCard
              Container(
                // color: Colors.amber,
                padding: const EdgeInsets.all(16.0),
                // margin: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Subheading', style: textTheme.startScreen_subheaderLight,),
                    Text('Heading', style: textTheme.startScreen_headerLight,),
                  ],
                ),
              ),
              //ImageCard
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  height: 228,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    image: DecorationImage(
                        image: const AssetImage('lib/assets/images/home_banner.png'),
                        opacity: 0.8,
                        fit: BoxFit.values[5]),
                  ),
                ),
              ),
              //CtoCard
              Expanded(
                flex: 3,
                child: Container(
                  // color: Colors.purple,
                  padding: const EdgeInsets.all(16.0),
                  // margin: EdgeInsets.all(8.0),
                  // height: 152.0,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(5.0),
                            shape: MaterialStateProperty.all(const StadiumBorder()),
                            backgroundColor: MaterialStateProperty.all(colorTheme.btnColor),
                            // minimumSize: MaterialStateProperty.all(const Size(328.0, 48.0)), // maximumSize: MaterialStateProperty.all((const Size(328.0*2, 48.0*2)))
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/signupScreen');
                        },
                        child: Text(
                          'SIGN UP',
                          style: textTheme.btnLight,
                        ),
                      ),
                      // const SizedBox(height: 16.0),
                      TextButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(5.0),
                            shape: MaterialStateProperty.all(const StadiumBorder()),
                            backgroundColor: MaterialStateProperty.all(colorTheme.btnColor),
                            // minimumSize: MaterialStateProperty.all(const Size(328.0, 48.0))
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/loginScreen');
                        },
                        child: Text(
                          'LOGIN',
                          style: textTheme.btnLight,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
