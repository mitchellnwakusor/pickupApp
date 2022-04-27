import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pickup/pages/test.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final String userNumber = '+234 10 999 00 00';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 24.0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        // toolbarHeight: 80,
        title: const Text(
          'BACK',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    const Text('Phone Verification'),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Enter your OTP code',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,

                      ),
                    ),
                    const SizedBox(
                      height: 42.0,
                    ),
                    Text(
                      'Enter the 4-digit code sent to you at $userNumber.',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      'did you enter the correct number?.',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue[600],
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      //color: Colors.grey,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(1, 2),
                        )
                      ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(
                              width: 16.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  color: Colors.white),
                              width: 64.0,
                              height: 64.0,
                              child: Center(

                                child: TextField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24.0,
                                  ),
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      hintText: '1', border: InputBorder.none,
                                      hintStyle: TextStyle(color: Colors.grey)
                                  ),
                                ),
                              ),
                              // color: Colors.white,
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  color: Colors.white),
                              width: 64.0,
                              height: 64.0,
                              child: Center(
                                child: TextField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24.0,
                                  ),
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      hintText: '2', border: InputBorder.none,
                                      hintStyle: TextStyle(color: Colors.grey)
                                  ),
                                ),
                              ),
                              // color: Colors.white,
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  color: Colors.white),
                              width: 64.0,
                              height: 64.0,
                              child: Center(
                                child: TextField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24.0,
                                  ),
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      hintText: '3', border: InputBorder.none,
                                      hintStyle: TextStyle(color: Colors.grey)
                                  ),
                                ),
                              ),
                              // color: Colors.white,
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  color: Colors.white),
                              width: 64.0,
                              height: 64.0,
                              child: Center(
                                child: TextField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24.0,
                                  ),
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      hintText: '4', border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.grey)
                                  ),
                                ),
                              ),
                              // color: Colors.white,
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Text('Resend Code in '),
                        Text('10 seconds',style: TextStyle(color: Colors.blue[600],fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(alignment: Alignment.centerRight,child: FloatingActionButton(onPressed: (){
                        Navigator.pushNamed(context, '/paymentCardScreen');
                      },child: Icon(Icons.arrow_forward,size: 32.0,),backgroundColor: Colors.white,foregroundColor: Colors.grey,)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
