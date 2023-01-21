import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/Common/Utilities/utilities.dart';
import 'package:scanner/Common/styles/common_styles.dart';
import 'package:scanner/Data/Models/products.dart';
import 'package:scanner/Data/Table/product_hive.dart';
import 'package:scanner/Di/get_it.dart';
import 'package:scanner/Presentation/Bloc/Product/product_bloc.dart';

class CartPageForm extends StatefulWidget {
  const CartPageForm({
    Key? key,
  }) : super(key: key);

  @override
  State<CartPageForm> createState() => _CartPageFormState();
}

class _CartPageFormState extends State<CartPageForm> {
  late ProductCubit productCubit;
  List<ProductTable> productTableList = [];

  double totalPrice = 0.0;
  List<double> totalListPrice = [];
  @override
  void initState() {
    super.initState();
    productCubit = getItInstance<ProductCubit>();
    productCubit.getProductLocal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Tab'),
        centerTitle: true,
      ),
      body: BlocProvider<ProductCubit>.value(
        value: productCubit,
        child: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {
            if (state is GetProductListLocalState) {
              productTableList = state.product;
              for (var totat in productTableList) {
                setState(() {
                  totalPrice += totat.price!;
                });
              }
            }
            if (state is RemoveProductLocalState) {
              setState(() {
                totalPrice = 0.0;
              });
              productCubit.getProductLocal();
            }
          },
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              );
            }
            return Container(
              child: productTableList.length != 0
                  ? ListView.builder(
                      itemCount: productTableList.length,
                      itemBuilder: (c, i) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(),
                            //color: Colors.blue
                          ),
                          margin: EdgeInsets.all(3),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            productTableList[i].image!))),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width -
                                              150,
                                      child: Text(
                                        productTableList[i].title!,
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    // Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(Utilities.getCurrency(context) +
                                            ' ' +
                                            productTableList[i]
                                                .price!
                                                .toString(),  style: CommonStyles(context: context)
                                          .getOrangeNormalText(),),
                                        MaterialButton(
                                          onPressed: () {
                                            productCubit.removeProductLocal(
                                                productTableList[i]);
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.orange,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      })
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_sharp,
                            color: Colors.orange,
                            size: 80,
                          ),
                          Text('Bucket is Empty.... ')
                        ],
                      ),
                    ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Container(
          height: 50,
          alignment: Alignment.centerRight,
          child: MaterialButton(
            onPressed: () {},
            child: Text('Total Price: ${Utilities.getCurrency(context)} $totalPrice'),
          ),
        ),
      ),
    );
  }
}
