import 'package:flutter/material.dart';
import 'package:scanner/Data/Models/products.dart';

import 'cart_form.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: CartPageForm());
  }
}
