import 'package:flutter/material.dart';
import 'package:scanner/Presentation/Journey/Product/product_list_form.dart';

class ProductList extends StatelessWidget {
  const ProductList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ProductListForm(),
    );
  }
}