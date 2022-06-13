import 'package:flutter/material.dart';
import 'package:flutter_app/services/api/apis.dart';

class Subscription extends StatefulWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  final ApiService _apiService = ApiService.create();
  var check;
  List _subscriptionList = [];

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
          // onTap: () => _openCustomerSheet(_subscriptionList[i]),

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
                          icon: const Icon(Icons.circle))
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
                                      fontSize: 10),
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
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: subscriptionServiceList.length,
                  itemBuilder: (BuildContext context, int i) {
                    return ListTile(
                      title: Text(subscriptionServiceList[i]['serviceName'],maxLines: 1,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)),
                      subtitle: Text('service available count is'
                          ' ${subscriptionServiceList[i]['maxServiceCount'].toString()}',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
                      trailing: Text('Rs. '
                          ' ${subscriptionServiceList[i]['fixedCharge'].toString()}',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
                    );
                  },
                ),
              ),
              // Text('${subscriptionList['serviceName']}')
            ],
          );
        },
      );

  Widget setupAlertDialogContainer() {
    return Container(
      height: 300.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Gujarat, India'),
          );
        },
      ),
    );
  }


}


_displayDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    transitionDuration: Duration(milliseconds: 2000),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Center(
            child:Column(
              mainAxisSize: MainAxisSize.min,
              children:<Widget> [
                Text('Hai This Is Full Screen Dialog', style: TextStyle(color: Colors.red, fontSize: 20.0),),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("DISMISS",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
