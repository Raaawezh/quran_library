import 'package:flutter/material.dart';

abstract final class StaticMainColors {
  static const Color primaryColor = Color(0xff00A991);
  static const Color primaryColorDark = Color(0xff008774);
  static const Color primaryColorActive = Color(0xff009883);
  static const Color bgLight = Color(0xffFCFDFD);
  static const Color bgLightActive = Color(0xffB0E4DD);
  static const Color iconColor = Color(0xff898A8A);
  static const Color lightSimple = bgLightActive;
  static const Color grey1 = Color(0xff333333);
  static const Color grey3 = iconColor;
  // static const Color grey3 = Color(0xff828282);
  static const Color grey6 = Color(0xffF2F2F2);
}

abstract final class StaticMainStyleObjects {
  ///////// ----- /////////
  static BoxDecoration generalRoundedBoxWithShadow = BoxDecoration(
      color: Colors.white,
      borderRadius:
          BorderRadius.circular(StaticMeasureValues.generalBorderRadius),
      boxShadow: [
        BoxShadow(
            spreadRadius: 0,
            blurRadius: 12,
            offset: Offset(0, 2),
            color: Colors.black.withValues(alpha: .08))
      ]);

  ///////// ----- /////////
  static BoxDecoration roundedBoxWithGreyBackground = BoxDecoration(
    color: StaticMainColors.grey6,
    borderRadius:
        BorderRadius.circular(StaticMeasureValues.generalBorderRadius),
  );

  ///////// ----- /////////
  static EdgeInsetsGeometry pageHorizontalPadding =
      const EdgeInsets.symmetric(horizontal: 25);

  ///////// ----- /////////
  static const TextStyle greyColorTextTheme =
      TextStyle(color: StaticMainColors.grey1, fontSize: 18);
}

abstract final class StaticGradients {
  static const LinearGradient primaryLinearGradient = LinearGradient(
    colors: [
      StaticMainColors.primaryColorDark,
      StaticMainColors.primaryColor,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient primaryLinearGradientTransformed = LinearGradient(
    transform: GradientRotation(-40),
    colors: [
      StaticMainColors.primaryColorDark,
      StaticMainColors.primaryColor,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

abstract final class StaticMeasureValues {
  static const double navBarBorderRadius = 22;
  static const double generalBorderRadius = 6;
}

const String baseUrl = 'https://8t1dl6fk-7088.euw.devtunnels.ms';

abstract final class StaticImportantLinks {
  static const mainAudioLink = "";
  static const secondaryAudioLink = "";
}
