import 'package:flutter/material.dart';
import 'package:scanner/Common/styles/common_colors.dart';
import 'package:scanner/Common/styles/common_styles.dart';


class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [CommonColors.pink, CommonColors.pink],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          child:Image.asset('images/starno.png',fit: BoxFit.cover,alignment: Alignment.center,)),
          SizedBox(height: 10,),
      Text('',
          style: CommonStyles(context: context).getDarkGraySmallText()),
    ]);
  }
}
