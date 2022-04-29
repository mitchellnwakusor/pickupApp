import 'package:flutter/material.dart';

class LogisticsInfo extends StatefulWidget {
  const LogisticsInfo({Key? key}) : super(key: key);

  @override
  State<LogisticsInfo> createState() => _LogisticsInfoState();
}

class _LogisticsInfoState extends State<LogisticsInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 24.0,
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.black,
        elevation: 0,
        // toolbarHeight: 80,
        title: const Text(
          'BACK',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset('assets/images/bus_icon.png'),
              const SizedBox(height: 8.0,),
              const Text(
                'Class one',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              // const SizedBox(height: 8.0,),
               Text(
                  'Light duty',
              style: TextStyle(
                fontSize: 12.0,
               color: Colors.grey[600]
              ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
