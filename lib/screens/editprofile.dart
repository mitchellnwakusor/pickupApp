import 'dart:ui';

import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          leadingWidth: 24.0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          // toolbarHeight: 80,
          title: const Text(
            'BACK',
            style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
          ),
        ),
        body: Stack(
          children: [
            Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.grey[200],
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(56)))),
             ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // const CircleAvatar(
                      //   backgroundImage: AssetImage('assets/images/man.png'),
                      //   backgroundColor: Colors.grey,
                      //   radius: 58,
                      // ),

                      const Align(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/man.png'),
                          backgroundColor: Colors.grey,
                          radius: 58,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Center(
                          child: Text('Martian',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0))),
                      const SizedBox(height: 16.0),
                      Form(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  label: Text('Username'),
                                  hintText: 'Martian',
                                  border: UnderlineInputBorder()),
                            ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              decoration: const InputDecoration(
                                  label: Text('Email Address'),
                                  hintText: 'johndoe@gmail.com',
                                  border: UnderlineInputBorder()),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              decoration: const InputDecoration(
                                  label: Text('Default Address'),
                                  hintText: 'Es10 umar estate, Abuja',
                                  border: UnderlineInputBorder()),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              decoration: const InputDecoration(
                                  label: Text('Mobile Number'),
                                  hintText: '8054125919',
                                  border: UnderlineInputBorder()),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 48.0),
                            TextButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.teal),
                                    shape:
                                        MaterialStateProperty.all(const StadiumBorder()),
                                    minimumSize:
                                        MaterialStateProperty.all(const Size(112.0, 0))),
                                onPressed: () {},
                                child: const Text('Done',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                          ],
                      ),
                        ))
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
