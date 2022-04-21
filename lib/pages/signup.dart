import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //initial date should be async
  final DateTime _initialDate = DateTime(2004);
  final DateTime _firstDate = DateTime(1940, 1);
  final DateTime _lastDate = DateTime(2004);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.blue[800],
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create an Account',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 48.0),
                Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('Full Name'),
                          hintText: 'John Doe',
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('Email Address'),
                          hintText: 'johndoe@gmail.com',
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16.0),
                    InputDatePickerFormField(
                      fieldLabelText: 'Date of Birth',
                      firstDate: _firstDate,
                      lastDate: _lastDate,
                      initialDate: _initialDate,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('Mobile Number'),
                          prefix: Text('+234'),
                          hintText: '8012345678',
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('Password'),
                          // hintText: 'johndoe@gmail.com',
                          border: OutlineInputBorder()),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16.0),
                    OutlinedButton.icon(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                const StadiumBorder()),
                            minimumSize:
                                MaterialStateProperty.all(const Size(0, 48.0))),
                        onPressed: () {},
                        icon: const Icon(Icons.g_translate),
                        label: const Text(
                          'Sign up with Google',
                          style: TextStyle(fontSize: 16.0),
                        )),
                    const SizedBox(height: 16.0),
                    TextButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(const StadiumBorder()),
                          minimumSize:
                              MaterialStateProperty.all(const Size(0, 48.0)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                      onPressed: () {},
                      child: const Text('Sign up with Google',
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.0)),
                    ),
                    const SizedBox(height: 48.0),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(24.0,0,24.0,0),
                      child: Text('By creating an account, you agree to the Terms & Conditions and Privacy Policy '),
                    )
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
