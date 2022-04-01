import 'package:flutter/material.dart';
import 'package:lotto/screen/camera_screen.dart';
import 'package:lotto/screen/winning_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color(0xff271f99),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  print('당첨 번호클릭');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WinningScreen()),
                  );
                },
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        '2022.03.26',
                        style: TextStyle(
                          fontSize: 22,
                            color: Colors.grey),
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
                    ],
                  ),
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
              InkWell(
                onTap: (){
                  print("간편확인");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CameraScreen()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "간편 확인  ",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white)),
                          WidgetSpan(
                            child: Icon(
                              Icons.qr_code_scanner_rounded,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
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
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '고객님의',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '총 당첨금액은',
                      style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 22,),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "0 ",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "원 입니다.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 230,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      scale: 1.5,
                        alignment: Alignment.centerLeft,
                        image: AssetImage('assets/home_successImg.jpg'))),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text('더 알아보기  >'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
