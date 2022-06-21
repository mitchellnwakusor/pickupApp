import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pickup/assets/customthemes/custom_color_theme.dart';
import 'package:pickup/assets/customthemes/custom_text_theme.dart';
import 'package:pickup/services/firestore_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pickup/services/firestore_db.dart';
import 'package:pickup/utility/dialogs_and_snackbars.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final Authentication auth = Authentication();
  final Database database = Database();
  final CustomTextTheme customTextTheme = CustomTextTheme();
  final CustomColorTheme customColorTheme = CustomColorTheme();
  final CustomDialog customDialog = CustomDialog();

  // final String userNumber = '+234 10 999 00 00';
  // final String resendTimer = '30';

  final TextEditingController firstCode = TextEditingController();
  final TextEditingController secondCode = TextEditingController();
  final TextEditingController thirdCode = TextEditingController();
  final TextEditingController fourthCode = TextEditingController();
  final TextEditingController fifthCode = TextEditingController();
  final TextEditingController sixthCode = TextEditingController();

  final FocusNode firstCodeFocus = FocusNode();
  final FocusNode secondCodeFocus = FocusNode();
  final FocusNode thirdCodeFocus = FocusNode();
  final FocusNode fourthCodeFocus = FocusNode();
  final FocusNode fifthCodeFocus = FocusNode();
  final FocusNode sixthCodeFocus = FocusNode();

  late String otpCode;
  late String verificationId;

  late String firstName;
  late String lastName;
  late String email;
  late String mobileNo;

  late TextStyle timerStyle;
  bool enabled = false;
  void setTimeout(){
    Future.delayed(Duration(seconds: 10),(){
      timerStyle = customTextTheme.hyperlinkDark;
      setState((){
        enabled = true;
      });

    });
  }

  void clearOTP(){
    firstCode.clear();
    secondCode.clear();
    thirdCode.clear();
    fourthCode.clear();
    fifthCode.clear();
    sixthCode.clear();
  }

  @override
  void dispose() {
    firstCode.dispose();
    secondCode.dispose();
    thirdCode.dispose();
    fourthCode.dispose();
    fifthCode.dispose();
    sixthCode.dispose();

    firstCodeFocus.dispose();
    secondCodeFocus.dispose();
    thirdCodeFocus.dispose();
    fourthCodeFocus.dispose();
    fifthCodeFocus.dispose();
    sixthCodeFocus.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    otpCode = auth.smsCode! /*'${dataFromSignup['smsCode']}'*/;
    print(otpCode);
    firstCode.text = otpCode[0];
    secondCode.text = otpCode[1];
    thirdCode.text = otpCode[2];
    fourthCode.text = otpCode[3];
    fifthCode.text = otpCode[4];
    sixthCode.text = otpCode[5];
    timerStyle = customTextTheme.textDark;
    setState((){
      setTimeout();
    });


  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String?> dataFromSignup =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    print(dataFromSignup);
    setState(() {
      firstName = '${dataFromSignup['first name']}';
      lastName = '${dataFromSignup['last name']}';
      email = '${dataFromSignup['email']}';
      mobileNo = '${dataFromSignup['mobile no']}';
    });
    return WillPopScope(
      onWillPop: ()async{
        print('Back button pressed');
        try {
          await auth.auth.currentUser?.delete();
          print('user deleted');
        }
        on FirebaseAuthException catch(e){
          print(e.message);
        }
        Navigator.pop(context,false);
        return Future.value(false);

      },
      child: Scaffold(
        appBar: AppBar(
          // leadingWidth: 24.0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.blue,
          elevation: 0,
          // toolbarHeight: 80,
          // title: const Text(
          //   'BACK',
          //   style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
          // ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // const Text('Phone Verification'),
              const SizedBox(height: 8.0),
              Container(
                // color: Colors.pink,
                child: Text('Enter your OTP code',
                    style: customTextTheme.pageHeader),
              ),
              const SizedBox(height: 32.0),
              Container(
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Enter the 6-digit code sent to ',
                          style: customTextTheme.bodyText),
                      TextSpan(
                          text: '+234 $mobileNo.',
                          style: customTextTheme.bodyTextEmp),
                    ])),
                    // const SizedBox(height: 16.0),
                    // RichText(
                    //     text: TextSpan(
                    //       children: [
                    //         TextSpan(
                    //             text: 'Not your mobile number? ',
                    //             style: customTextTheme.textDark,
                    //            ),
                    //         TextSpan(
                    //             text: 'update number',
                    //             style: customTextTheme.hyperlinkDark,
                    //             recognizer: TapGestureRecognizer()
                    //               ..onTap = () {
                    //                 print('tapped change phone number');
                    //                 //Navigate to change phone number screen
                    //               }),
                    //       ]
                    //     ),
                    //     ),
                  ],
                ),
              ),
              const SizedBox(height: 32.0),
              Container(
                width: MediaQuery.of(context).size.width,
                // color: Colors.grey,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200.withOpacity(0.4),
                    // color: Colors.purple,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(1, 2),
                  )
                ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // const SizedBox(width: 16.0),
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  color: Colors.white),
                              width: 64.0,
                              height: 64.0,
                              child: Center(
                                child: TextField(
                                  controller: firstCode,
                                  focusNode: firstCodeFocus,
                                  onTap: () {
                                    firstCode.clear();
                                  },
                                  onChanged: (String value) {
                                    setState(() {
                                      firstCode.text = value;
                                    });
                                    if (value.isNotEmpty) {
                                      secondCodeFocus.requestFocus();
                                      secondCode.clear();
                                    }
                                  },
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24.0,
                                  ),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              ),
                              // color: Colors.white,
                            ),
                          ),
                          // const SizedBox(width: 16.0),
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  color: Colors.white),
                              width: 64.0,
                              height: 64.0,
                              child: Center(
                                child: TextField(
                                  controller: secondCode,
                                  focusNode: secondCodeFocus,
                                  onTap: () {
                                    secondCode.clear();
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      secondCode.text = value;
                                    });
                                    if (value.isNotEmpty) {
                                      thirdCodeFocus.requestFocus();
                                      thirdCode.clear();
                                    }
                                  },
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24.0,
                                  ),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              ),
                              // color: Colors.white,
                            ),
                          ),
                          // const SizedBox(width: 16.0),
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  color: Colors.white),
                              width: 64.0,
                              height: 64.0,
                              child: Center(
                                child: TextField(
                                  controller: thirdCode,
                                  focusNode: thirdCodeFocus,
                                  onTap: () {
                                    thirdCode.clear();
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      thirdCode.text = value;
                                    });
                                    if (value.isNotEmpty) {
                                      fourthCodeFocus.requestFocus();
                                      fourthCode.clear();
                                    }
                                  },
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24.0,
                                  ),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              ),
                              // color: Colors.white,
                            ),
                          ),
                          // const SizedBox(width: 16.0),
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  color: Colors.white),
                              width: 64.0,
                              height: 64.0,
                              child: Center(
                                child: TextField(
                                  controller: fourthCode,
                                  focusNode: fourthCodeFocus,
                                  onTap: () {
                                    fourthCode.clear();
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      fourthCode.text = value;
                                    });
                                    if (value.isNotEmpty) {
                                      fifthCodeFocus.requestFocus();
                                      fifthCode.clear();
                                    }
                                  },
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24.0,
                                  ),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              ),
                              // color: Colors.white,
                            ),
                          ),
                          // const SizedBox(width: 16.0),
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  color: Colors.white),
                              width: 64.0,
                              height: 64.0,
                              child: Center(
                                child: TextField(
                                  controller: fifthCode,
                                  focusNode: fifthCodeFocus,
                                  onTap: () {
                                    fifthCode.clear();
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      fifthCode.text = value;
                                    });
                                    if (value.isNotEmpty) {
                                      sixthCodeFocus.requestFocus();
                                      sixthCode.clear();
                                    }
                                  },
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24.0,
                                  ),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              ),
                              // color: Colors.white,
                            ),
                          ),
                          // const SizedBox(width: 16.0),
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  color: Colors.white),
                              width: 64.0,
                              height: 64.0,
                              child: Center(
                                child: TextField(
                                  controller: sixthCode,
                                  focusNode: sixthCodeFocus,
                                  onTap: () {
                                    sixthCode.clear();
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      sixthCode.text = value;
                                    });
                                    if (value.isNotEmpty) {
                                      sixthCodeFocus.nextFocus();
                                    }
                                  },
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24.0,
                                  ),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              ),
                              // color: Colors.white,
                            ),
                          ),
                          // const SizedBox(width: 16.0),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Did not receive a code? ',
                          style: customTextTheme.textDark),
                      TextSpan(
                          text: ' resend code',
                          style: timerStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = enabled ? () {
                              //verify phone number again
                              print('resend code');
                            } : null),
                    ]))
                  ],
                ),
              ),
              const SizedBox(height: 32.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: FloatingActionButton(
                      onPressed: () async {
                        setState(() {
                          otpCode = firstCode.text.trim() +
                              secondCode.text.trim() +
                              thirdCode.text.trim() +
                              fourthCode.text.trim() +
                              fifthCode.text.trim() +
                              sixthCode.text.trim();
                          verificationId = '${dataFromSignup['verification id']}';
                        });
                        print(otpCode);
                        PhoneAuthCredential userCred =
                            PhoneAuthProvider.credential(
                                verificationId: verificationId, smsCode: otpCode);

                        try {
                          // await auth.auth.currentUser?.updatePhoneNumber(userCred);
                          await auth.auth.currentUser
                              ?.linkWithCredential(userCred);
                          if (auth.auth.currentUser?.phoneNumber != null) {
                            await database.storeUserData(
                                firstName, lastName, email, mobileNo);
                            Navigator.pushReplacementNamed(
                                context, '/addPaymentCardScreen');
                            print(auth.auth.currentUser);
                          }
                        } on FirebaseAuthException catch (e) {
                          customDialog.showCustomErrorDialog(context, e.message);
                          clearOTP();
                        }

                        // Navigator.pushReplacementNamed(context, '/addPaymentCardScreen');
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 32.0,
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.grey,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
