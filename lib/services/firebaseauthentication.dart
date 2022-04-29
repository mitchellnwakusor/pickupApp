import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class AuthService{

  int error = 0;

  late AlertDialog errorAlert = AlertDialog(
    title: const Text('Error'),
    titlePadding: const EdgeInsets.all(24.0),
    titleTextStyle: const TextStyle(
      fontWeight: FontWeight.w800,
      color: Colors.white,
      fontSize: 24.0,
    ),
    content:  Text(errorMessage),
    contentPadding: const EdgeInsets.all(24.0),
    contentTextStyle: const TextStyle(
        color: Colors.white, fontSize: 16.0, letterSpacing: 1.0),
    backgroundColor: Colors.blue[800],
    scrollable: true,
    alignment: Alignment.topCenter,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
  );

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? user;
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phoneNo;

  late String errorMessage = '';

  AuthService(this.firstName,this.lastName,this.email, this.phoneNo, this.password);

  //Sign in Anonymously
  Future signInAnon() async{

    try{
      UserCredential userCredential =  await _auth.signInAnonymously();
      User? user = userCredential.user;
      return user;
    }
    on FirebaseAuthException catch(e){
      print(e.message);
      return null;
    }
  }
  
  //Sign in with Email and Password
  Future loginEmailPassword() async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());
      user = userCredential.user;
      return user;
    }
   on FirebaseAuthException catch(e){
      print(e.message);
      return null;
    }

  }

  //Sign in with phone number
  
  //Register with Email and Password
  Future createUser() async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());
      user = userCredential.user;
      errorMessage = 'no error';
      error = 0;
      print(user!.email);
      print('error value at success $error');
      print('error message before catch $error');
      // error = error - error;
      if(user!.email != null && error == 0){
        await storeUserData();
        print('stored data');
      }
    }
    on FirebaseAuthException catch(e){
      errorMessage = e.message!;
      error = 1;
      print(errorMessage);
      print('error value at failure $error');
    }
    }

    Future<void> callShowDialog(BuildContext context){
      return showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Unable to create account'),
          titlePadding: const EdgeInsets.all(24.0),
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 24.0,
          ),
          content:  Text(errorMessage),
          contentPadding: const EdgeInsets.all(24.0),
          contentTextStyle: const TextStyle(
              color: Colors.white, fontSize: 16.0, letterSpacing: 1.0),
          backgroundColor: Colors.blue[800],
          scrollable: true,
          alignment: Alignment.topCenter,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        );
      });
    }

  Future storeUserData() async{
    try{
      // await _firestore.collection('users').doc(email.text.trim());

     await _firestore.collection('users').add(
        {
          'first name': firstName.text.trim(),
          'last name': lastName.text.trim(),
          'email address': email.text.trim(),
          'mobile number': int.parse(phoneNo.text.trim()),
        }
      );
     error = 0;
     print(_firestore.collection('users'));
     print('error value at store data success $error');
    }
   on FirebaseException catch(e){
      errorMessage = e.message!;
      error = 1;
      print(errorMessage);
      print('error value at store data failure $error');

    }
  }


  
  //Sign out
}
