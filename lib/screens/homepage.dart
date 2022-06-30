//import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:flutter/material.dart';
import 'package:meb_application/screens/loginpage.dart';
import 'package:meb_application/screens/profile_page.dart';
import 'package:meb_application/screens/sleeppage.dart';
import 'package:meb_application/screens/waterpage.dart';
import 'package:meb_application/screens/workoutpage.dart';

import '../fitbit_entities/access_token.dart';
import '../fitbit_entities/activities_steps_entity.dart';
import '../fitbit_entities/sleep_entity.dart';
import '../utils/stringpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/home/';
  static const routename = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();

  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = [const HomePage(), const Profile_Page()];

  @override
  Widget build(BuildContext context) {
    //print('${HomePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(HomePage.routename),
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'images/walking.jpg',
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width - 10,
                )
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(
                //style: ButtonStyle(overlayColor: Color.fromARGB(a, r, g, b)),
                onPressed: () async {
                  Navigator.of(context).pushNamed(WorkoutPage.route);
                },
                child: const Text(
                  'WORKOUT',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 25.0,
                    color: Colors.white,
                    decorationColor: Color.fromARGB(255, 109, 148, 129),
                    //backgroundColor: Color.fromARGB(255, 109, 148, 129)
                  ),
                ),
              )
            ]),
            //Text(widget.accessTokenEntity!.accessToken.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'images/drinking.jpg',
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width - 10,
                )
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/water');
                },
                child: const Text(
                  'WATER',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 25.0,
                    color: Colors.white,
                    //backgroundColor: Color.fromARGB(255, 109, 148, 129)
                  ),
                ),
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'images/sleeping.jpg',
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width - 10,
                )
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pushNamed(SleepPage.route);
                },
                child: const Text(
                  'SLEEP',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 25.0,
                    color: Colors.white,
                    //backgroundColor: Color.fromARGB(255, 109, 148, 129)
                  ),
                ),
              )
            ]),
          ]),
        ),
      ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(
            //decoration: const BoxDecoration(
            //color: Color.fromARGB(255, 109, 148, 129),
            //),
            child: Center(
              child: Image.asset(
                'images/logo.jpeg',
                width: 500,
                height: 500,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout,
                color: Color.fromARGB(255, 109, 148, 129), size: 30),
            title: const Text('Logout', style: TextStyle(fontSize: 18)),
            onTap: () => _toLoginPage(context),
          ),
          ListTile(
            leading: const Icon(Icons.fitness_center_sharp,
                color: Color.fromARGB(255, 109, 148, 129), size: 30),
            title: const Text('Workout', style: TextStyle(fontSize: 18)),
            onTap: () => Navigator.of(context).pushNamed(WorkoutPage.route),
          ),
          ListTile(
            leading: const Icon(Icons.bedtime_rounded,
                color: Color.fromARGB(255, 109, 148, 129), size: 30),
            title: const Text(
              'Sleep',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => Navigator.of(context).pushNamed(SleepPage.route),
          ),
          ListTile(
            leading: const Icon(Icons.water_drop,
                color: Color.fromARGB(255, 109, 148, 129), size: 30),
            title: const Text('Water', style: TextStyle(fontSize: 18)),
            onTap: () => Navigator.of(context).pushNamed(WaterPage.route),
          ),
        ]),
      ),
    );
  } //build

  void _toLoginPage(BuildContext context) {
    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacementNamed(LoginPage.route);
  } //_toCalendarPage

  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
