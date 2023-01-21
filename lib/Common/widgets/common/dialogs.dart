import 'package:flutter/material.dart';
import 'package:scanner/Common/styles/common_colors.dart';
import 'package:scanner/Common/styles/common_styles.dart';


class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
            onWillPop: () async => false,
            child: SimpleDialog(
              key: key,
              backgroundColor: Theme.of(context).primaryColor,
              children: <Widget>[
                Center(
                  child: Column(children: [
                    CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Please Wait....",
                      style:
                          CommonStyles(context: context).getWhiteNormalText(),
                      // style: TextStyle(color: Colors.white),
                    )
                  ]),
                )
              ],
            ),
          );
        });
  }

  static Future<void> showNonDismissibleLoading(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: CommonColors.lightWhite,
            children: [
              Center(
                child: Column(children: [
                  CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Please Wait....",
                    style: CommonStyles(context: context).getWhiteNormalText(),
                    //style: TextStyle(color: Colors.white),
                  )
                ]),
              )
            ],
          );
        });
  }

  static Future<void> showImage(
      BuildContext context, GlobalKey key, Widget image) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new WillPopScope(
            onWillPop: () async => true,
            child: SimpleDialog(
                key: key,
                backgroundColor: CommonColors.lightWhite,
                children: <Widget>[
                  Center(
                    child: image,
                  )
                ]),
          );
        });
  }

  static closeDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
