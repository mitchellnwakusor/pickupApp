import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pickup/services/firestore_db.dart';
import 'package:pickup/utility/dialogs_and_snackbars.dart';

class Authentication {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final Database database = Database();
  final CustomDialog dialog = CustomDialog();
  bool completed = false;
  String errorMessage = 'no error';
  String? verificationID;
  String? smsCode = '------';
  int? resendToken;
  // String userVerificationId = 'default';
  // TextEditingController email;
  // TextEditingController mobileNo;
  // TextEditingController password;

  // Authentication(this.email,this.password,this.mobileNo);

  //sign in with email & password

  //sign in with phone & password
  Future<bool> signinwithMobileNo(String mobileNo, String firstName, String lastName, String email,  BuildContext context) async{
    bool status = false;
   try{
     await auth.verifyPhoneNumber(
          phoneNumber: '+234' + mobileNo,
          forceResendingToken: resendToken,
          timeout: const Duration(milliseconds: 1000),
          verificationCompleted: (PhoneAuthCredential credential) async {
            completed = true;
            smsCode = credential.smsCode;
            // print(smsCode);
            // Navigator.pushReplacementNamed(
            //     context, '/otpVerificationScreen', arguments: {
            //   'mobile no': mobileNo,
            //   'smsCode': smsCode
            // });
            try {
              // await auth.currentUser?.updatePhoneNumber(credential);
              await auth.currentUser?.linkWithCredential(credential);
              if (auth.currentUser?.phoneNumber != null) {
               bool storeSuccess = await database.storeUserData(firstName, lastName, email, mobileNo);
               if(storeSuccess) {
                 Navigator.pushReplacementNamed(context, '/addPaymentCard');
                 status = true;
               }
               else{
                 status = false;
               }
              }
              else{
                status = false;
              }
            }
            on FirebaseAuthException catch(e){
              print(e.code);
            status = false;
            // switch(e.code){
            //   case '':
            //     errorMessage = 'This phone number is already linked to an account, try to login';
            // }
            errorMessage = e.message!;
            }
          },
          verificationFailed: (e) {
            errorMessage = e.message!;
            status = false;

          },

           codeSent: (String? verificationId, int? resendToken) async{
           // userVerificationId = verificationId;
           completed = true;
           Navigator.pushNamed(
           context, '/otpVerificationScreen', arguments: {
           'mobile no': mobileNo,
           'first name': firstName,
           'last name': lastName,
           'email': email,
           'verification id': verificationId,
           'smsCode': smsCode
           });
           this.resendToken = resendToken;
           },
          codeAutoRetrievalTimeout: (String verificationId) {
            verificationID = verificationId;
          }
          );
     print(status);
   }
   on FirebaseAuthException catch(e){
     errorMessage = e.message!;
     status = false;
     dialog.showCustomErrorDialog(context, errorMessage);
   }
    print(status);
     return status;
  }

  //**********
  // Future<void> getOTP(TextEditingController mobileNo, BuildContext context) async{
  //   await auth.verifyPhoneNumber(
  //       phoneNumber:'+234'+mobileNo.text.trim(),
  //       verificationCompleted: (PhoneAuthCredential authCredential) async{
  //         auth.currentUser?.linkWithCredential(authCredential);
  //       },
  //       verificationFailed: (e){
  //         errorMessage = e.message!;
  //         // customDialog.showCustomDialog(context, errorMessage);
  //       },
  //       codeSent: ((String verificationId, int? resendToken) async{
  //         userVerificationId = verificationId;
  //         Navigator.pushReplacementNamed(context, '/otpVerificationScreen',arguments: {
  //           'mobileNo': mobileNo
  //         });
  //
  //       }),
  //       codeAutoRetrievalTimeout:(String verificationId){
  //
  //       }
  //   );
  // }

  //sign in with google

  //sign up & in with email & password
  Future<bool> signupwithEmail(String firstName, String email,String password, BuildContext context) async {
    try {
     UserCredential userCredential =  await auth.createUserWithEmailAndPassword(email: email, password:password);

     User? user = userCredential.user;

       await user?.updateDisplayName(firstName);


     print(auth .currentUser?.displayName);
      errorMessage = 'no error';
      if(user!=null){
        return true;
      }
      else{
        return false;
      }
    }
    on FirebaseAuthException catch (e) {
      errorMessage = e.message!;
      return false;
    }
  }


  //sign up with google

}
