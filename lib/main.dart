import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

  List<List<int>> list_lotto = [];

  void _addLotto (){
    setState(() {
      List<int> lotto=[];
      while(true){
        var rnd = Random().nextInt(45) + 1;
        if(!lotto.contains(rnd)){
          lotto.add(rnd);
        }
        if(lotto.length == 6) break;
      }

      lotto.sort();
      list_lotto.add(lotto);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("로또 겟차"),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Center(
                child: ClipOval(
                  child: Container(
                    color: Colors.grey,
                    height: 150.0, // height of the button
                    width: 150.0, // width of the button
                  ),
                )),
            Center(
                child: ClipOval(
                    child: Container(
                      //color: Colors.green,
                      height: 120.0, // height of the button
                      width: 120.0, // width of the button
                      decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(
                              color: Colors.white,
                              width: 10.0,
                              style: BorderStyle.solid),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(21.0, 10.0),
                                blurRadius: 20.0,
                                spreadRadius: 40.0)
                          ],
                          shape: BoxShape.circle),
                      child: Center(
                          child: Text('START',
                              style:
                              TextStyle(color: Colors.white.withOpacity(0.6)))),
                    ),
                  ),
                ),
          ],
        ),
















        // ListView.separated(
        //   padding: EdgeInsets.all(8),
        //   itemCount: list_lotto.length,
        //     itemBuilder: (context, index) {
        //       return Container(
        //         child: Text(list_lotto[index].toString()),
        //       );
        //     },
        //     separatorBuilder: (context, index) {
        //       return Divider();
        //     },
        //
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addLotto,
        tooltip: '로또번호 생성',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
