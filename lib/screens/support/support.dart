import 'package:flutter/material.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), onPressed: () {Navigator.pop(context);},
        ),
        title: const Text('Support'),
      ),

      body: _Support(),
    );
  }

  Widget _Support(){
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[900],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)
                      )
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          children: [
                            Text('Hello, how can we help ?',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                           Align(
                             alignment: Alignment.center,
                             child: Padding(
                               padding: EdgeInsets.all(15),
                               child: Text('Happy to help here we provide all the available'
                                   '     support options. please utilize and be gentle',
                                 style: TextStyle(color: Colors.grey.shade400 , fontSize: 14,
                                 letterSpacing: 0.05, height: 1.5),
                               ),
                             )
                           )
                          ],
                        ),
                      ),
                    )
                  ),
              ),
              Expanded(
                flex: 2,
                  child: Container(color: Colors.white)),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Wrap(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 150, left: 16, right: 16, bottom: 10),
                  height: 500,
                  color: Colors.white,
                  child: Card(
                    margin: const EdgeInsets.all(0.0),
                    elevation: 6,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: size.height * 0.03,
                          top: size.height * 0.03),
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 30,
                          ),
                          ListTile(
                            leading: Icon(Icons.design_services),
                            title: Text('Plans',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(Icons.arrow_right),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ListTile(
                            leading: Icon(Icons.question_answer),
                            title: Text('FAQ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(Icons.arrow_right),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ListTile(
                            leading: Icon(Icons.help),
                            title: Text('Help',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(Icons.arrow_right),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ListTile(
                            leading: Icon(Icons.feedback),
                            title: Text('Feedback',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(Icons.arrow_right),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text('www.readyassist.in © 2021'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );  }

}
