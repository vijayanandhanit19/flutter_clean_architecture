import 'package:flutter/material.dart';
import 'color_constants.dart';
import 'size_constants.dart';

class StyleConstants {
  static const ktsTitle = TextStyle(
      color: ColorConst.kcTitle,
      fontSize: SizeConstants.kdNumber20,
      fontWeight: FontWeight.w700);

  static const ktsSubTitleStyle = TextStyle(
    color: ColorConst.kcTitle,
    fontSize: SizeConstants.kdNumber16,
  );

  static const ktsPrimary = TextStyle(
    color: ColorConst.kcPrimary,
    fontSize: SizeConstants.kdNumber12,
  );
}
