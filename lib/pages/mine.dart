import 'package:flutter/material.dart';
import 'package:luobo_project/generated/l10n.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).mine),
      ),
      body: Center(
        child: Text(
          S.of(context).mine,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
