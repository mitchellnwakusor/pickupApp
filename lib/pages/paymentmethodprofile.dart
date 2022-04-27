import 'package:flutter/material.dart';

class PaymentMethodProfile extends StatefulWidget {
  const PaymentMethodProfile({Key? key}) : super(key: key);

  @override
  State<PaymentMethodProfile> createState() => _PaymentMethodProfileState();
}

class _PaymentMethodProfileState extends State<PaymentMethodProfile> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 16.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView(
                children: [
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Payment methods',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                letterSpacing: 1),
                          ),
                          const SizedBox(
                            height: 32.0,
                          ),
                          ListTile(
                            leading: Image.asset(
                              'assets/images/naira_icon.png',
                              scale: 0.8,
                            ),
                            title: const Text('Cash'),
                            trailing: Radio(
                                value: 1,
                                groupValue: _value,
                                onChanged: (_val) {
                                  setState(() {
                                    _value = int.parse(_val.toString());
                                  });
                                }),
                          ),
                          // const SizedBox(height: 16.0,),
                          ListTile(
                            leading: Image.asset(
                              'assets/images/card_icon.png',
                              scale: 0.8,
                            ),
                            title: const Text('Add debit/credit car'),
                            trailing: Radio(
                                value: 2,
                                groupValue: _value,
                                onChanged: (_val) {
                                  setState(() {
                                    _value = int.parse(_val.toString());
                                  });
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const SizedBox(height: 24.0,),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView(
                children: [
                  Container(
                    color: Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                      child: ListTile(
                        leading: Icon(Icons.history,size: 32.0,),
                        title: Text('See transaction history'),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_arrow_down))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
