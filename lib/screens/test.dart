// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool switchValue = false;
  bool switchFunction(switchValue) {
    print('Switch was toggled');
    return !switchValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.grey[200],
            borderRadius:
            const BorderRadius.vertical(top: Radius.circular(56))),
        child:
          Stack(
            children: [
              ListView(
              children: [
                const SizedBox(height: 16.0),
                const Align(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/man.png'),
                    backgroundColor: Colors.grey,
                    radius: 58,
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 72.0),
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
              ],
            ),
          ]),
      )
    );
  }
}
