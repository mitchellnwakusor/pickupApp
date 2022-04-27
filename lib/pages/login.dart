import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login to pickup!',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 48.0),
                Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
                    Divider(
                      height: 48.0,
                      color: Colors.grey[800],
                    ),
                    //const SizedBox(height: 16.0),
                    OutlinedButton.icon(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                const StadiumBorder()),
                            minimumSize:
                                MaterialStateProperty.all(const Size(0, 48.0))),
                        onPressed: () {},
                        icon: const Icon(Icons.g_translate),
                        label: const Text(
                          'Sign in with Google',
                          style: TextStyle(fontSize: 16.0),
                        )),
                    const SizedBox(height: 16.0),
                    TextButton.icon(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(const StadiumBorder()),
                          minimumSize:
                              MaterialStateProperty.all(const Size(0, 48.0)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      icon: const Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      label: const Text(''),
                    ),
                  ],
                )),
                const SizedBox(height: 120.0),
                const Padding(
                  padding: EdgeInsets.fromLTRB(24.0,0,24.0,0),
                  child: Text('By creating an account, you agree to the Terms & Conditions and Privacy Policy '),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
