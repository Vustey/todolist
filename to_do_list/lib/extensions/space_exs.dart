import 'package:flutter/widgets.dart';

extension IntExtension on int?{
  int validate({int defaultValue = 0}) {
    return this ?? defaultValue;
  } 


  Widget get h => SizedBox(height: this?.toDouble(),);
  Widget get w => SizedBox(width: this?.toDouble(),);
}