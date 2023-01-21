import 'package:flutter/material.dart';

import './responsive_padding.dart';
import '../../styles/common_variables.dart';
import '../../styles/common_colors.dart';

class TitleWidget extends StatelessWidget {
  TitleWidget({
    this.text,
    this.paddingTop,
    this.paddingLeft,
    this.paddingRight,
    this.paddingBottom,
    this.alignment=MainAxisAlignment.start
  });

  final String? text;
  final double ?paddingTop;
  final double ?paddingBottom;
  final double? paddingRight;
  final double ?paddingLeft;
  final MainAxisAlignment? alignment;
  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: alignment!,
      children: <Widget>[
        ResponsivePadding(
          padding: EdgeInsets.only(top: paddingTop!, left: paddingLeft!, right: paddingRight!, bottom: paddingBottom!),
          child:  Text(
            text!,
            style: TextStyle(
              fontSize: CommonVariables(context: context).getLargeFontSize(),
              color: CommonColors.black,
              fontFamily: 'SanFransisco'
            ),
          ),
        ),
      ],
    );
  }
}
