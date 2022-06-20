import 'package:flutter/material.dart';

class Earnings extends StatefulWidget {
  const Earnings({Key? key}) : super(key: key);

  @override
  State<Earnings> createState() => _EarningsState();
}

class _EarningsState extends State<Earnings> {

  String subSeller ='Me';

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
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(flex: 3,
                child: Text(
                  'Earnings'
                ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                  child: Theme(
                    data: ThemeData.dark(),
                    child: DropdownButtonFormField<String>(
                      isExpanded: true, //just add this property as true
                      value: subSeller,
                      icon: Visibility(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                      elevation: 2,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          subSeller = newValue!;
                        });
                      },
                      items: <String>['Me','Praveen Chakravarthy', 'Renuka']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                            maxLines: 1,
                            style: TextStyle(color: Colors.white),),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),

      body: earnings(),

    );
  }

  Widget earnings(){
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
                  const Align(
                   alignment: Alignment.topRight,
                   child: Text(
                     '04-12-1197'
                   ),
                 ),
                  const SizedBox(height: 5,),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        'INCENTIVE FOR SUBSCRIPTION 1001',
                      style: TextStyle(fontSize: 14),
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
                              SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child:  Text('INCENTIVE',
                                  style: TextStyle(
                                      color: Colors.grey,
                                    fontSize: 10
                                  ),
                                ),
                              ),
                            ],
                          )),
                      const Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text('ONLINE',
                              style: TextStyle(
                                  color: Colors.green
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                  SizedBox(height: 8),
                  Divider(height: 3, thickness: 1),
                ],
              ),
            ),
          ),
        );
      },
    );

  }
}
