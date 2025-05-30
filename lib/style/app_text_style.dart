import 'package:flutter/material.dart';

abstract class AppTextStyle {
  TextStyle get titleSmBold;
  TextStyle get titleLgBold;
  TextStyle get titleMdMedium;
  TextStyle get bodyLgBold;
  TextStyle get bodyMdMedium;
  TextStyle get bodyLgMedium;
}

class SmallTextStyle extends AppTextStyle {
  @override
  TextStyle get bodyLgBold =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

  @override
  TextStyle get bodyLgMedium =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

  @override
  TextStyle get bodyMdMedium =>
      TextStyle(fontSize: 12, fontWeight: FontWeight.w500);

  @override
  TextStyle get titleLgBold =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

  @override
  TextStyle get titleMdMedium =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

  @override
  TextStyle get titleSmBold =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
}

class LargeTextStyle extends AppTextStyle {
  @override
  TextStyle get bodyLgBold =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  TextStyle get bodyLgMedium =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  @override
  TextStyle get bodyMdMedium =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

  @override
  TextStyle get titleLgBold =>
      TextStyle(fontSize: 32, fontWeight: FontWeight.bold);

  @override
  TextStyle get titleMdMedium =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  TextStyle get titleSmBold =>
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
}
