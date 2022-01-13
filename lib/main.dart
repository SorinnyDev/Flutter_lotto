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

  void _addLotto() {
    setState(() {
      List<int> lotto = [];
      while (true) {
        int rnd = Random().nextInt(45) + 1;
        if (!lotto.contains(rnd)) {
          lotto.add(rnd);
        }
        if (lotto.length == 6) break;
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
      body: ListView.separated(
        padding: EdgeInsets.all(8),
        itemCount: list_lotto.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...list_lotto[index].map(
                (e) {
                  return Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Text(
                      "${e}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              )
            ],
          );
          // return Container(child: Text("${list_lotto[index]}"),);
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addLotto,
        tooltip: '로또번호 생성',
        child: Icon(Icons.refresh),
      ),
    );
  }

  // Widget getNumToImg2 (List<int> list_lotto) {
  //
  //   int whileIndex = 0;
  //
  //   List<Widget> list_lotto_img = [];
  //
  //   while(whileIndex < list_lotto.length){
  //     Container(
  //       width: 100,
  //       height: 100,
  //       decoration: BoxDecoration(
  //         color: Colors.black.withOpacity(0.25), // border color
  //         shape: BoxShape.circle,
  //       ),
  //       child: Padding(
  //         padding: EdgeInsets.all(2), // border width
  //         child: Container(
  //           alignment: Alignment.center,
  //           decoration: BoxDecoration(
  //             shape: BoxShape.circle,
  //             color: Colors.red, // inner circle color
  //           ),
  //           child: Container(
  //               width: 70,
  //               height: 70,
  //               alignment: Alignment.center,
  //               decoration: BoxDecoration(
  //                 color: Colors.green, // border color
  //                 shape: BoxShape.circle,
  //               ),
  //               child: Container(
  //                 child: Text(list_lotto[whileIndex].toString(), style: TextStyle(color: Colors.white),),)
  //           ),
  //         ),
  //       ),
  //     );
  //     whileIndex ++;
  //   }
  //   return Container(
  //     child: Text("${list_lotto.length}"),
  //   );
  //
  // }

  List<Widget> getNumToImg(List<int> list_lotto) {
    List<Widget> list_lotto_img = [];

    int whileIndex = 0;
    while (whileIndex < list_lotto.length) {
      list_lotto_img[whileIndex] = Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.25), // border color
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(2), // border width
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red, // inner circle color
            ),
            child: Container(
                width: 70,
                height: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.green, // border color
                  shape: BoxShape.circle,
                ),
                child: Container(
                  child: Text(
                    list_lotto[whileIndex].toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ),
        ),
      );
      whileIndex++;
    }

    return list_lotto_img;
  }
}
