import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MoreScreen();
  }
}

class _MoreScreen extends State<MoreScreen> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            color: const Color(0xffe0e0e0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          padding: EdgeInsets.all(15.0),
                          color: Colors.white,
                          child: Text(
                            '이용안내',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: const Divider(
                            height: 5,
                            indent: 10,
                            endIndent: 10,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          height: 50,
                          padding: EdgeInsets.all(15.0),
                          child: InkWell(
                              child: Text('이용약관'),
                              onTap: () {
                                launch('https://www.naver.com');
                              }),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          height: 50,
                          padding: EdgeInsets.all(15.0),
                          child: InkWell(
                              child: Text('개인정보 처리방침'),
                              onTap: () {
                                launch('https://www.naver.com');
                              }),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          padding: EdgeInsets.all(15.0),
                          color: Colors.white,
                          child: Text(
                            '기타',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: const Divider(
                            height: 5,
                            indent: 10,
                            endIndent: 10,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          height: 50,
                          padding: EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('앱 버전 정보'),
                              Text(
                                '${_packageInfo.version}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          height: 50,
                          padding: EdgeInsets.all(15.0),
                          child: InkWell(
                              child: Text('1:1 문의하기'),
                              onTap: () {
                                launch('https://www.naver.com');
                              }),
                        ),
                        //displayBottomSheet(context),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
      ],
    );
  }

  Future<Map<String, dynamic>> _getAppInfo() async {
    PackageInfo info = await PackageInfo.fromPlatform();
    return {"양파가족 버전": info.version};
  }
}
