import 'package:flutter/material.dart';
import 'package:flutter_app/values/dimens/dimensions.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: false,
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.menu), onPressed: () {
        //    SideNav();
        // },
        // ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Dashboard',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ), SizedBox(height: 5),
            Text(
              'Praveen Chakravarthy',
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            )
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
                print('helloooo');
              },
              leading: IconButton(
                icon: Icon(Icons.account_box_rounded),
                onPressed: () {},
              ),
            ),
            Divider(height: 0.1),
            ListTile(
              title: Text('Sold Subscription'),
              leading: IconButton(
                icon: Icon(Icons.account_box_rounded),
                onPressed: () {
                  print('hello');
                },
              ),
            ),
            Divider(height: 0.1)
          ],
        ),
      ),
      ),
      body: _homeContent()
    );
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
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Image.network(
                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/2048px-Instagram_icon.png',
                                              fit: BoxFit.fill,
                                              height: 30,
                                              width: 30,
                                            ),
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
                                      onTap: () {},
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
                                            children: [
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Image.network(
                                                'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/2048px-Instagram_icon.png',
                                                fit: BoxFit.fill,
                                                height: 30,
                                                width: 30,
                                              ),
                                              const SizedBox(
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
                                            children: [
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Image.network(
                                                'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/2048px-Instagram_icon.png',
                                                fit: BoxFit.fill,
                                                height: 30,
                                                width: 30,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text('Digital Sale', style: TextStyle(
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

                                    )
                                  ],
                                ),

                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(20),
                                child: TextField(
                                  obscureText: false,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black)
                                    ),
                                    hintText: 'Enter Code here',
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                {

                                },
                                child: const Text('Proceed'),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blueGrey[900],
                                    minimumSize: Size(150, 40),
                                    textStyle: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal)),
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
              width: size.width * 0.93,
              height: size.height * 0.4,
              child: Card(
                elevation: 2,
                child: Container(
                  width: size.width,
                  height: size.height,
                  padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: size.height * 0.03,
                      top: size.height * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [],
                  ),
                ),
              ),
            ),
          ),
        ],
    );

  }


  _bottomSheet(Context){
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
                              Navigator.popAndPushNamed(context, '/subscription');
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
                              Navigator.popAndPushNamed(context, '/subscription');
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

