import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgetpsw_controller.dart';

class ForgetpswView extends GetView<ForgetpswController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ForgetpswView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ForgetpswView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
