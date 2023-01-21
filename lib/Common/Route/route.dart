
import 'package:flutter/cupertino.dart';
import 'package:scanner/Common/Route/routes_list.dart';
import 'package:scanner/Data/Models/products.dart';
import 'package:scanner/Presentation/Journey/Cart/cart.dart';
import 'package:scanner/Presentation/Journey/Product/product_list.dart';
import 'package:scanner/Presentation/Journey/Product_detail/product_detail.dart';

class Routes{
  // 83r5^_
  static Map<String,WidgetBuilder>getRoutes(RouteSettings setting){
    return {
      RouteList.product:(context)=>ProductList(),
      RouteList.productDetail:(context)=>ProductDetail(product: setting.arguments as Product),
      RouteList.cart:(context)=>CartPage()

    };
  }
}