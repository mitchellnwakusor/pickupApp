import 'package:flutter/material.dart';

class CancelTrip extends StatefulWidget {
  const CancelTrip({Key? key}) : super(key: key);

  @override
  State<CancelTrip> createState() => _CancelTripState();
}

class _CancelTripState extends State<CancelTrip> {
  List radioList = [
    "Rider isn't here",
    "Rider isn't here",
    "Rider isn't here",
    "Rider isn't here",
    "Rider isn't here",
    "Rider isn't here"
  ];
  late int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: const Icon(Icons.close),
        title: const Text('Cancel Trip',
            style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: 1)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(children: [
                RadioListTile(
                  value: 1,
                  groupValue: _value,
                  onChanged: (val) {
                    setState(() {
                      _value = int.parse(val.toString());
                    });
                  },
                  title: Text(radioList[0]),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                RadioListTile(
                  value: 2,
                  groupValue: _value,
                  onChanged: (val) {
                    setState(() {
                      _value = int.parse(val.toString());
                    });
                  },
                  title: Text(radioList[1]),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                RadioListTile(
                  value: 3,
                  groupValue: _value,
                  onChanged: (val) {
                    setState(() {
                      _value = int.parse(val.toString());
                    });
                  },
                  title: Text(radioList[2]),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                RadioListTile(
                  value: 4,
                  groupValue: _value,
                  onChanged: (val) {
                    setState(() {
                      _value = int.parse(val.toString());
                    });
                  },
                  title: Text(radioList[3]),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                RadioListTile(
                  value: 5,
                  groupValue: _value,
                  onChanged: (val) {
                    setState(() {
                      _value = int.parse(val.toString());
                    });
                  },
                  title: Text(radioList[4]),
                ),
                const Divider(
                  color: Colors.grey,
                ),
              ]),
            ),
          ),
          Container(
            height: 300,
            alignment: Alignment.topCenter,
            child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.teal),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                            const StadiumBorder(side: BorderSide.none)),
                        minimumSize: MaterialStateProperty.all(const Size(128.0, 0))),
                    onPressed: () {},
                    child: const Text('Done', style: TextStyle(fontSize: 16.0))),
          ),
        ],
      ),
    );
  }
}
