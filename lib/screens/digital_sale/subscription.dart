import 'package:flutter/material.dart';
import 'package:flutter_app/services/api/apis.dart';
import 'package:flutter_app/values/dimens/dimensions.dart';

class Subscription extends StatefulWidget {
  final int type;
  const Subscription({Key? key, required this.type}) : super(key: key);

  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  final ApiService _apiService = ApiService.create();
  final _bottomForm = GlobalKey<FormState>();
  List _subscriptionList = [];
  var otpFocusNode = FocusNode();
  String _mobileNo = '';
  String _otpValue = '';
  bool _otpEnabled = false;
  // _SubscriptionState(this.type);
  // int type;


  @override
  void initState() {
    super.initState();
    _getAllSubscriptions();
  }

  _getAllSubscriptions() async {
    Map<String, dynamic> payload = {'sellerId': 24, 'clientId': 1};
    var res = await _apiService.subscriptionPlanList(payload);
    setState(() {_subscriptionList = res.body['plans'];});
  }

  _sendOtp() async {
    if(_bottomForm.currentState!.validate()){
      setState(() {
        _otpEnabled = !_otpEnabled;
        hello(_otpEnabled);
      });
      FocusScope.of(context).requestFocus(otpFocusNode);
    }
  }

  @override
  Widget build(BuildContext context) {

        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: Colors.blueGrey[900],
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back), onPressed: () {Navigator.pop(context);},
            ),
            title: Text('Digital Sale'),
          ),

          body: subscription(),

        );
  }

  Widget subscription() {
    return ListView.builder(
      itemCount: _subscriptionList.length,
      itemBuilder: (BuildContext context, int i) {
        double c_width = MediaQuery.of(context).size.width * 0.9;

        return GestureDetector(
           onTap: () => _openCustomerSheet(context, _subscriptionList[i]),

          child: Container(
            // margin: EdgeInsets.all(12),
            // elevation: 4,
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
              child: Column(
                children: [
                  // A Row for the top
                  Row(
                    children: [
                      const CircleAvatar(backgroundColor: Colors.blueGrey),
                      const VerticalDivider(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "${_subscriptionList[i]['name']}",
                            style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'RaleWay',
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                              "Rs. ${_subscriptionList[i]['exclusiveRate'].toString()}",
                              style: const TextStyle(color: Colors.black)),
                        ],
                      ),
                      const Spacer(),
                      IconButton(onPressed: () {
                        _serviceDialog(context, _subscriptionList[i]['subscriptionServiceDetail']);
                      },
                          icon: const Icon(Icons.info), color: Colors.grey)
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(
                        width: c_width,
                        child: Column(
                          children: <Widget>[
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Available Services",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                            const SizedBox(height: 8),
                            Text(
                              "${_subscriptionList[i]['description']}",
                              style: const TextStyle(
                                  fontSize: 12,
                                  letterSpacing: 0.05,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5),
                            ),
                            const SizedBox(height: 8),
                            const Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "Validity : jun 8",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                      fontSize: 12),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(height: 3, thickness: 1),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  void _serviceDialog(BuildContext context, subscriptionServiceList) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Padding(padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: subscriptionServiceList.length,
                    itemBuilder: (BuildContext context, int i) {
                      return ListTile(
                        title: Text(subscriptionServiceList[i]['serviceName'],maxLines: 1,
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)),
                        subtitle: Text('service available count is'
                            ' ${subscriptionServiceList[i]['maxServiceCount'].toString()}',
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
                        trailing: Text('Rs. '
                            ' ${subscriptionServiceList[i]['fixedCharge'].toString()}',
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
                      );
                    },
                  ),
                )
              ),
              // Text('${subscriptionList['serviceName']}')
            ],
          );
        },
      );



  _openCustomerSheet(context, subscriptionList){
    showModalBottomSheet<dynamic>(context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        builder: (BuildContext a) {

          String paymentType = 'RazorPay';

          return SingleChildScrollView(
            child: Wrap(
              children: [
                Form(
                    key: _bottomForm,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child:Padding(padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                  child: Text(subscriptionList['name'],
                                      style: titleStyle, textAlign: TextAlign.start),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child:Padding(padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                    child: Text('Rs. ${subscriptionList['exclusiveRate']}',
                                        style: const TextStyle(fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromARGB(255, 128, 128, 128),
                                            letterSpacing: 0.05
                                        ), textAlign: TextAlign.start),
                                  )
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    // contentPadding: EdgeInsets.symmetric(vertical: 30.0),
                                      isDense: true,
                                      border:  OutlineInputBorder(borderRadius:BorderRadius.circular(18),
                                          borderSide:BorderSide.none),
                                      fillColor:Colors.grey.withOpacity(0.1),
                                      filled:true,
                                      hintText: 'Customer Name',
                                      hintStyle: TextStyle(
                                          fontSize: 14
                                      )
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  obscureText: false,
                                  keyboardType: TextInputType.number,
                                  // validator: (value) {
                                  //   if (value == null ||
                                  //       value.isEmpty ) {
                                  //     return 'Please enter valid Email';
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: InputDecoration(
                                      border:  OutlineInputBorder(borderRadius:BorderRadius.circular(18),
                                          borderSide:BorderSide.none),
                                      fillColor:Colors.grey.withOpacity(0.1),
                                      filled:true,
                                      isDense: true,
                                      hintText: 'Customer Email',
                                      hintStyle: TextStyle(
                                          fontSize: 14
                                      )
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: TextFormField(
                                  obscureText: false,
                                  keyboardType: TextInputType.number,
                                  maxLength: 10,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 10) {
                                      return 'Please enter valid Mobile Number';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border:  OutlineInputBorder(borderRadius:BorderRadius.circular(18),
                                        borderSide:BorderSide.none),
                                    fillColor:Colors.grey.withOpacity(0.1),
                                    filled:true,
                                    isDense: true,
                                    hintText: 'Customer Mobile',
                                    hintStyle: TextStyle(
                                        fontSize: 14
                                    ),
                                    counterText: "",
                                    suffixIcon: widget.type == 1 ? IconButton(
                                      icon: Icon(Icons.send), onPressed: () {
                                      _sendOtp();
                                      // setState(() {
                                      //   _otpEnabled = !_otpEnabled;
                                      // });
                                    },
                                    ) : null,
                                  ),
                                ),
                              ),
                              hello(_otpEnabled),
                              const SizedBox(height: 5),
                              const Align(
                                alignment: Alignment.topLeft,
                                child:Padding(padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                  child: Text('Payment Type',
                                      style: titleStyle, textAlign: TextAlign.start),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                  padding: EdgeInsets.all(8),
                                  child: DropdownButtonFormField(
                                    value: paymentType,
                                    icon: const Icon(Icons.arrow_drop_down_circle_outlined ),
                                    elevation: 2,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      border:  OutlineInputBorder(borderRadius:BorderRadius.circular(18),
                                          borderSide:BorderSide.none),
                                      fillColor:Colors.grey.withOpacity(0.1),
                                      filled:true,
                                      isDense: true,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        paymentType = newValue!;
                                      });
                                    },
                                    items: <String>['RazorPay', 'PayU']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),)
                              ),
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: ElevatedButton(
                                  onPressed: () =>
                                  {

                                  },
                                  child: const Text('Pay Now'),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.blueGrey[900],
                                      minimumSize: Size.fromHeight(40),
                                      textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal)),
                                ),
                              )
                            ],
                          )
                      ),
                    )
                )
              ],
            ),
          );
        });
  }

  hello(bool otpEnabled) {
    return Visibility(
      visible: otpEnabled,
      maintainState: true,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: TextFormField(
          obscureText: true,
          maxLength: 5,
          focusNode: otpFocusNode,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                value.length < 4) {
              return 'Please enter valid OTP';
            }
            return null;
          },
          decoration: InputDecoration(
            border:  OutlineInputBorder(borderRadius:BorderRadius.circular(18),
                borderSide:BorderSide.none),
            fillColor:Colors.grey.withOpacity(0.1),
            filled:true,
            isDense: true,
            hintText: 'Enter Otp',
            hintStyle: TextStyle(
                fontSize: 14
            ),
            counterText: "",
          ),
          onSaved: (value) {
            setState(() {
              // _otpValue = value!;
            });
          },
        ),
      ),
    );
  }

}
