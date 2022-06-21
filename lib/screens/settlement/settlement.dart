import 'package:flutter/material.dart';

class Settlement extends StatefulWidget {
  const Settlement({Key? key}) : super(key: key);

  @override
  State<Settlement> createState() => _SettlementState();
}

class _SettlementState extends State<Settlement> {

  int payment = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), onPressed: () {Navigator.pop(context);},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.payment,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/earnings');
            },
          )
        ],
        title: const Text('Settlement'),
      ),

      body: settlement(),

    );
  }

  Widget settlement(){
    return Container(
      margin: EdgeInsets.only(top: 50),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            )
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child:  Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 30,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        payment = 1;
                      });
                    },
                    child: Text(
                      'Pay-Offline',
                      style: TextStyle(color: payment == 1 ? Colors.white : Colors.black,
                          fontSize: 15),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: payment == 1 ? Colors.blueGrey : null,
                      side: const BorderSide(width: 0.3, color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 20),

                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        payment = 2;
                      });
                    },
                    // child: const Padding(padding: EdgeInsets.all(10),
                    child: Text('Pay-Online',
                      style: TextStyle(color: payment == 2 ? Colors.white : Colors.black,
                          fontSize: 15),),
                    // ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: payment == 2 ? Colors.blueGrey : null,
                      side: const BorderSide(width: 0.3, color: Colors.black),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length < 10) {
                          return 'Please enter Amount';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        isDense: true,
                        hintText: 'Amount',
                        hintStyle: TextStyle(fontSize: 14),
                        counterText: "",
                      ),
                    ),
                  ),
                  VerticalDivider(
                    width: 10,
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2.0), //or 15.0
                      child: Container(
                        height: 40.0,
                        width: 60.0,
                        color: Colors.blueGrey[200],
                        child:
                        Icon(Icons.upload_file, color: Colors.white, size: 30.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Padding(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.indigo[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          'STANDARD CHARTERED',
                        style: TextStyle(color: Colors.blueAccent, letterSpacing: 0.05),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          'IOBA0000263',
                        style: TextStyle(color: Colors.grey, fontSize: 10, letterSpacing: 0.05),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Padding(padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        '000001112224455566',
                        style: TextStyle(color: Colors.black, letterSpacing: 2),
                      ),
                    ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(flex: 1,
                            child: Column(
                              children: const [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text('Rs. 0.0',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child:  Text('Payable Amount',
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        const Expanded(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Image(
                                width: 50,
                                height: 15,
                                image: NetworkImage(
                                    'https://www.just.jobs/wp-content/uploads/2020/01/readyassist.png'),
                              ),
                            )
                        )
                      ],
                    )
                  ],
                ),
              )
              ),
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: ElevatedButton(
                      onPressed: () => {
                      },
                      child:const Text('Submit'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey[900],
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 13),
                        textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        )

    );
  }
}
