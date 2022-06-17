import 'package:flutter/material.dart';

class UnTaggedSubscription extends StatefulWidget {
  const UnTaggedSubscription({Key? key}) : super(key: key);

  @override
  State<UnTaggedSubscription> createState() => _UnTaggedSubscriptionState();
}

class _UnTaggedSubscriptionState extends State<UnTaggedSubscription> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (BuildContext context, int i) {
        return GestureDetector(
          onTap: () => {
            setState(() {
            }),
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   content: const Text('Touched'),
            //   action: SnackBarAction(
            //     label: 'Undo',
            //     onPressed: () {
            //       // Some code to undo the change.
            //     },
            //   ),
            // ),)
          },
          child: Card(
            margin: const EdgeInsets.only(
                left: 16, right: 16, top: 4, bottom: 4),
            elevation: 1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(color: Colors.black12, width: 0.5)),
            child: Stack(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // A Row for the top
                      const Align(
                        alignment: Alignment.topRight,
                        child: Text('04-12-1997', style: TextStyle(fontSize: 10),),
                      ),
                      Row(
                        children: [
                          const CircleAvatar(
                              backgroundColor:
                              Color.fromARGB(255, 246, 246, 246)),
                          const VerticalDivider(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text(
                                'Un-Tagged',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text('QWERTY234RTY',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12)),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 40),
                        padding: EdgeInsets.all(10),
                        child: Text('Address', style: TextStyle(fontSize: 10),),
                      ),
                    ],
                  ),
                ),
                Positioned(right: 0.0, bottom: 0.0,
                  child: Padding(padding: EdgeInsets.all(10),
                    child: Card(
                        elevation: 1,
                        color: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: BorderSide(color: Colors.black12, width: 0.5)),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text('Rs. 100', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Pending', style: TextStyle(fontSize: 10),)
                            ],
                          ),
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
