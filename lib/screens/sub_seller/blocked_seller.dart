import 'package:flutter/material.dart';

class BlockedSeller extends StatefulWidget {
  const BlockedSeller({Key? key}) : super(key: key);

  @override
  State<BlockedSeller> createState() => _BlockedSellerState();
}

class _BlockedSellerState extends State<BlockedSeller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: blocked_seller(),
    );
  }

  Widget blocked_seller() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int i) {

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
                    ],
                  ),
                  const SizedBox(height: 16),
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
