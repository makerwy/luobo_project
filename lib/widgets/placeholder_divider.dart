import 'package:flutter/material.dart';
import 'package:luobo_project/const/app_theme.dart';

class PlaceholderDivider extends Divider {
  const PlaceholderDivider.space({
    Key? key,
    double? height,
  }) : super(
            key: key,
            height: height,
            thickness: height,
            color: Colors.transparent);
  const PlaceholderDivider.color({
    Key? key,
    double? height,
    Color? color,
  }) : super(
          key: key,
          height: height,
          thickness: height,
          color: color,
        );
}

class LineDivider extends Divider {
  const LineDivider.line({
    Key? key,
    double? height = 0.5,
    Color? color = LBColors.line,
  }) : super(
          key: key,
          height: height,
          thickness: height,
          color: color,
        );
}
