import 'package:flutter/material.dart';

import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';

import 'data/database.dart';
import 'data/lotto.dart';
import 'data/util.dart';

import 'screen/home_screen.dart';

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
  
  double bottomNavBarHeight = 40;

  List<TabItem> tabItems = List.of([
    new TabItem(Icons.qr_code_scanner_rounded, "", Colors.blue, labelStyle: TextStyle(fontWeight: FontWeight.normal)),
    new TabItem(Icons.search, "", Colors.orange, labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    new TabItem(Icons.home, "", Color(0xff271f99),),
    new TabItem(Icons.notifications, "", Colors.green),
    new TabItem(Icons.more_horiz_rounded, "", Colors.cyan),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff271f99),
        title: Text("로또 겟차", style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Stack(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom: bottomNavBarHeight),child: bodyContainer(),),
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




    );
  }

  Widget bodyContainer() {

    print(selectedPos);

    switch (selectedPos) {
      case 0:
        //return const HomeScreen();
        break;
      case 1:
        //return const HomeScreen();
        break;
      case 2:
        //return const HomeScreen();
        break;
      case 3:
        //return const HomeScreen();
        break;
    }

    return HomeScreen();

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
