import 'package:flutter/material.dart';
import 'package:flutter_app/screens/sub_seller/active_seller.dart';
import 'package:flutter_app/screens/sub_seller/blocked_seller.dart';
import 'package:flutter_app/screens/sub_seller/in_active_seller.dart';

class SubSeller extends StatefulWidget {
  const SubSeller({Key? key}) : super(key: key);

  @override
  State<SubSeller> createState() => _SubSellerState();
}

class _SubSellerState extends State<SubSeller> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: Colors.blueGrey[900],
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back), onPressed: () {Navigator.pop(context);},
            ),
            title: const Text('Sub-Sellers'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Active'),
                Tab(text: 'In-Active'),
                Tab(text: 'Block')
              ],
            ),
          ),
          body: TabBarView(children: [
            ActiveSeller(),
            InActiveSeller(),
            BlockedSeller()
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/onboard_seller');
            },
            backgroundColor: Colors.blueGrey,
            child: const Icon(Icons.add),
          ),

        )
    );
  }
}
