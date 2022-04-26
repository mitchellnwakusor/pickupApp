import 'package:flutter/material.dart';

class LogisticsSummary extends StatefulWidget {
  const LogisticsSummary({Key? key}) : super(key: key);

  @override
  State<LogisticsSummary> createState() => _LogisticsSummaryState();
}

class _LogisticsSummaryState extends State<LogisticsSummary> {
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
              Image.asset('assets/images/taxi_icon.png',scale: 0.8,),
              const SizedBox(height: 8.0,),
              const Text(
                'Taxi',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              // const SizedBox(height: 8.0,),
              Text(
                '4 seats',
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
