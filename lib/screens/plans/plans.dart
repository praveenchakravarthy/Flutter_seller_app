import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/services/api/apis.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Plans extends StatefulWidget {
  const Plans({Key? key}) : super(key: key);

  @override
  _PlansState createState() => _PlansState();
}

class _PlansState extends State<Plans> {
  var codeData;
  final Razorpay _razorpay = Razorpay();
  final ApiService _apiService = ApiService.create();
  TextEditingController _mobileController = TextEditingController();
  bool click = true;
  int? selectedIndex;
  List _planList = [];
  var _selectedPlan;

  @override
  void initState() {
    super.initState();
    _getAllPlans();
    // _razorpay = new Razorpay();


    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    // _razorpay.clear();
  }


  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print(response);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  _getAllPlans() async {
    Map<String, dynamic> payload = {
      'filter': jsonEncode({'where': {'for': 1}})
    };

    var res = await _apiService.getActivePlans(payload);
    setState(() {
      _planList = res.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    codeData = ModalRoute.of(context)?.settings.arguments;

    print(codeData['reSellerIdOfSubSeller']);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), onPressed: () {
          Navigator.pop(context);
        },
        ),
        title: const Text('Plans'),
      ),

      body: plans(),

    );
  }


  Widget plans() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 5, bottom: 5),
                child: TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  controller: _mobileController,
                  maxLength: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 10) {
                      return 'Please enter valid Mobile Number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      fillColor: Colors.grey.withOpacity(0.1),
                      filled: true,
                      isDense: true,
                      hintText: 'Enter Your Mobile',
                      counterText: ""),
                  onSaved: (value) {
                    // setState(() => _mobileNo = value!);
                  },
                ),
              ),
            )),
        Expanded(
            flex: 8,
            child: ListView.builder(
              itemCount: _planList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int i) {
                return GestureDetector(
                  onTap: () =>
                  {
                    setState(() {
                      selectedIndex = i;
                      _selectedPlan = _planList[i];
                    }),
                  },
                  child: Card(
                    margin: const EdgeInsets.only(
                        left: 16, right: 16, top: 8, bottom: 8),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                        side: BorderSide(color: Colors.black12, width: 0.5)),
                    color: selectedIndex == i
                        ? Colors.blueGrey[100]
                        : null,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16),
                      child: Column(
                        children: [
                          // A Row for the top
                          Row(
                            children: [
                               CircleAvatar(
                                  backgroundColor:
                                  Colors.black12),
                              const VerticalDivider(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                   Text(
                                    '${_planList[i]['name']}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Rs. ${_planList[i]['exclusiveRate'].toString()}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12)),
                                      VerticalDivider(
                                        width: 10,
                                      ),
                                      Text('${_planList[i]['retailRate']}',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            decoration:
                                            TextDecoration.lineThrough,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.info),
                                  color: Colors.grey)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
        Container(
          // padding: EdgeInsets.only(top: 16, bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: buildInsertButton(),
        ),
      ],
    );
  }

  Widget buildInsertButton() =>
      Padding(
        padding: EdgeInsets.all(16),

        child: ElevatedButton(
          onPressed: () =>
          {
            if(selectedIndex != null){

              if(_mobileController.text.isNotEmpty && _mobileController.text.length == 10){
                _openPaymentDialog(context, _selectedPlan)
              } else {
                Get.snackbar('INFO', 'Please Enter Customer Mobile',
                    snackPosition: SnackPosition.BOTTOM,
                    colorText: Colors.black,
                    backgroundColor: Colors.grey[100]
                ),
              }

            } else {
              Get.snackbar('INFO', 'Please Select a plan',
                  snackPosition: SnackPosition.BOTTOM,
                  colorText: Colors.black,
                  backgroundColor: Colors.grey[100]
              ),
            }
          },
          child: const Text('Payment'),
          style: ElevatedButton.styleFrom(
              primary: Colors.blueGrey[900],
              minimumSize: Size.fromHeight(40),
              shadowColor: Colors.white,
              textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal)),
        ),
      );



  _openPaymentDialog(context, selectedPlan) {
    int type = 0;
    showDialog(
      context: context,
      builder: (context) {
        // add StatefulBuilder to return value

        return StatefulBuilder(
          builder: (context, setState) {
            return SimpleDialog(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                         Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: Text(
                              selectedPlan['name'],
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.05),
                            ),
                          ),
                        ),
                         Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: Text(
                              'Rs. ${selectedPlan['exclusiveRate'].toString()}',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.05),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      type = 1;
                                    });
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Cash',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          letterSpacing: 0.05),
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                    type == 1 ? Colors.blueGrey[100] : null,
                                    side: const BorderSide(
                                        width: 0.2, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      type = 2;
                                    });
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Online',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          letterSpacing: 0.05),
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                    type == 2 ? Colors.blueGrey[100] : null,
                                    side: const BorderSide(
                                        width: 0.2, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () =>
                  {
                    if(type == 2){
                      _directToRazorPay(selectedPlan['exclusiveRate'])
                    } else if(type == 1){
                      Navigator.pop(context)
                    } else {
                      Get.snackbar('INFO', 'Please Select a Payment Type',
                          snackPosition: SnackPosition.BOTTOM,
                          colorText: Colors.black,
                          backgroundColor: Colors.grey[100]
                      ),
                    },
                  },
                  child: const Text(
                    'Confirm',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.blueGrey[900],
                    minimumSize: Size.fromHeight(40),
                    shadowColor: Colors.white,
                  ),
                ),
                ),
              ],
            );
          },
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
                  child: Column(
                    children: [
                      ListView.builder(
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
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: ElevatedButton(
                            onPressed: () => {
                              Navigator.pop(context)
                            },
                            child:const Text('Ok'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey[900],
                              // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 13),
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
              )
          ),
          // Text('${subscriptionList['serviceName']}')
        ],
      );
    },
  );

  void _directToRazorPay(selectedPlanPrice) {
    var options = {
      "key": "rzp_test_VkKxyQ16f3DVBv",
      "amount": selectedPlanPrice * 100,
      "name": "Readyassist",
      "description": "testing plans",
      "currency": "INR"
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }
}

