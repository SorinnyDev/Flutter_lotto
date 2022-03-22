import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

import 'data/database.dart';
import 'data/lotto.dart';
import 'data/util.dart';

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

  void _tableDrop() {
    //드랍 테이블
    dbHelper.dropTable('getchaLotto');
    print("드랍 테이블");

    super.setState(() {

      list_lotto = [];

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
          reverse: false,
          itemCount: list_lotto.length,
          itemBuilder: (context, index) {
            return getNumToImg2(list_lotto[index]);
          },
          separatorBuilder: (context, index) {
            return Divider();
          },

        ),
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






    );
  }



  Widget getNumToImg2(List<int> list_lotto){

    // 1번부터 10번까지는 노란색입니다.
    // 11번 부터 20번까지는 파란색입니다.
    // 21번부터 30번까지는 빨간색입니다.
    // 31번부터 40번까지는 검은색입니다.
    // 41번부터 45번까지는 초록색입니다.

    Color ball_color = Colors.blue;
    int ball_num = 0;

    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...list_lotto.map(
                (e) {
                  if(e <= 10){
                    ball_color = Colors.yellow;
                  }else if(e > 10 && e <= 20 ){
                    ball_color = Colors.blue;
                  }else if(e > 20 && e <= 30 ){
                    ball_color = Colors.red;
                  }else if(e > 30 && e <= 40 ){
                    ball_color = Colors.black;
                  }else if(e > 40 && e <= 45 ){
                    ball_color = Colors.green;
                  }

                  return SimpleShadow(
                    opacity: 1,         // Default: 0.5
                    color: Colors.grey,   // Default: Black
                    offset: Offset(0, 0), // Default: Offset(2, 2)
                    sigma: 4,             // Default: 2
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ball_color,
                      ),
                      child: SimpleShadow(
                        child: Text(
                          "${e}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        opacity: 1,         // Default: 0.5
                        color: Colors.black,   // Default: Black
                        offset: Offset(0, 0), // Default: Offset(2, 2)
                        sigma: 4,             // Default: 2
                      ),
                    )
                  );
                    },
              ),
              Container(
                width: 60,
                margin: EdgeInsets.only(left: 20),
                child: ElevatedButton(
                  onPressed: () => getNumbers(list_lotto),
                  child: const Text("번호 저장",
                        style: TextStyle(fontSize: 10,),
                        textAlign: TextAlign.center
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple, // background
                    onPrimary: Colors.white, // foreground
                  ),
                ),
              ),
            ],
          );
  }

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

  getNumbers(List<int> list_lotto) async{

    print("저장버튼 눌렷드아아아아");
    print("numbers : ${list_lotto}");
    String strarry = list_lotto.join(",");

    var insertResult = await dbHelper.insertLotto(Lotto(numbers: strarry));

    List allLotto = await dbHelper.getAllLotto();
    print(allLotto.length);

    await Utils.showToast('토스트 테스트');



  }
}
