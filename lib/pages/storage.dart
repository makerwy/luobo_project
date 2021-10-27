import 'package:flutter/material.dart';
import 'package:luobo_project/generated/l10n.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({Key? key}) : super(key: key);

  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).storage),
      ),
      body: Center(
        child: Text(
          S.of(context).storage,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
