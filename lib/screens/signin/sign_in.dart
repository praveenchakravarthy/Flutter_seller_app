import 'package:flutter/material.dart';
import 'package:flutter_app/values/dimens/dimensions.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  bool _otpEnable = false;
  var otpFocusNode = FocusNode();

  /*Send Otp*/
  _sendOtp() async {
    if (_formKey.currentState!.validate()) {
     setState(() {
       _otpEnable = true;
     });
      FocusScope.of(context).requestFocus(otpFocusNode);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            // Container(
            //   child: SingleChildScrollView(
            //     child: SizedBox(
            //         height: MediaQuery.of(context).size.height,
            //       child:
            //     ),
            //   ),
            // ),
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                      color: Colors.blueGrey,
                      child: const Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                            child:  Image(
                              height: 150,
                              image: NetworkImage(
                                  'https://www.readyassist.in/assets/images/logo/new_ra_logo.png'),
                            ),
                          )
                      )
                  ),
                ),
                Expanded(child: Container(color: Colors.white)),
              ],
            ),
            Align(
              alignment: Alignment(0, 0),
              child: Wrap(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      elevation: 2,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: size.height * 0.03,
                            top: size.height * 0.03),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Subscription Sales",
                                  style: subHeaderStyle),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    border: OutlineInputBorder(),
                                    labelText: 'Mobile No',
                                    hintText: 'Enter Your Mobile',
                                    counterText: '',
                                  ),
                                  textInputAction: TextInputAction.go,
                                  maxLength: 10,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 1) {
                                      return 'Please enter valid Mobile Number';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Visibility(
                                visible: _otpEnable,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: TextFormField(
                                    obscureText: true,
                                    keyboardType: TextInputType.number,
                                    focusNode: otpFocusNode,
                                    decoration: const InputDecoration(
                                      isDense: true,
                                      border: OutlineInputBorder(),
                                      labelText: 'Otp',
                                      hintText: 'Enter Otp',
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              _otpEnable
                                  ? Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  child: ElevatedButton(
                                    onPressed: () => {
                                      Navigator.popAndPushNamed(
                                          context, '/home')
                                    },
                                    child: const Text('SignIn'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueGrey,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 10),
                                      textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                              )
                                  : Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  child: ElevatedButton(
                                    onPressed: () => {
                                      // _sendOtp()
                                      Navigator.popAndPushNamed(
                                          context, '/home')
                                    },
                                    child: const Text('Send Otp'),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.blueGrey,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 10),
                                        textStyle: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}







