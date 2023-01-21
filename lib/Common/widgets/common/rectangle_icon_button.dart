import 'package:flutter/material.dart';
import '../../styles/common_colors.dart';
import '../../styles/common_variables.dart';

class RectangleIconButtonWidget extends StatelessWidget {
  RectangleIconButtonWidget(
      {this.isLeftIcon,
      this.isFullWidth,
      this.bgColor,
      this.textColor,
      required this.text,
      this.btnIcon,
      this.btnWidth,
      this.btnHeight,
      required this.onPressed});

  final bool? isLeftIcon;
  final bool? isFullWidth;
  final Color? bgColor;
  final Color? textColor;
  final String? text;
  final IconData? btnIcon;
  final double? btnWidth;
  final double? btnHeight;
  final Function? onPressed;

  double _getWidth(context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var btnWidth = this.btnWidth;

    if (deviceWidth >= CommonVariables.largeDeviceWidth) {
      if (this.isFullWidth == true) {
        btnWidth = btnWidth! * (deviceWidth / CommonVariables.defaultWidth);
      } else {
        btnWidth = btnWidth! * 1.3;
      }
    } else {
      btnWidth = btnWidth! * (deviceWidth / CommonVariables.defaultWidth);
    }

    return btnWidth;
  }

  double _getHeight(context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var btnHeight = this.btnHeight;
    if (deviceWidth >= CommonVariables.largeDeviceWidth) {
      btnHeight = btnHeight! * 1.3;
    }

    return btnHeight!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _getWidth(context),
      height: _getHeight(context),
      decoration: new BoxDecoration(
          borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
          border: Border.all(color: bgColor ?? CommonColors.blue),
          color: Colors.white),
      child: FlatButton.icon(
          onPressed: () {
            this.onPressed;
          },
          icon: Icon(btnIcon, size: 18.0, color: bgColor ?? Colors.white),
          label: Center(
              child: Text(text!,
                  style: TextStyle(
                      fontSize:
                          CommonVariables(context: context).getNormalFontSize(),
                      fontFamily: CommonVariables.defaultFont,
                      color: bgColor ?? Colors.white,
                      fontWeight: FontWeight.normal)))),
    );
  }
}
