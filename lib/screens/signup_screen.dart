import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pickup/assets/customthemes/custom_color_theme.dart';
import 'package:pickup/assets/customthemes/custom_text_theme.dart';
import 'package:pickup/services/firebaseauthentication.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //form key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late bool createUserSuccess;
  late bool storeUserSuccess;
  late int error;

  //formfield controllers
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();


  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    emailAddress.dispose();
    mobileNo.dispose();
    password.dispose();
    confirmPassword.dispose();

    super.dispose();
  }

  //alert dialogs
  AlertDialog tandc = AlertDialog(
    title: const Text('Terms and Conditions'),
    titlePadding: const EdgeInsets.all(24.0),
    titleTextStyle: const TextStyle(
      fontWeight: FontWeight.w800,
      color: Colors.white,
      fontSize: 24.0,
    ),
    content: const Text(
        'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum '),
    contentPadding: const EdgeInsets.all(24.0),
    contentTextStyle: const TextStyle(
        color: Colors.white, fontSize: 16.0, letterSpacing: 1.0),
    backgroundColor: Colors.blue[800],
    scrollable: true,
    alignment: Alignment.topCenter,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
  );

  AlertDialog privacyUse = AlertDialog(
    title: const Text('Privacy Use'),
    titlePadding: const EdgeInsets.all(24.0),
    titleTextStyle: const TextStyle(
      fontWeight: FontWeight.w800,
      color: Colors.white,
      fontSize: 24.0,
    ),
    content: const Text(
        'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum '),
    contentPadding: const EdgeInsets.all(24.0),
    contentTextStyle: const TextStyle(
        color: Colors.white, fontSize: 16.0, letterSpacing: 1.0),
    backgroundColor: Colors.blue[800],
    scrollable: true,
    alignment: Alignment.topCenter,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
  );



  CustomColorTheme colorTheme = CustomColorTheme();
  CustomTextTheme textTheme = CustomTextTheme();

   late AuthService authService = AuthService(firstName, lastName, emailAddress, mobileNo,password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: colorTheme.appBarBg,
      //   foregroundColor: colorTheme.appBarFg,
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // color: Colors.grey,
            height: MediaQuery.of(context).size.height,
            // padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 48.0),
                Container(
                  padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Create an Account',
                        style: textTheme.pageHeader,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32.0),
                Expanded(
                  child: Container(
                    // padding: EdgeInsets.all(24.0),
                    // color: Colors.purple,
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 450,
                            padding: const EdgeInsets.all(24.0),
                            // color: Colors.blue,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextFormField(
                                    controller: firstName,
                                    autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[A-Za-z]'))
                                    ],
                                    validator: (value) {
                                      if (value == null || value.trim().isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        label: const Text('First Name'),
                                        hintText: 'John',
                                        border: const OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(
                                                  colorTheme.backgroundColor.hashCode),
                                            ))),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                    controller: lastName,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[A-Za-z]'))
                                    ],
                                    validator: (value) {
                                      if (value == null || value.trim().isEmpty) {
                                        return 'This field is required.';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        label: const Text('Last Name'),
                                        hintText: 'Doe',
                                        border: const OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(
                                                  colorTheme.backgroundColor.hashCode),
                                            ))),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                    controller: emailAddress,
                                    validator: (value) {
                                      if (value == null || value.trim().isEmpty) {
                                        return 'This field is required.';
                                      }
                                      String pattern = r'\w+@\w+\.\w+';
                                      if (!RegExp(pattern).hasMatch(value)) {
                                        return 'Invalid E-mail address format.';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(
                                          RegExp('[!#/\$~&*]'))
                                    ],
                                    decoration: InputDecoration(
                                        label: Text('Email Address'),
                                        hintText: 'johndoe@gmail.com',
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(
                                                    colorTheme.appColor.hashCode)))),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                    controller: mobileNo,
                                    validator: (value) {
                                      if (value == null || value.trim().isEmpty) {
                                        return 'This field is required.';
                                      }
                                      if (value.length < 10) {
                                        return 'Mobile number is less than 11 digits';
                                      }
                                      if (value.length > 10) {
                                        return 'Mobile number is more than 11 digits';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                        label: Text('Mobile Number'),
                                        prefix: Text('+234'),
                                        hintText: '8012345678',
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(
                                                    colorTheme.appColor.hashCode)))),
                                    keyboardType: TextInputType.phone,
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                    controller: password,
                                    validator: (value) {
                                      if (value == null || value.trim().isEmpty) {
                                        return 'This field is required';
                                      }
                                      String pattern =
                                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                                      if (!RegExp(pattern).hasMatch(value)) {
                                        return 'Password should contain an uppercase letter, lowercase letter, number, symbol and should be more than 8 digits';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        label: Text('Password'),
                                        // hintText: 'johndoe@gmail.com',
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(colorTheme.appColor.hashCode),
                                            ))),
                                    obscureText: true,
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                    controller: confirmPassword,
                                    validator: (value) {
                                      if (value == null || value.trim().isEmpty) {
                                        return 'This field is required';
                                      }
                                      if (password.text.trim() != value) {
                                        return 'Password does not match';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        label: Text('Confirm Password'),
                                        // hintText: 'johndoe@gmail.com',
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(colorTheme.appColor.hashCode),
                                            ))),
                                    obscureText: true,
                                  ),
                                  const SizedBox(height: 16.0),
                                ],
                              ),
                            ),
                          ),
                          // const SizedBox(height: 16.0),
                          // Expanded(
                          //   child: TextFormField(
                          //     controller: firstName,
                          //     autovalidateMode:
                          //         AutovalidateMode.onUserInteraction,
                          //     inputFormatters: [
                          //       FilteringTextInputFormatter.allow(
                          //           RegExp('[A-Za-z]'))
                          //     ],
                          //     validator: (value) {
                          //       if (value == null || value.trim().isEmpty) {
                          //         return 'This field is required';
                          //       }
                          //       return null;
                          //     },
                          //     decoration: InputDecoration(
                          //         label: const Text('First Name'),
                          //         hintText: 'John',
                          //         border: const OutlineInputBorder(),
                          //         focusedBorder: OutlineInputBorder(
                          //             borderSide: BorderSide(
                          //           color: Color(
                          //               colorTheme.backgroundColor.hashCode),
                          //         ))),
                          //   ),
                          // ),
                          // const SizedBox(height: 16.0),
                          // Expanded(
                          //   child: TextFormField(
                          //     autovalidateMode:
                          //         AutovalidateMode.onUserInteraction,
                          //     controller: lastName,
                          //     inputFormatters: [
                          //       FilteringTextInputFormatter.allow(
                          //           RegExp('[A-Za-z]'))
                          //     ],
                          //     validator: (value) {
                          //       if (value == null || value.trim().isEmpty) {
                          //         return 'This field is required.';
                          //       }
                          //       return null;
                          //     },
                          //     decoration: InputDecoration(
                          //         label: const Text('Last Name'),
                          //         hintText: 'Doe',
                          //         border: const OutlineInputBorder(),
                          //         focusedBorder: OutlineInputBorder(
                          //             borderSide: BorderSide(
                          //           color: Color(
                          //               colorTheme.backgroundColor.hashCode),
                          //         ))),
                          //   ),
                          // ),
                          // const SizedBox(height: 16.0),
                          // Expanded(
                          //   child: TextFormField(
                          //     autovalidateMode:
                          //         AutovalidateMode.onUserInteraction,
                          //     controller: emailAddress,
                          //     validator: (value) {
                          //       if (value == null || value.trim().isEmpty) {
                          //         return 'This field is required.';
                          //       }
                          //       String pattern = r'\w+@\w+\.\w+';
                          //       if (!RegExp(pattern).hasMatch(value)) {
                          //         return 'Invalid E-mail address format.';
                          //       }
                          //       return null;
                          //     },
                          //     inputFormatters: [
                          //       FilteringTextInputFormatter.deny(
                          //           RegExp('[!#/\$~&*]'))
                          //     ],
                          //     decoration: InputDecoration(
                          //         label: Text('Email Address'),
                          //         hintText: 'johndoe@gmail.com',
                          //         border: OutlineInputBorder(),
                          //         focusedBorder: OutlineInputBorder(
                          //             borderSide: BorderSide(
                          //                 color: Color(
                          //                     colorTheme.appColor.hashCode)))),
                          //     keyboardType: TextInputType.emailAddress,
                          //   ),
                          // ),
                          // const SizedBox(height: 16.0),
                          // Expanded(
                          //   child: TextFormField(
                          //     autovalidateMode:
                          //         AutovalidateMode.onUserInteraction,
                          //     controller: mobileNo,
                          //     validator: (value) {
                          //       if (value == null || value.trim().isEmpty) {
                          //         return 'This field is required.';
                          //       }
                          //       if (value.length < 10) {
                          //         return 'Mobile number is less than 11 digits';
                          //       }
                          //       if (value.length > 10) {
                          //         return 'Mobile number is more than 11 digits';
                          //       }
                          //       return null;
                          //     },
                          //     inputFormatters: [
                          //       FilteringTextInputFormatter.digitsOnly
                          //     ],
                          //     decoration: InputDecoration(
                          //         label: Text('Mobile Number'),
                          //         prefix: Text('+234'),
                          //         hintText: '8012345678',
                          //         border: OutlineInputBorder(),
                          //         focusedBorder: OutlineInputBorder(
                          //             borderSide: BorderSide(
                          //                 color: Color(
                          //                     colorTheme.appColor.hashCode)))),
                          //     keyboardType: TextInputType.phone,
                          //   ),
                          // ),
                          // const SizedBox(height: 16.0),
                          // Expanded(
                          //   child: TextFormField(
                          //     autovalidateMode:
                          //         AutovalidateMode.onUserInteraction,
                          //     controller: password,
                          //     validator: (value) {
                          //       if (value == null || value.trim().isEmpty) {
                          //         return 'This field is required';
                          //       }
                          //       String pattern =
                          //           r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                          //       if (!RegExp(pattern).hasMatch(value)) {
                          //         return 'Password should contain an uppercase letter, lowercase letter, number, symbol and should be more than 8 digits';
                          //       }
                          //       return null;
                          //     },
                          //     decoration: InputDecoration(
                          //         label: Text('Password'),
                          //         // hintText: 'johndoe@gmail.com',
                          //         border: OutlineInputBorder(),
                          //         focusedBorder: OutlineInputBorder(
                          //             borderSide: BorderSide(
                          //           color: Color(colorTheme.appColor.hashCode),
                          //         ))),
                          //     obscureText: true,
                          //   ),
                          // ),
                          // const SizedBox(height: 16.0),
                          // Expanded(
                          //   child: TextFormField(
                          //     autovalidateMode:
                          //         AutovalidateMode.onUserInteraction,
                          //     controller: confirmPassword,
                          //     validator: (value) {
                          //       if (value == null || value.trim().isEmpty) {
                          //         return 'This field is required';
                          //       }
                          //       if (password.text.trim() != value) {
                          //         return 'Password does not match';
                          //       }
                          //       return null;
                          //     },
                          //     decoration: InputDecoration(
                          //         label: Text('Confirm Password'),
                          //         // hintText: 'johndoe@gmail.com',
                          //         border: OutlineInputBorder(),
                          //         focusedBorder: OutlineInputBorder(
                          //             borderSide: BorderSide(
                          //           color: Color(colorTheme.appColor.hashCode),
                          //         ))),
                          //     obscureText: true,
                          //   ),
                          // ),
                          // const SizedBox(height: 16.0),
                          const Expanded(child: SizedBox(height: 160.0)),
                          Container(
                            padding: const EdgeInsets.all(24.0),
                            // color: Colors.green,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          const StadiumBorder()),
                                      minimumSize: MaterialStateProperty.all(
                                          const Size(328, 48.0)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.blue)),
                                  onPressed: () async{
                                      if (formKey.currentState!.validate()) {

                                        authService.createUser();
                                        setState((){
                                            error = authService.error;
                                        });
                                        if(error == 1){
                                          authService.callShowDialog(context);
                                        }
                                      }

                                  },
                                  child: Text('Sign up',
                                      style: textTheme.btnLight),
                                ),
                                const SizedBox(height: 16.0),
                                OutlinedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          const StadiumBorder()),
                                      minimumSize: MaterialStateProperty.all(
                                          const Size(328, 48.0))),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/otpVerificationScreen');
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 24.0,
                                        width: 24.0,
                                        child: Image.asset(
                                            'lib/assets/icons/google.png'),
                                      ),
                                      const SizedBox(width: 16.0),
                                      Text(
                                        'Sign up with Google',
                                        style: textTheme.actionBtnLight,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Expanded(child: SizedBox(height: 32.0,)),
                        ],
                      ),
                    ),
                  ),
                ),
                // const Expanded(child: SizedBox(height: 48.0)),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 32.0),
                  // color: Colors.red,
                  // margin: EdgeInsets.fromLTRB(0, 0, 0, 16.0),
                  // padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'By creating an account, you agree to the',
                            style: textTheme.textDark),
                        TextSpan(
                            text: ' Terms & Conditions ',
                            style: textTheme.hyperlinkDark,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return tandc;
                                  },
                                );
                              }),
                        TextSpan(text: 'and ', style: textTheme.textDark),
                        TextSpan(
                            text: 'Privacy Policy',
                            style: textTheme.hyperlinkDark,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return privacyUse;
                                  },
                                );
                              })
                      ]),
                    ),
                  ),
                ),
                // const SizedBox(height: 8.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
