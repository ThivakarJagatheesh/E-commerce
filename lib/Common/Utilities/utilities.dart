import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utilities {
  static void waitingForServer(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(
                  color: Colors.teal,
                ),
                SizedBox(
                  width: 20,
                ),
                Text('Please Wait')
              ],
            ),
          );
        });
  }

  static String getCurrency(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    var format = NumberFormat.simpleCurrency(locale: locale.toString());
    print("CURRENCY SYMBOL ${format.simpleCurrencySymbol('IN')}"); // $
    print("CURRENCY NAME ${format.currencyName}");
    return format.simpleCurrencySymbol('₹'); // USD
  }
}
