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
      body: Center(
        child: ListView.separated(
          padding: EdgeInsets.all(8),
          itemCount: list_lotto.length,
            itemBuilder: (context, index) {
              return Container(
                child: Text(list_lotto[index].toString()),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addLotto,
        tooltip: '로또번호 생성',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
