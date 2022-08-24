import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final databaseRef = FirebaseDatabase.instance.ref().child('RFID/');
  DateTime now = DateTime.now();

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
      body: Stack(
        children: [
          SafeArea(
            child: FirebaseAnimatedList(
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff07143F),
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12.0,
                        top: 12.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ID: ${snapshot.value.toString()} - Mr. Sunil Herath',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Color(0xff07143F)),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            DateFormat("MMMM dd, yyyy").format(DateTime.now()) +
                                DateFormat("    hh:mm:ss a")
                                    .format(DateTime.now()),
                            style: const TextStyle(
                                fontSize: 14.0, color: Color(0xff6D6D6D)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              query: databaseRef,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              width: double.infinity,
              height: 50,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 20,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: ElevatedButton(
                  onPressed: () =>
                      {FirebaseDatabase.instance.ref('RFID/').remove()},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff07143F)),
                  ),
                  child: const Text(
                    'Clear all',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
