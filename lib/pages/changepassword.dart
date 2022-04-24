import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Change Password',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Old Password'),
                      labelStyle: TextStyle(
                          fontSize: 16.0,
                          letterSpacing: 1.0,
                          color: Colors.black),
                    ),
                    obscureText: true,
                    style: const TextStyle(fontSize: 24.0, letterSpacing: 4.0),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('New Password'),
                      labelStyle: TextStyle(
                          fontSize: 16.0,
                          letterSpacing: 1.0,
                          color: Colors.black),
                    ),
                    obscureText: true,
                    style: const TextStyle(fontSize: 24.0, letterSpacing: 4.0),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Confirm Password'),
                      labelStyle: TextStyle(
                          fontSize: 16.0,
                          letterSpacing: 1.0,
                          color: Colors.black),
                    ),
                    obscureText: true,
                    style: const TextStyle(fontSize: 24.0, letterSpacing: 4.0),
                  ),
                  const SizedBox(height: 72.0),
                  Center(
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.teal),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                const StadiumBorder(side: BorderSide.none)),
                            minimumSize: MaterialStateProperty.all(
                                const Size(128.0, 0))),
                        onPressed: () {},
                        child: const Text('Save',
                            style: TextStyle(fontSize: 16.0))),
                  ),
                  const SizedBox(height: 160.0),
                ],
              ),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child:
                  Text('Terms & Conditions and privacy policy will be applied'),
            ),
          )
        ],
      ),
    );
  }
}
