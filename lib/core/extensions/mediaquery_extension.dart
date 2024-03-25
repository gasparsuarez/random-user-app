import 'package:flutter/material.dart';

///
/// MediaQuery's sizes
///
extension SizeMediaQuery on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get aspectRatio => MediaQuery.of(this).size.aspectRatio;
}
