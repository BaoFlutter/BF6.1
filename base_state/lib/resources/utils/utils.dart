import 'package:flutter/material.dart';
roundDouble ({@required double? targetedNumber, @required int? index, })
{
  return targetedNumber!.toStringAsFixed(index!);
}