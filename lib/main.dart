import 'package:flutter/material.dart';

import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';

import 'data/database.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';

import 'screen/home_screen.dart';
import 'screen/camera_screen.dart';
import 'screen/notify_screen.dart';
import 'screen/more_screen.dart';
import 'screen/winning_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper.instance;

  //bottom navigation
  int selectedPos = 2;

  double bottomNavBarHeight = 55;

  List<TabItem> tabItems = List.of([
    TabItem(Icons.qr_code_scanner_rounded, "", Colors.blue,
        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
    TabItem(Icons.notes, "", Colors.orange,
        labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    TabItem(Icons.home, "", Color(0xff271f99),
        labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    TabItem(Icons.notifications, "", Colors.green,
        labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    TabItem(Icons.more_horiz_rounded, "", Colors.cyan,
        labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: bottomNavBarHeight),
              child: bodyContainer(),
            ),
            Align(alignment: Alignment.bottomCenter, child: bottomNav()),
          ],
        ),

        /*
        번호 생성 버튼
        floatingActionButton: Stack (
          children: <Widget>[
            Align(
              alignment: Alignment(Alignment.bottomRight.x, Alignment.bottomRight.y - 0.4),
              child: FloatingActionButton(
                onPressed: _tableDrop,
                tooltip: '테이블 드랍',
                child: Icon(Icons.delete),
              ),
            ),
            Align(
              alignment: Alignment(Alignment.bottomRight.x, Alignment.bottomRight.y - 0.2),
              child: FloatingActionButton(
                onPressed: _addLotto,
                tooltip: '로또번호 생성',
                child: Icon(Icons.create),
              ),
            ),
          ],
        ),
         */
      ),
    );
  }

  Widget bodyContainer() {
    switch (selectedPos) {
      case 0:
        return CameraScreen();
      case 1:
        return WinningScreen();
      case 2:
        return HomeScreen();
      case 3:
        return NotifyScreen();
      case 4:
        return MoreScreen();
    }

    return Container();
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (selectedPos) {
        setState(() {
          this.selectedPos = selectedPos!;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
