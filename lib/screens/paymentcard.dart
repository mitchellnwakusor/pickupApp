import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentCard extends StatefulWidget {
  const PaymentCard({Key? key}) : super(key: key);

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
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
          Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
              child: Text(
                'Add a Payment Card',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 16.0,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 3,
                shadowColor: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: Column(
                      children: [
                        const SizedBox(height: 16.0,),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontSize: 24.0,
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(8.0),
                            hintText: 'XXXX XXXX XXXX XXXX',
                             border: InputBorder.none,
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(16),
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                        ),
                       const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120.0,
                              child: TextFormField(
                                keyboardType: TextInputType.datetime,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                                decoration: const InputDecoration(
                                  label: Text('MONTH/YEAR'),
                                  contentPadding: EdgeInsets.all(8.0),
                                  hintText: 'XX/XX',
                                  border: InputBorder.none,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(5),
                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9 /]')),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 60.0,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                                decoration:
                                const InputDecoration(
                                  label: Text('CVV'),
                                  contentPadding: EdgeInsets.all(8.0),
                                  hintText: 'XXX',
                                  border: InputBorder.none,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(3),
                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0,),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                          decoration: const InputDecoration(
                            label: Text('NAME ON CARD'),
                            contentPadding: EdgeInsets.all(8.0),
                            hintText: 'CARD OWNER',
                            border: InputBorder.none,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z]')),
                            // FilteringTextInputFormatter.allow(RegExp(r'[ ]'))
                          ],
                        ),
                        const SizedBox(height: 16.0,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:  const EdgeInsets.fromLTRB(8.0,0,8.0,0),
              child: TextButton.icon(style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.grey[600]),
              ),
                  onPressed: (){},
                  icon: const Icon(Icons.camera_alt_outlined,size: 32.0,),
                  label: const Text('Scan Credit Card',style: TextStyle(fontSize: 16.0),)),
            ),
            const SizedBox(height: 8.0),
            const Padding(
              padding: EdgeInsets.fromLTRB(24.0,0,24.0,0),
              child: Text('By continuing, I confirm that i have read and agree to the Terms & Conditions and Privacy Policy',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                    // fontSize: 16.0
                )
              ),
            ),
            const SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: (){Navigator.pushNamed(context, '/profileScreen');}, child: const Text('SKIP',style: TextStyle(letterSpacing: 1),),style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.grey),
                ),),
              ),
            ),

          ],

        ),
      const SizedBox(height: 72.0),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.bottomRight,
            child: FloatingActionButton(backgroundColor: Colors.blueGrey,onPressed: (){
              Navigator.pushNamed(context, '/profileScreen');
            }, child: const Icon(Icons.arrow_forward,color: Colors.white,size: 32.0,))),
      )

        ],

      ),
    );
  }
}
