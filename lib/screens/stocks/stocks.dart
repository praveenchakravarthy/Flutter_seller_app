import 'package:flutter/material.dart';

class Stocks extends StatefulWidget {
  const Stocks({Key? key}) : super(key: key);

  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  int? selectedIndex;
  bool checked = false;
  List<bool> selectedId = [];

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
        title: const Text('Stocks'),
      ),

      body: stocks(),

    );
  }

  Widget stocks() {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (BuildContext context, int i) {
        return GestureDetector(
          onTap: () => {
            setState(() {
              selectedIndex = i;
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
                left: 16, right: 16, top: 8, bottom: 8),
            elevation: 1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(color: Colors.grey, width: 0.4)),
            color: selectedIndex == i
                ? const Color.fromARGB(255, 246, 246, 246)
                : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 16.0, horizontal: 16),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                      const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          '23 Sep 2021, 03:35 pm',
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                         Checkbox(
                           value: true,
                           onChanged: null,
                         ),
                      VerticalDivider(
                        width: 12,
                      ),
                      Text('Secret Code', maxLines: 1,
                      style: TextStyle(fontSize: 14, color: Colors.black))
                    ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <Widget>[
                      Expanded(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(padding: EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
                            child: Text('Created by Praveen Chakravarthy',
                              maxLines: 1,
                              style: TextStyle(color: Colors.black, fontSize: 11),
                            ),
                          ),
                        )
                      ),
                      Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(padding: EdgeInsets.all(5),
                              child: Text('Assigned', style: TextStyle(color: Colors.green, fontSize: 14),
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
        );
      },
    );
  }

}
