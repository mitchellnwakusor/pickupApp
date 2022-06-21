import 'package:flutter/material.dart';

class CustomDialog {

  String tandcContent = 'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ';
  String privacyContent = 'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ';


  void showCustomErrorDialog(BuildContext context, String? content) {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Unable to create user'),
        titlePadding: const EdgeInsets.all(24.0),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.white,
          fontSize: 24.0,
        ),
        content: Text(content!),
        contentPadding: const EdgeInsets.all(24.0),
        contentTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            letterSpacing: 1.0
        ),
        backgroundColor: Colors.blue[800],
        scrollable: true,
        alignment: Alignment.topCenter,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)),
      );
    });
  }

  void showCustomTandCDialog(BuildContext context) {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Terms and Conditions'),
        titlePadding: const EdgeInsets.all(24.0),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.white,
          fontSize: 24.0,
        ),
        content: Text(tandcContent),
        contentPadding: const EdgeInsets.all(24.0),
        contentTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            letterSpacing: 1.0
        ),
        backgroundColor: Colors.blue[800],
        scrollable: true,
        alignment: Alignment.topCenter,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)),
      );
    });
  }

  void showCustomPrivacyUseDialog(BuildContext context) {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Privacy Use'),
        titlePadding: const EdgeInsets.all(24.0),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.white,
          fontSize: 24.0,
        ),
        content: Text(privacyContent),
        contentPadding: const EdgeInsets.all(24.0),
        contentTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            letterSpacing: 1.0
        ),
        backgroundColor: Colors.blue[800],
        scrollable: true,
        alignment: Alignment.topCenter,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)),
      );
    });
  }
}
class CustomLoadingWidget{
  void showLoadingWidget(BuildContext loadingContext,){
    showDialog(context: loadingContext, builder: (BuildContext loadingContext){
      return const Center(
        child: CircularProgressIndicator(),
      );
    });

  }

}

class CustomSnackBar{

  void showErrorSnackBar(BuildContext context, String? content){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content!),
      elevation: 1,
      padding: const EdgeInsets.all(8.0),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 5),
    ));
  }

}