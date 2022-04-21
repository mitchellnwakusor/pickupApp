// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool switchValue = false;
  bool switchFunction(switchValue) {
    print('Switch was toggled');
    return !switchValue;
  }

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
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // const CircleAvatar(
                    //   backgroundImage: AssetImage('assets/images/man.png'),
                    //   backgroundColor: Colors.grey,
                    //   radius: 58,
                    // ),
                    const Align(
                      //alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/man.png'),
                        backgroundColor: Colors.grey,
                        radius: 58,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Center(
                        child: Text('Martian Sam',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0))),
                    // const SizedBox(height: 8.0),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/editProfileScreen');
                        },
                        child: const Text('Edit profile')),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: const [
                                Expanded(
                                  flex: 1,
                                  child: Icon(
                                    Icons.credit_card,
                                    size: 24.0,
                                  ),
                                ),
                                // SizedBox(
                                //   width: 16.0,
                                // ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    'Payment Method',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                )
                              ],
                            ),
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    const Size(0, 64)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black)),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                const Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.notifications_none_outlined,
                                      size: 24.0,
                                    )),
                                // SizedBox(width: 16.0,),
                                const Expanded(
                                    flex: 4,
                                    child: Text(
                                      'Notification',
                                      style: TextStyle(fontSize: 16.0),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Switch(
                                        value: switchValue,
                                        onChanged: switchFunction)),
                              ],
                            ),
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    const Size(0, 64)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black)),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: const [
                                Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.lock_outline,
                                      size: 24.0,
                                    )),
                                Expanded(
                                    flex: 5,
                                    child: Text(
                                      'Change password',
                                      style: TextStyle(fontSize: 16.0),
                                    )),
                              ],
                            ),
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    const Size(0, 64)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black)),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: const [
                                Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.exit_to_app_outlined,
                                      size: 24.0,
                                    )),
                                // SizedBox(width: 16.0,),
                                Expanded(
                                    flex: 4,
                                    child: Text(
                                      'Logout',
                                      style: TextStyle(fontSize: 16.0),
                                    )),
                              ],
                            ),
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    const Size(0, 64)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black)),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
