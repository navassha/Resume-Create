import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  double width(double width) {
    return MediaQuery.of(this).size.width * (width / 430);
  }
}
