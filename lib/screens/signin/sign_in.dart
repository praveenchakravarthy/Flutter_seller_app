import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/values/dimens/dimensions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../services/api/apis.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _mobileController = TextEditingController();
  final GetStorage box = GetStorage();
  final ApiService _apiService = ApiService.create();
  bool _otpEnable = false;
  var otpFocusNode = FocusNode();
  String _mobileNo = '';
  String _otpValue = '';

  /*Send Otp*/
  _sendOtp() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> payload = {'mobile': _mobileController.text};
      var res = await _apiService.sendLoginOtp(payload);
      setState(() {
        _otpEnable = res.body['success'];
        _mobileNo = _mobileController.text;
      });
      FocusScope.of(context).requestFocus(otpFocusNode);
    }
  }

  /*Verify Otp*/
  _signIn() async {
    if (_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      Map<String, dynamic> payload = {
        'mobile': _mobileNo,
        'otp': int.parse(_otpValue)
      };
      var res = await _apiService.verifyLoginOtp(payload);

      if(res.body['success']){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Logged-in Successfully!'),
              duration: Duration(seconds: 3)),
        );
        Map<String, dynamic> user = {
          'id': res.body['sellerData']['id'],
          'role': res.body['sellerData']['role'],
          'name': res.body['sellerData']['name'],
          'token': res.body['token'],
          'mobileNo': _mobileNo
        };
        box.write('user', json.encode(user));
        Get.offAndToNamed('/home');

      }
    }
  }

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
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
                                  controller: _mobileController,
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
                                        value.length < 10) {
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
                                    onSaved: (value) {
                                      setState(() => _otpValue = value!);
                                    },
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
                                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: ElevatedButton(
                                    onPressed: () => {
                                      _signIn()
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
                                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: ElevatedButton(
                                    onPressed: () => {
                                       _sendOtp()
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







