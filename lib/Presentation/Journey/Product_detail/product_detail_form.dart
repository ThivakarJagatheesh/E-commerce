import 'package:flutter/material.dart';
import 'package:scanner/Common/Route/routes_list.dart';
import 'package:scanner/Common/styles/common_styles.dart';
import 'package:scanner/Data/Models/products.dart';
import 'package:scanner/Di/get_it.dart';
import 'package:scanner/Presentation/Bloc/Product/product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/Common/Utilities/utilities.dart';

class ProductDetailForm extends StatefulWidget {
  const ProductDetailForm({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  State<ProductDetailForm> createState() => _ProductDetailFormState();
}

class _ProductDetailFormState extends State<ProductDetailForm> {
  late ProductCubit productCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productCubit = getItInstance<ProductCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteList.cart,
                  arguments: widget.product);
            },
            child: Text('Cart'),
          )
        ],
      ),
      body: BlocProvider<ProductCubit>.value(
        value: productCubit,
        child: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is SaveProductListLocalState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text('Item Add the Cart...')));
            }
            if(state is ProductFailure){
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is ProductLoading) {}
            return Container(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  widget.product.image!,
                                ),
                                fit: BoxFit.contain)),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   'Product Description',
                            //   style: TextStyle(
                            //       fontSize: 18, fontWeight: FontWeight.w600),
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      '# ' + widget.product.title!,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Text(
                                    "${Utilities.getCurrency(context)}" +
                                        " " +
                                        '${widget.product.price.toString()}',
                                    style: CommonStyles(context: context)
                                        .getOrangeNormalText(),
                                  ),
                                ],
                              ),
                            ),
                            Text('${widget.product.description.toString()}'),

                            Container(
                              width: 50,
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 18,
                                  ),
                                  Text('${widget.product.rating!.rate} '),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      left: 20,
                      bottom: 40,
                      child: MaterialButton(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(),
                              borderRadius: BorderRadius.circular(6)),
                          onPressed: () {
                            productCubit.saveProductLocal(widget.product);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.add_shopping_cart,
                                color: Colors.orange,
                                
                              ),
                              Text('Add To Cart'),
                            ],
                          )))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
