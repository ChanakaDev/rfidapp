import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();

    final List<String> ids = <String>[
      'ID #111111',
      'ID #222222',
      'ID #333333',
      'ID #444444',
      'ID #555555',
      'ID #666666',
      'ID #777777',
      'ID #888888',
      'ID #999999',
    ];

    final List<String> dates = <String>[
      'Monday, August 15, 2022 (GMT+5:30)',
      'Monday, August 15, 2022 (GMT+5:30)',
      'Monday, August 15, 2022 (GMT+5:30)',
      'Monday, August 15, 2022 (GMT+5:30)',
      'Monday, August 15, 2022 (GMT+5:30)',
      'Monday, August 15, 2022 (GMT+5:30)',
      'Monday, August 15, 2022 (GMT+5:30)',
      'Monday, August 15, 2022 (GMT+5:30)',
      'Monday, August 15, 2022 (GMT+5:30)',
    ];

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
          ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: ids.length,
            itemBuilder: (BuildContext context, int index) {
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
                          'Entry ${ids[index]}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Color(0xff07143F)),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Entry ${dates[index]}',
                          style: const TextStyle(
                              //fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Color(0xff6D6D6D)),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
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
                  onPressed: () => {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      //side: BorderSide(color: Colors.red)
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
