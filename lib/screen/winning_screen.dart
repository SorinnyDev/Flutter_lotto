import 'package:flutter/material.dart';

import 'dart:math';

import 'package:lotto/data/lotto.dart';
import 'package:lotto/data/util.dart';
import 'package:lotto/data/database.dart';

import 'package:simple_shadow/simple_shadow.dart';

class WinningScreen extends StatefulWidget {
  const WinningScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WinningScreen();
  }
}

class _WinningScreen extends State<WinningScreen> {
  final dbHelper = DatabaseHelper.instance;

  List<List<int>> list_lotto = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  double _width = 200;
  double _height = 0;
  Color _color = Colors.white;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  bool expanded_onoff = false;

  @override
  Widget build(BuildContext context) {

    return Column(
        children: <Widget>[
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xff271f99),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {

                        setState(() {
                          if(! expanded_onoff){
                            _height = 200;
                          }else {
                            _height = 0;
                          }
                          expanded_onoff = !expanded_onoff;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            '2022.03.26',
                            style: TextStyle(fontSize: 22, color: Colors.grey),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: '1008회 당첨번호 ',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                )
                              ],
                            ),
                          ),
                          AnimatedContainer(
                            // Use the properties stored in the State class.
                            width: _width,
                            height: _height,
                            decoration: BoxDecoration(
                              color: _color,
                              borderRadius: _borderRadius,
                            ),
                            // Define how long the animation should take.
                            duration: const Duration(seconds: 1),
                            // Provide an optional curve to make the animation feel smoother.
                            curve: Curves.fastOutSlowIn,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 45,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(5.0))),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  bottom: 13,
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                    bottom: 5,
                                    child: Text(
                                      "___",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            width: 45,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(5.0))),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  bottom: 13,
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                    bottom: 5,
                                    child: Text(
                                      "___",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            width: 45,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(5.0))),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  bottom: 13,
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                    bottom: 5,
                                    child: Text(
                                      "___",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            width: 45,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(5.0))),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  bottom: 13,
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                    bottom: 5,
                                    child: Text(
                                      "___",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            width: 45,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(5.0))),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  bottom: 13,
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                    bottom: 5,
                                    child: Text(
                                      "___",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            width: 45,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(5.0))),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  bottom: 13,
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                    bottom: 5,
                                    child: Text(
                                      "___",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            width: 45,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color(0xff8a85ff),
                                borderRadius: BorderRadius.all(Radius.circular(5.0))),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  bottom: 13,
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                    bottom: 5,
                                    child: Text(
                                      "___",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 7),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Container(),
          ),

        ],
      );
  }
}
