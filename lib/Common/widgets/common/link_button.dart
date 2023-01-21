import 'package:flutter/material.dart';

import 'gradient_text.dart';


class LinkButtonWidget extends StatelessWidget {
  LinkButtonWidget({this.text, this.onTap, this.gradient});

  final Gradient? gradient;
  final String? text;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTap!();
        },
        child: new GradientText(
          text!,
          style: TextStyle(fontWeight: FontWeight.bold),
          gradient: LinearGradient(
              begin: FractionalOffset(0.4, 0.1),
              end: Alignment.bottomRight,
              colors: [
                // AppColors.primarycolor,
                // AppColors.pink,
              ]),
        ));
  }
}
