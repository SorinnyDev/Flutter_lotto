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

class _WinningScreen extends State<WinningScreen>
    with SingleTickerProviderStateMixin {
  final dbHelper = DatabaseHelper.instance;

  List<List<int>> list_lotto = [];

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView.separated(
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
        Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(
                  Alignment.bottomRight.x, Alignment.bottomRight.y - 0.4),
              child: FloatingActionButton(
                onPressed: _tableDrop,
                tooltip: '테이블 드랍',
                child: Icon(Icons.delete),
              ),
            ),
            Align(
              alignment: Alignment(
                  Alignment.bottomRight.x, Alignment.bottomRight.y - 0.2),
              child: FloatingActionButton(
                onPressed: _addLotto,
                tooltip: '로또번호 생성',
                child: Icon(Icons.create),
              ),
            ),

            Container(
              color: Colors.grey,
              height: 70,
              child: TabBar(
                labelColor: Colors.red,
                controller: _tabController,
                tabs: const [
                  Tab(
                    child: Text('11'),
                  ),
                  Tab(
                    child: Text('22'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget getNumToImg2(List<int> list_lotto) {
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
            if (e <= 10) {
              ball_color = Colors.yellow;
            } else if (e > 10 && e <= 20) {
              ball_color = Colors.blue;
            } else if (e > 20 && e <= 30) {
              ball_color = Colors.red;
            } else if (e > 30 && e <= 40) {
              ball_color = Colors.black;
            } else if (e > 40 && e <= 45) {
              ball_color = Colors.green;
            }

            return SimpleShadow(
                opacity: 1,
                // Default: 0.5
                color: Colors.grey,
                // Default: Black
                offset: Offset(0, 0),
                // Default: Offset(2, 2)
                sigma: 4,
                // Default: 2
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
                    opacity: 1,
                    // Default: 0.5
                    color: Colors.black,
                    // Default: Black
                    offset: Offset(0, 0),
                    // Default: Offset(2, 2)
                    sigma: 4, // Default: 2
                  ),
                ));
          },
        ),
        Container(
          width: 60,
          margin: EdgeInsets.only(left: 20),
          child: ElevatedButton(
            onPressed: () => getNumbers(list_lotto),
            child: const Text("번호 저장",
                style: TextStyle(
                  fontSize: 10,
                ),
                textAlign: TextAlign.center),
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple, // background
              onPrimary: Colors.white, // foreground
            ),
          ),
        ),
      ],
    );
  }

  getNumbers(List<int> list_lotto) async {
    print("저장버튼 눌렷드아아아아");
    print("numbers : ${list_lotto}");
    String strarry = list_lotto.join(",");

    var insertResult = await dbHelper.insertLotto(Lotto(numbers: strarry));

    List allLotto = await dbHelper.getAllLotto();
    print(allLotto.length);

    await Utils.showToast('토스트 테스트');
  }

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
}
