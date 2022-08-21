// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:rfidapp/list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      // 01) defining named routes
      routes: <String, WidgetBuilder>{
        '/listScreen': (context) => const ListScreen(),
        '/homeScreen': (context) => const HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/banner_area@2x.png'),
              Padding(
                padding: const EdgeInsets.only(top: 250.0),
                child: Container(
                  height: MediaQuery.of(context).size.height - 250.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 270.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    )
                  ],
                ),
              ),
              cardBuilder(
                  320.0, 'assets/images/list_icon@2x.png', 'List of RFIDs'),
              cardBuilder(
                  440.0, 'assets/images/add_icon@2x.png', 'Add new RFIDs'),
              cardBuilder(
                  560.0, 'assets/images/control_icon@2x.png', 'Controls'),
              cardBuilder(
                  680.0, 'assets/images/admin_icon@2x.png', 'Admin panel'),
            ],
          ),
        ],
      ),
    );
  }

  InkWell cardBuilder(double paddingTop, String image, String text) {
    return InkWell(
      onTap: (() {
        Navigator.of(context).pushNamed('/listScreen');
      }),
      child: Padding(
        padding: EdgeInsets.only(top: paddingTop),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                height: 90.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 70,
                        child: Image.asset(image),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70.0),
                        child: Text(
                          text,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Color(0xff4B44C4),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
