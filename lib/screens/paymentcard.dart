import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pickup/utility/validators.dart';

class PaymentCard extends StatefulWidget {
  const PaymentCard({Key? key}) : super(key: key);

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Validator validator = Validator();
  
  TextEditingController cardNumber = TextEditingController();
  TextEditingController cardName = TextEditingController();
  TextEditingController expDate = TextEditingController();
  TextEditingController cvv = TextEditingController();

  //01/02
  late String cardDate;

  @override
  void dispose(){

    super.dispose();

    cardNumber.dispose();
    cardName.dispose();
    expDate.dispose();
    cvv.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leadingWidth: 24.0,
      //   backgroundColor: Colors.transparent,
      //   foregroundColor: Colors.black,
      //   elevation: 0,
      //   // toolbarHeight: 80,
      //   title: const Text(
      //     'BACK',
      //     style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
      //   ),
      // ),
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height
        ),
        child: ListView(
          children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32.0),
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
              Card(
                margin: EdgeInsets.all(16.0),
                elevation: 3,
                shadowColor: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        const SizedBox(height: 16.0,),
                        TextFormField(
                          controller: cardNumber,
                          validator: (value){
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required.';
                            }
                            if (value.length < 16) {
                              return 'Card number is less than 16 digits';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontSize: 24.0,
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(8.0),
                            label: Text('Card number'),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'XXXX XXXX XXXX XXXX',
                             border: InputBorder.none,
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(19),
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                        ),
                       const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: 120.0,
                                child: TextFormField(
                                  controller: expDate,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (value){
                                    if (value == null ||
                                        value.trim().isEmpty) {
                                      return 'This field is required.';
                                    }
                                    return null;
                                  },
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
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 60.0,
                                child: TextFormField(
                                  controller: cvv,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (value){
                                    if (value == null ||
                                        value.trim().isEmpty) {
                                      return 'This field is required.';
                                    }
                                    return null;
                                  },
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
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0,),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: cardName,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value){
                            if (value == null ||
                                value.trim().isEmpty) {
                              return 'This field is required.';
                            }
                            return null;
                          },
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
                      ],
                    ),
                  ),
                ),
              ),
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
        // const SizedBox(height: 72.0),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.bottomRight,
              child: FloatingActionButton(backgroundColor: Colors.blueGrey,onPressed: (){
                if(formKey.currentState!.validate()){
                  setState((){
                    cardDate = expDate.text.replaceAll('/', '');
                  });
                  print('${cardNumber.text} ${cardName.text} $cardDate ${cvv.text}');
                }
                // Navigator.pushNamed(context, '/profileScreen');
              }, child: const Icon(Icons.arrow_forward,color: Colors.white,size: 32.0,))),
        )
          ],

        ),
      ),
    );
  }
}
