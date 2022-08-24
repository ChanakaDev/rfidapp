import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final databaseRef = FirebaseDatabase.instance.ref().child('RFID/');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/homeScreen');
            },
            icon: Image.asset('assets/images/back_icon@2x.png'),
          ),
          title: const Text(
            'List of RFIDs',
            style: TextStyle(color: Color(0xff07143F), fontSize: 22.0),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/homeScreen');
              },
              icon: Image.asset('assets/images/home_icon@2x.png'),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
            child: FirebaseAnimatedList(
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            return ListTile(title: Text(snapshot.value.toString()));
          },
          query: databaseRef,
        )));
  }
}
