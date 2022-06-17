import 'package:flutter/material.dart';
import 'package:flutter_app/screens/sold_subscriptions/tagged_subscription.dart';
import 'package:flutter_app/screens/sold_subscriptions/un_tagged_subscription.dart';

class SoldSubscription extends StatefulWidget {
  const SoldSubscription({Key? key}) : super(key: key);

  @override
  State<SoldSubscription> createState() => _SoldSubscriptionState();
}

class _SoldSubscriptionState extends State<SoldSubscription> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: Colors.blueGrey[900],
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back), onPressed: () {Navigator.pop(context);},
            ),
            title: const Text('Sold Subscriptions'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Tagged'),
                Tab(text: 'UnTagged')
              ],
            ),
          ),
          body: TabBarView(children: [
            TaggedSubscription(),
            UnTaggedSubscription()
          ]),

        )
    );
  }
}
