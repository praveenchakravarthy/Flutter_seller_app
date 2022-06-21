import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/screens/digital_sale/subscription.dart';
import 'package:flutter_app/values/dimens/dimensions.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  String subSeller = 'Me';


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onBackPressed(); // Action to perform on back pressed
        return false;
      },
      child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            key: _scaffold,
            appBar: AppBar(
              backgroundColor: Colors.blueGrey,
              centerTitle: false,
              elevation: 0,
              leading: Container(
                margin: EdgeInsets.only(bottom: 12, left: 6),
                child: IconButton(
                  icon: const Icon(Icons.dashboard, size: 40,), onPressed: () {
                  _scaffold.currentState!.openDrawer();
                },
                ),
              ),
              title: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Expanded(flex: 3,
                        child: Text(
                          'Dashboard',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Theme(
                              data: ThemeData.dark(),
                              child: Container(
                                height: 40,
                                child: DropdownButtonFormField<String>(
                                  isExpanded: true, //just add this property as true
                                  value: subSeller,
                                  icon: Icon(Icons.arrow_drop_down),
                                  elevation: 0,
                                  decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.blueGrey))),
                                  style: const TextStyle(color: Colors.black),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      subSeller = newValue!;
                                    });
                                  },
                                  items: <String>['Me','NaGoo', 'Haritha','Melfa' ]
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,
                                        maxLines: 1,
                                        style: TextStyle(color: Colors.white),),
                                    );
                                  }).toList(),
                                ),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Praveen Chakravarthy',
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                ],
              ),
            ),
            drawer: Theme(
              data: Theme.of(context).copyWith(
                  canvasColor: Colors.white
              ), child: Drawer(
              elevation: 2,
              child: Column(
                children: <Widget>[
                  const UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                        color: Colors.blueGrey
                    ),
                    accountName: Text('Praveen Chakravarthy'),
                    accountEmail: Text('praveen.chakravarthy@readyassist.in'),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text('Pc'),
                    ),
                  ),
                  ListTile(
                    title: Text('Stocks'),
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/stocks');
                    },
                    leading: IconButton(
                      icon: Icon(Icons.pending),
                      onPressed: () {},
                    ),
                  ),
                  const Divider(height: 0.1),
                  ListTile(
                    title: const Text('Sold Subscription'),
                    onTap: (){
                      Navigator.popAndPushNamed(context, '/sold_subscription');
                    },
                    leading: IconButton(
                      icon: const Icon(Icons.subscriptions),
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/sold_subscription');
                      },
                    ),
                  ),
                  const Divider(height: 0.1),
                  ListTile(
                    title: Text('Sub-Seller'),
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/sub_seller');
                    },
                    leading: IconButton(
                      icon: Icon(Icons.pending),
                      onPressed: () {},
                    ),
                  ),
                  const Divider(height: 0.1),
                  ListTile(
                    title: Text('Settlement'),
                    onTap: (){
                      Navigator.pushNamed(context, '/settlement');
                    },
                    leading: IconButton(
                      icon: Icon(Icons.monetization_on),
                      onPressed: () {
                        Navigator.pushNamed(context, '/settlement');
                      },
                    ),
                  ),
                  const Divider(height: 0.1),
                  ListTile(
                    title: Text('Support'),
                    onTap: (){
                      Navigator.pushNamed(context, '/support');
                    },
                    leading: IconButton(
                      icon: Icon(Icons.support),
                      onPressed: () {
                        Navigator.pushNamed(context, '/support');
                      },
                    ),
                  ),
                  const Divider(height: 0.1),
                  ListTile(
                    onTap: (){
                      _openLogoutDialog(context);
                    },
                    title: const Text('Logout'),
                    leading: IconButton(
                      icon: Icon(Icons.logout),
                      onPressed: () {
                      },
                    ),
                  ),
                  const Divider(height: 0.1),
                  const Padding(padding: EdgeInsets.all(16),
                    child: Text(
                        'Version 1.0'
                    ),)
                ],
              ),
            ),
            ),
            body: _homeContent()
        ),
      )
    );
  }

  onBackPressed(){
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    });
  }

 /*Home Body*/
  Widget _homeContent(){
    final size = MediaQuery.of(context).size;
    return Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.blueGrey,
                  )),
              Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: Container(
                          color: Colors.white,
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(2),
                                          color: Colors.white),
                                      height: 120,
                                      width: 114,
                                      child: Card(
                                        elevation: 2,
                                        color: Colors.white,
                                        child: Column(
                                          children: const [
                                             SizedBox(
                                              height: 20,
                                            ),
                                            Icon(Icons.report),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text('Report', style: TextStyle(
                                                color: Colors.black),),
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(2.0),
                                        ),
                                        margin: EdgeInsets.all(5),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // scanQR();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(2),
                                            color: Colors.white),
                                        height: 120,
                                        width: 114,
                                        child: Card(
                                          elevation: 2,
                                          color: Colors.white,
                                          child: Column(
                                            children: const [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Icon(Icons.qr_code),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text('Scan', style: TextStyle(
                                                  color: Colors.black),),
                                            ],
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                2.0),
                                          ),
                                          margin: EdgeInsets.all(5),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => {
                                        _bottomSheet(context)
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(2),
                                            color: Colors.white),
                                        height: 120,
                                        width: 114,
                                        child: Card(
                                          elevation: 2,
                                          color: Colors.white,
                                          child: Column(
                                            children: const [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Icon(Icons.point_of_sale),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text('Digital Sale', style: TextStyle(
                                                  color: Colors.black),
                                              ),
                                            ],
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                2.0),
                                          ),
                                          margin: EdgeInsets.all(5),
                                        ),
                                      ),

                                    )
                                  ],
                                ),

                              ),
                              const SizedBox(
                                height: 20,
                              ),
                               GestureDetector(
                                 onTap: (){
                                   FocusScopeNode currentFocus = FocusScope.of(context);
                                   if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                                     currentFocus.focusedChild!.unfocus();
                                     }
                                   },
                                 child: Container(
                                   margin: EdgeInsets.only(right: 20, left: 20),
                                   child: Padding(
                                     padding: EdgeInsets.all(10),
                                     child: TextFormField(
                                       obscureText: false,
                                       keyboardType: TextInputType.multiline,
                                       decoration: InputDecoration(
                                         border: OutlineInputBorder(
                                             borderRadius: BorderRadius.circular(6),
                                             borderSide: BorderSide.none),
                                         fillColor: Colors.grey.withOpacity(0.1),
                                         filled: true,
                                         hintText: 'Enter Code here',
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                            Container(
                                margin: EdgeInsets.only(right: 20, left: 20),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: ElevatedButton(
                                    onPressed: () => {
                                     Navigator.pushNamed(context, '/plans')
                                    },
                                    child: const Text('Proceed'),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.blueGrey[900],
                                        minimumSize: Size.fromHeight(50),
                                        textStyle: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ), //variable above
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: size.width * 0.93,
              height: size.height * 0.35,
              child: Card(
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: size.height * 0.03,
                      top: size.height * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(flex: 2, child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.white),
                          height: 120,
                          width: 100,
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30.0,
                                  lineWidth: 5.0,
                                  percent: 0.10,
                                  center: new Text("10%"),
                                  backgroundColor: (Colors.grey[300])!,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: Colors.blueGrey,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text('Target', style: TextStyle(
                                    color: Colors.black),),
                              ],
                            ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.white),
                            height: 120,
                            width: 100,
                              child: Column(
                                children: [
                                  CircularPercentIndicator(
                                    radius: 30.0,
                                    lineWidth: 5.0,
                                    percent: 0.60,
                                    center: new Text("6000"),
                                    backgroundColor: (Colors.grey[300])!,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: Colors.blueGrey,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text('Incentive', style: TextStyle(
                                      color: Colors.black),),
                                ],
                              ),
                          ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.white),
                            height: 120,
                            width: 100,
                              child: Column(
                                children: [
                                  CircularPercentIndicator(
                                    radius: 30.0,
                                    lineWidth: 5.0,
                                    percent: 0.40,
                                    center: new Text("40"),
                                    backgroundColor: (Colors.grey[300])!,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: Colors.blueGrey,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text('Ranking', style: TextStyle(
                                      color: Colors.black),
                                  ),
                                ],
                              ),
                          ),
                      ],
                    ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.white),
                          height: 80,
                          width: 100,
                          child: Card(
                            elevation: 2,
                            color: Colors.white,
                            child: Column(
                              children: const [
                                SizedBox(
                                  height: 15,
                                ),
                                Text('0'),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(padding: EdgeInsets.all(5),
                                  child: Text('Cash Received', style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                  ),
                                )
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                                side: BorderSide(width: 1, color: Colors.black12.withOpacity(0.2))
                            ),
                            margin: EdgeInsets.all(5),
                          ),
                        ),
                       Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.white),
                            height: 80,
                            width: 100,
                            child: Card(
                              elevation: 2,
                              color: Colors.white,
                              child: Column(
                                children: const [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text('0'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(padding: EdgeInsets.all(5),
                                    child: Text('Current Stock', style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                    ),
                                  )
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                  side: BorderSide(width: 1, color: Colors.black12.withOpacity(0.2))
                              ),
                              margin: EdgeInsets.all(5),
                            ),
                          ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.white),
                            height: 80,
                            width: 100,
                            child: Card(
                              elevation: 2,
                              color: Colors.white,
                              child: Column(
                                children: const [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text('0'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(padding: EdgeInsets.all(5),
                                    child: Text('Total Sale', style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                    ),
                                  )
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                                side: BorderSide(width: 1, color: Colors.black12.withOpacity(0.2))
                              ),
                              margin: EdgeInsets.all(5),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                ),
              ),
            ),
          ),
        ],
    );

  }

  _openLogoutDialog(context){
    showDialog(context: context, builder: (BuildContext a) {
      return AlertDialog(
        title: const Text('Logout', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        content: const Text('Are you sure want to exit from application right now',
        style: TextStyle(fontSize: 12),
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Container(
                width: 80,
                height: 35,
                color: Colors.blueGrey,
                child: TextButton(
                  onPressed: () => Navigator.pop(context, 'Yes'),
                  child: const Text('Yes', style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Container(
              width: 80,
              height: 35,
              color: Colors.grey[300],
              child: TextButton(
                onPressed: () => Navigator.pop(context, 'No'),
                child: const Text('No', style: TextStyle(
                    color: Colors.black
                 ),
                ),
              ),
            )
          )
        ],
      );
    });
  }


  _bottomSheet(context){
   showModalBottomSheet<dynamic>(context: context,isScrollControlled: true,
       backgroundColor: Colors.white, builder: (BuildContext a) {
     return Wrap(
       children: [
         Container(
             margin: EdgeInsets.all(10),
             padding: EdgeInsets.all(10),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 const Align(
                   alignment: Alignment.topLeft,
                   child: Text('Choose Your Digital Sale', style: titleStyle, textAlign: TextAlign.start),
                 ),
                 const SizedBox(
                   height: 30,
                 ),
                 const Text('You have to be choose anyone option as shown below. WITH OTP :'
                     ' it will helps to sell the subscription through the app., '
                     'DIRECT URL : it helps send the URL to customer mobile no.'
                     ' customer will make the payment and all.', style: TextStyle(
                     fontSize: 13, fontWeight: FontWeight.w300, letterSpacing: 0.05,height: 1.5
                 )),
                 const SizedBox(
                   height: 30,
                 ),
                Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          flex: 1, // you can play with this value, by default it is 1
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,  MaterialPageRoute(
                                builder: (context) => const Subscription(type: 1),
                              ));
                              },
                            child: const Padding(padding: EdgeInsets.all(15),
                              child: Text('With Otp', style: TextStyle(color: Colors.black, fontSize: 15),),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(width: 0.6, color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),

                        Expanded(
                          flex: 1,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,  MaterialPageRoute(
                                builder: (context) => const Subscription(type: 2),
                              ));
                            },
                            child: const Padding(padding: EdgeInsets.all(15),
                              child: Text('Direct Url', style: TextStyle(color: Colors.black, fontSize: 15),),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(width: 0.6, color: Colors.black),
                            ),
                          ),
                        ),

                      ],
                    ),
                 const SizedBox(
                   height: 30,
                 ),
               ],
             )
         )
       ],
     );
   });
  }
}

