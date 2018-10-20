import 'package:code_challange/ui/ui_util.dart';
import 'package:flutter/material.dart';

// class will return the static image for change fly image and logo
class StaticScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: UiUtil.getAppBar("Static Screen"),
      body: UiUtil.getChangeFlyImage(),
    );
  }
}
