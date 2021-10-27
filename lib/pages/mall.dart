import 'package:flutter/material.dart';
import 'package:luobo_project/generated/l10n.dart';

class MallPage extends StatefulWidget {
  const MallPage({Key? key}) : super(key: key);

  @override
  _MallPageState createState() => _MallPageState();
}

class _MallPageState extends State<MallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).mall),
      ),
      body: Center(
        child: Text(
          S.of(context).mall,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
