import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  

  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(flex: 1, child: Container(
                color: Colors.blueGrey,
                child: const Center(
                  child: Image(
                      width: 250,
                      height: 150,
                      image: NetworkImage('https://www.just.jobs/wp-content/uploads/2020/01/readyassist.png')
                  ),
                ),
              )
              ),
              Expanded(child: Container(color: Colors.white)),
            ],
          ),
          Align(
            alignment: Alignment(0, 0),
            child: Container(
              width: size.width * 0.9,
              height: size.height * 0.38,
              child: Card(
                elevation: 12,
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
                    children: [
                      const Text("Subscription Sales",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(),
                                labelText: 'Mobile No',
                                hintText: 'Enter Your Mobile',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(),
                                labelText: 'Otp',
                                hintText: 'Enter Otp',
                              ),
                            ),
                          ),
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                           margin: EdgeInsets.only(left: 10.0),
                          child: ElevatedButton(
                            onPressed: () => {
                              Navigator.pushNamed(context, '/home')},
                            child:const Text('SignIn'),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
    );
  }
}







