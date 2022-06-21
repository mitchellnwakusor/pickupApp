import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pickup/assets/customthemes/custom_color_theme.dart';
import 'package:pickup/assets/customthemes/custom_text_theme.dart';
import 'package:pickup/services/firestore_authentication.dart';
import 'package:pickup/services/firestore_db.dart';
import 'package:pickup/utility/dialogs_and_snackbars.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Authentication authentication = Authentication();
  Database database = Database();
  CustomDialog customDialog = CustomDialog();
  CustomSnackBar customSnackBar = CustomSnackBar();
  CustomColorTheme colorTheme = CustomColorTheme();
  CustomTextTheme textTheme = CustomTextTheme();
  CustomLoadingWidget loadingWidget = CustomLoadingWidget();

  //form key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //formField controllers
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

  String errorMessage = 'no error';

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
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Container(
              // color: Colors.grey,
              height: MediaQuery.of(context).size.height,
              // padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32.0),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
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
                  const SizedBox(height: 16.0),
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
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: 380,
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(8.0),
                                // color: Colors.blue,
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: firstName,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(
                                                            RegExp('[A-Za-z]'))
                                                  ],
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.trim().isEmpty) {
                                                      return 'This field is required';
                                                    }
                                                    return null;
                                                  },
                                                  decoration: InputDecoration(
                                                      label: const Text(
                                                          'First Name'),
                                                      hintText: 'John',
                                                      border:
                                                          const OutlineInputBorder(),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                        color: Color(colorTheme
                                                            .backgroundColor
                                                            .hashCode),
                                                      ))),
                                                ),
                                              ),
                                              const SizedBox(width: 16.0),
                                              Expanded(
                                                child: TextFormField(
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  controller: lastName,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(
                                                            RegExp('[A-Za-z]'))
                                                  ],
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.trim().isEmpty) {
                                                      return 'This field is required.';
                                                    }
                                                    return null;
                                                  },
                                                  decoration: InputDecoration(
                                                      label: const Text(
                                                          'Last Name'),
                                                      hintText: 'Doe',
                                                      border:
                                                          const OutlineInputBorder(),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                        color: Color(colorTheme
                                                            .backgroundColor
                                                            .hashCode),
                                                      ))),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // TextFormField(
                                        //   controller: firstName,
                                        //   autovalidateMode:
                                        //       AutovalidateMode.onUserInteraction,
                                        //   inputFormatters: [
                                        //     FilteringTextInputFormatter.allow(
                                        //         RegExp('[A-Za-z]'))
                                        //   ],
                                        //   validator: (value) {
                                        //     if (value == null ||
                                        //         value.trim().isEmpty) {
                                        //       return 'This field is required';
                                        //     }
                                        //     return null;
                                        //   },
                                        //   decoration: InputDecoration(
                                        //       label: const Text('First Name'),
                                        //       hintText: 'John',
                                        //       border: const OutlineInputBorder(),
                                        //       focusedBorder: OutlineInputBorder(
                                        //           borderSide: BorderSide(
                                        //         color: Color(colorTheme
                                        //             .backgroundColor.hashCode),
                                        //       ))),
                                        // ),
                                        // const SizedBox(width: 16.0),
                                        // TextFormField(
                                        //   autovalidateMode:
                                        //       AutovalidateMode.onUserInteraction,
                                        //   controller: lastName,
                                        //   inputFormatters: [
                                        //     FilteringTextInputFormatter.allow(
                                        //         RegExp('[A-Za-z]'))
                                        //   ],
                                        //   validator: (value) {
                                        //     if (value == null ||
                                        //         value.trim().isEmpty) {
                                        //       return 'This field is required.';
                                        //     }
                                        //     return null;
                                        //   },
                                        //   decoration: InputDecoration(
                                        //       label: const Text('Last Name'),
                                        //       hintText: 'Doe',
                                        //       border: const OutlineInputBorder(),
                                        //       focusedBorder: OutlineInputBorder(
                                        //           borderSide: BorderSide(
                                        //         color: Color(colorTheme
                                        //             .backgroundColor.hashCode),
                                        //       ))),
                                        // ),
                                        const SizedBox(height: 16.0),
                                        TextFormField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          controller: emailAddress,
                                          validator: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'This field is required.';
                                            }
                                            String pattern = r'\w+@\w+\.\w+';
                                            if (!RegExp(pattern)
                                                .hasMatch(value)) {
                                              return 'Invalid E-mail address format.';
                                            }
                                            return null;
                                          },
                                          inputFormatters: [
                                            FilteringTextInputFormatter.deny(
                                                RegExp('[!#/\$~&*]')),
                                            FilteringTextInputFormatter.deny(
                                                RegExp('[A-Z]'))
                                          ],
                                          decoration: InputDecoration(
                                              label:
                                                  const Text('Email Address'),
                                              hintText: 'johndoe@gmail.com',
                                              border:
                                                  const OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(colorTheme
                                                          .appColor
                                                          .hashCode)))),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                        ),
                                        const SizedBox(height: 16.0),
                                        TextFormField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          controller: mobileNo,
                                          validator: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
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
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          decoration: InputDecoration(
                                              label:
                                                  const Text('Mobile Number'),
                                              prefix: const Text('+234'),
                                              hintText: '8012345678',
                                              border:
                                                  const OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(colorTheme
                                                          .appColor
                                                          .hashCode)))),
                                          keyboardType: TextInputType.phone,
                                        ),
                                        const SizedBox(height: 16.0),
                                        TextFormField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          controller: password,
                                          validator: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'This field is required';
                                            }
                                            String pattern =
                                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                                            if (!RegExp(pattern)
                                                .hasMatch(value)) {
                                              return 'Password should contain an uppercase letter, lowercase letter, number, symbol and should be more than 8 digits';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                              label: const Text('Password'),
                                              // hintText: 'johndoe@gmail.com',
                                              border:
                                                  const OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                color: Color(colorTheme
                                                    .appColor.hashCode),
                                              ))),
                                          obscureText: true,
                                        ),
                                        const SizedBox(height: 16.0),
                                        TextFormField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          controller: confirmPassword,
                                          validator: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'This field is required';
                                            }
                                            if (password.text.trim() != value) {
                                              return 'Password does not match';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                              label: const Text(
                                                  'Confirm Password'),
                                              // hintText: 'johndoe@gmail.com',
                                              border:
                                                  const OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                color: Color(colorTheme
                                                    .appColor.hashCode),
                                              ))),
                                          obscureText: true,
                                        ),
                                        const SizedBox(height: 16.0),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                // color: Colors.green,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    TextButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                              const StadiumBorder()),
                                          minimumSize:
                                              MaterialStateProperty.all(
                                                  const Size(328, 48.0)),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.blue)),
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                         loadingWidget
                                              .showLoadingWidget(context);
                                          bool signupSuccesful =
                                              await authentication
                                                  .signupwithEmail(
                                                      firstName.text.trim(),
                                                      emailAddress.text.trim(),
                                                      password.text.trim(),
                                                      context);
                                          // Navigator.pop(context);
                                          print('popped');
                                          if (signupSuccesful) {

                                            // loadingWidget.showLoadingWidget(context);
                                            try {
                                              await authentication
                                                  .signinwithMobileNo(
                                                  mobileNo.text.trim(),
                                                  firstName.text.trim(),
                                                  lastName.text.trim(),
                                                  emailAddress.text.trim(),
                                                  context);
                                            }
                                            on FirebaseAuthException catch(e){
                                              setState((){
                                                errorMessage = e.message!;
                                                customDialog.showCustomErrorDialog(
                                                    context, errorMessage);
                                              });
                                            }
                                            print('sign up succesful');
                                            if (authentication.completed) {
                                              Navigator.pop(context);
                                            }
                                          } else {
                                            Navigator.pop(context);
                                            setState(() {
                                              errorMessage =
                                                  authentication.errorMessage;
                                            });
                                            // customSnackBar.showErrorSnackBar(context, errorMessage);
                                            customDialog.showCustomErrorDialog(
                                                context, errorMessage);

                                          }
                                        }
                                      },
                                      child: Text('Sign up',
                                          style: textTheme.btnLight),
                                    ),
                                    // const SizedBox(height: 16.0),
                                    // OutlinedButton(
                                    //   style: ButtonStyle(
                                    //       shape: MaterialStateProperty.all(
                                    //           const StadiumBorder()),
                                    //       minimumSize: MaterialStateProperty.all(
                                    //           const Size(328, 48.0))),
                                    //   onPressed: () {
                                    //     Navigator.pushNamed(
                                    //         context, '/otpVerificationScreen');
                                    //   },
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.center,
                                    //     mainAxisSize: MainAxisSize.min,
                                    //     children: [
                                    //       SizedBox(
                                    //         height: 24.0,
                                    //         width: 24.0,
                                    //         child: Image.asset(
                                    //             'lib/assets/icons/google.png'),
                                    //       ),
                                    //       const SizedBox(width: 16.0),
                                    //       Text(
                                    //         'Sign up with Google',
                                    //         style: textTheme.actionBtnLight,
                                    //       )
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            // const Expanded(child: SizedBox(height: 32.0,)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // const Expanded(child: SizedBox(height: 48.0)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 132,
                    padding: const EdgeInsets.all(16.0),
                    // color: Colors.red,
                    child: Align(
                      alignment: Alignment.topCenter,
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
                                  customDialog.showCustomTandCDialog(context);
                                }),
                          TextSpan(text: 'and ', style: textTheme.textDark),
                          TextSpan(
                              text: 'Privacy Policy',
                              style: textTheme.hyperlinkDark,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  customDialog
                                      .showCustomPrivacyUseDialog(context);
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
      ),
    );
  }
}
