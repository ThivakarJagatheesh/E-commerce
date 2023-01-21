import 'package:flutter/material.dart';


import './common_colors.dart';
import './common_variables.dart';

class CommonStyles {
  CommonStyles({this.context});

  BuildContext ?context;

  // Text
  TextStyle getLinkText() {
    return TextStyle(
        color: Theme.of(context!).primaryColor,
        fontSize: CommonVariables(context: context!).getSmallFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.normal);
  }

  TextStyle getHeaderText() {
    return TextStyle(
        color: CommonColors.black,
        fontSize: CommonVariables(context: context!).getNormalFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.w600);
  }

  TextStyle getHeaderTextButton() {
    return TextStyle(
        color: Theme.of(context!).primaryColor,
        fontSize: CommonVariables(context: context!).getNormalFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.normal);
  }

  TextStyle getLabelText() {
    return TextStyle(
        color: CommonColors.gray,
        fontSize: CommonVariables(context: context!).getNormalFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.normal);
  }

  TextStyle getLabelSmallText() {
    return TextStyle(
        color: CommonColors.gray,
        fontSize: CommonVariables(context: context!).getNormalFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.w300);
  }

  TextStyle getBlackNormalText() {
    return TextStyle(
        color: CommonColors.black,
        fontSize: CommonVariables(context: context!).getNormalFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.normal);
  }

  /// AppBar Title theme change
  
 TextStyle getBlackTitleText() {
    return TextStyle(
        color: Colors.black87,
        fontSize: CommonVariables(context: context!).getNormalFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.w600);
  }
  TextStyle getBlackBoldText() {
    return TextStyle(
        color: CommonColors.black,
        fontSize: CommonVariables(context: context!).getNormalFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.bold);
  }

  TextStyle getDarkGrayNormalText() {
    return TextStyle(
        color: CommonColors.darkGray,
        fontSize: CommonVariables(context: context!).getNormalFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.normal);
  }

  TextStyle getDarkWhiteNormalText() {
    return TextStyle(
        color: CommonColors.white,
        fontSize: CommonVariables(context: context!).getNormalFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.normal);
  }

  TextStyle getDarkGrayNormalSemiBoldText() {
    return TextStyle(
        color: CommonColors.darkGray,
        fontSize: CommonVariables(context: context!).getNormalFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.w600);
  }

  TextStyle getGrayNormalText() {
    return TextStyle(
        color: CommonColors.gray,
        fontSize: CommonVariables(context: context!).getNormalFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.normal);
  }

  //    TextStyle getGrayLargeText() {
  //   return TextStyle(
  //     color: CommonColors.darkGray,
  //     fontSize: CommonVariables(context: context).getMediumFontSize(),
  //     fontFamily: CommonVariables.defaultFont,
  //     fontWeight: FontWeight.w600
  //   );
  // }

  TextStyle getGrayLargeText() {
    return TextStyle(
        color: CommonColors.darkGray,
        fontSize: CommonVariables(context: context!).getLargeFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.bold);
  }

  TextStyle getGraySmallText() {
    return TextStyle(
        color: CommonColors.gray,
        fontSize: CommonVariables(context: context!).getSmallFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.normal);
  }

  TextStyle getDarkGraySmallText() {
    return TextStyle(
        color: CommonColors.darkGray,
        fontSize: CommonVariables(context: context!).getSmallFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.normal);
  }

  TextStyle getBlueSmallText() {
    return TextStyle(
        color: CommonColors.blue,
        fontSize: CommonVariables(context: context!).getSmallFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.normal);
  }

  TextStyle getSplashLogoText() {
    return TextStyle(
        color: CommonColors.black,
        fontSize: CommonVariables(context: context!).getLargeFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.bold);
  }

  TextStyle getBlueNormalText() {
    return TextStyle(
        color: CommonColors.blue,
        fontSize: CommonVariables(context: context!).getNormalFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.normal);
  }

  TextStyle getyellowNormalText() {
    return TextStyle(
        color: Colors.yellow,
        fontSize: CommonVariables(context: context!).getNormalFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.normal);
  }

  TextStyle getGreenNormalText() {
    return TextStyle(
        color: Colors.green,
        fontSize: CommonVariables(context: context!).getNormalFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.normal);
  }

  TextStyle getOrangeNormalText() {
    return TextStyle(
        color: Colors.orange,
        fontSize: CommonVariables(context: context!).getNormalFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.normal);
  }
  TextStyle getOrangeTitleText() {
    return TextStyle(
        color: Colors.orange,
        fontSize: CommonVariables(context: context!).getMediumFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.w600);
  }
  TextStyle getOrangeSmallText() {
    return TextStyle(
        color: Colors.orange,
        fontSize: CommonVariables(context: context!).getNormalFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.w100);
  }

  TextStyle getOrangeLargeText() {
    return TextStyle(
        color: Colors.orange,
        fontSize: CommonVariables(context: context!).getMediumFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.w600);
  }

  TextStyle getOrangeveryLargeText() {
    return TextStyle(
        color: Colors.orange,
        fontSize: CommonVariables(context: context!).getLargeFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.w500);
  }

  TextStyle getGreenSmallText() {
    return TextStyle(
        color: Colors.green,
        fontSize: CommonVariables(context: context!).getVerySmallFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.normal);
  }

  TextStyle getRedNormalText() {
    return TextStyle(
        color: Colors.red.shade900,
        fontSize: CommonVariables(context: context!).getNormalFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.normal);
  }

  TextStyle getRedSmallText() {
    return TextStyle(
        color: Colors.red.shade900,
        fontSize: CommonVariables(context: context!).getVerySmallFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.normal);
  }

  TextStyle getWhiteNormalText() {
    return TextStyle(
        color: CommonColors.white,
        fontSize: CommonVariables(context: context!).getNormalFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.w600);
  }

  TextStyle getWhiteLargeText() {
    return TextStyle(
        color: CommonColors.white,
        fontSize: CommonVariables(context: context!).getLargeFontSize(),
        fontFamily: CommonVariables.defaultFont,
        fontWeight: FontWeight.normal);
  }

  // Box Shadow
  BoxDecoration getBoxShadow() {
    return const BoxDecoration(color: Colors.white, boxShadow: [
      const BoxShadow(
        color: Colors.black12,
        blurRadius: 10.0,
      )
    ]);
  }

  // Box Shadow
  BoxDecoration getFormShadow() {
    return const BoxDecoration(boxShadow: [
      const BoxShadow(
          color: Colors.black12, blurRadius: 4.0, offset: Offset(0.0, 0.0))
    ]);
  }
}
