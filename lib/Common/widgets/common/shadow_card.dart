import 'package:flutter/material.dart';

import 'responsive_padding.dart';

class ShadowCardWidget extends StatelessWidget {
  ShadowCardWidget(
      { this.outerPadHorizontal,
       this.outerPadVertical,
       this.paddingHorizontal,
       this.paddingVertical,
      required this.child,
      required this.onPressItem});

  final double? outerPadHorizontal;
  final double? outerPadVertical;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final Widget child;
  final VoidCallback onPressItem;

  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        child: Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(const Radius.circular(0.0)),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black45,
                  //blurRadius: 10.0,
                  //offset: Offset(0.0, 4.0)
                ),
              ],
            ),
            child: TextButton(
                // padding: const EdgeInsets.all(0.0),
                child: ResponsivePadding(
                    padding: EdgeInsets.symmetric(
                        horizontal: paddingHorizontal??10,
                        vertical: paddingVertical??10),
                    child: child),
                onPressed: onPressItem)));
  }
}
