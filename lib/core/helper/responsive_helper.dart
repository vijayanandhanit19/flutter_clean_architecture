import 'package:flutter/material.dart';

import '../constants/size_constants.dart';

class ResponsiveHelper {
  static Size defaultSize =
      const Size(SizeConstants.kdScreenWidth, SizeConstants.kdScreenHeight);

  static Size maxSize = const Size(
      SizeConstants.kdMaxScreenWidth, SizeConstants.kdMaxScreenHeight);
  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenWidth(BuildContext context) {
    return screenSize(context).width;
  }

  static double screenHeight(BuildContext context) {
    return screenSize(context).height;
  }

  static double responsiveWidth(BuildContext context, double width) {
    double percent = calculateWidthPercent(context, width);
    double responsiveWidth = screenWidth(context) < maxSize.width
        ? screenWidth(context) * percent
        : maxSize.width * percent;

    return responsiveWidth;
  }

  static double responsiveHeight(BuildContext context, double height) {
    double percent = calculateHeightPercent(context, height);
    double responsiveHeight = screenWidth(context) < maxSize.width
        ? screenHeight(context) * percent
        : maxSize.height * percent;

    return responsiveHeight;
  }

  static double calculateWidthPercent(BuildContext context, double width) {
    return width / defaultSize.width;
  }

  static double calculateHeightPercent(BuildContext context, double height) {
    return height / defaultSize.height;
  }

  static double calculateFontSize(BuildContext context, double fontSize) {
    double textScaleFactor = screenWidth(context) < maxSize.width
        ? screenWidth(context) / defaultSize.width
        : maxSize.width / defaultSize.width;

    double spFontSize = fontSize * textScaleFactor;
    return spFontSize;
  }
}
