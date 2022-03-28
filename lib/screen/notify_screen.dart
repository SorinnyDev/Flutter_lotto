import 'package:flutter/material.dart';

class NotifyScreen extends StatefulWidget {
  const NotifyScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NotifyScreen();
  }
}

class _NotifyScreen extends State<NotifyScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Notify Screen"),
    );
  }
}
