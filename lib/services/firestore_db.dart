import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Database{

final FirebaseFirestore firestore = FirebaseFirestore.instance;
String errorMessage = 'no error';

// TextEditingController firstName;
// TextEditingController lastName;
// TextEditingController email;
// TextEditingController mobileNumber;

// Database(this.firstName,this.lastName,this.email,this.mobileNumber);

//store user data
Future<bool> storeUserData(String firstName, String lastName, String email, String mobileNumber) async{
  try{
    await firestore.collection('users').add({
      'first name': firstName.trim(),
      'last name': lastName.trim(),
      'email address': email.trim(),
      'mobile number': mobileNumber.trim(),
    });
    errorMessage = 'no error';
    return true;
  }
  on FirebaseException catch(e){
    errorMessage = e.message!;
   return false;
  }


}
}