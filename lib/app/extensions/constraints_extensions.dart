import 'package:flutter/material.dart';

extension ConstraintsExtensions on BoxConstraints {
  bool get isSmallDevice => maxWidth < 500;
}
