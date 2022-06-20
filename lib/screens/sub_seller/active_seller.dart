import 'package:flutter/material.dart';

class ActiveSeller extends StatefulWidget {
  const ActiveSeller({Key? key}) : super(key: key);

  @override
  State<ActiveSeller> createState() => _ActiveSellerState();
}

class _ActiveSellerState extends State<ActiveSeller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: active_sellers(),
    );
  }

  Widget active_sellers() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int i) {
        double c_width = MediaQuery.of(context).size.width * 0.9;

        return GestureDetector(
          onTap: () => {},

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
                      const CircleAvatar(
                        radius: 25,
                          backgroundColor: Colors.blueGrey,
                      ),
                      const VerticalDivider(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Text(
                            "Praveen Chakravarthy",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                              "9789447628",
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: ElevatedButton(
                            onPressed: () => {
                            },
                            child:const Text('Block', style: TextStyle(color: Colors.black),),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Colors.grey[300],
                              padding: EdgeInsets.all(10),
                              textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                      )
                    ],
                  ),
                  Row(
                    children: const [
                     Expanded(flex: 1, child: Center(
                       child: Text(
                         '#1'
                       ),
                     )),
                      VerticalDivider(
                        width: 15,
                      ),
                      Expanded(flex: 6, child: Text(
                          'Address was not provided'
                      ),)
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


}
