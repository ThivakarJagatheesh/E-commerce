import 'package:flutter/material.dart';
import 'package:scanner/Data/Models/products.dart';

import 'product_detail_form.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({ Key? key,required this.product }) : super(key: key);
final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ProductDetailForm(product: product,),
    );
  }
}