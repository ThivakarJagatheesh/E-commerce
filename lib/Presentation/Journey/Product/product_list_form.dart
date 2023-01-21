import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:scanner/Common/Route/routes_list.dart';
import 'package:scanner/Common/styles/common_styles.dart';
import 'package:scanner/Data/Models/products.dart';
import 'package:scanner/Di/get_it.dart';
import 'package:scanner/Presentation/Bloc/Product/product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/Presentation/Journey/Product_detail/product_detail.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class ProductListForm extends StatefulWidget {
  const ProductListForm({Key? key}) : super(key: key);

  @override
  State<ProductListForm> createState() => _ProductListFormState();
}

class _ProductListFormState extends State<ProductListForm> {
  List<String> sample = [];
  ScrollController scrollController = ScrollController();
  var _filter = TextEditingController();
  late ProductCubit productCubit;
  List<Product> allProducts = [];
  List<Product> filterProductList = [];
  List<Product> searchProductList = [];
  Product product = Product();
  bool favorite = false;
  final List<String> _filters = <String>[];
  bool search = false;
  String keyword = '';
  List<String> category = [
    "MEN'S CLOTHING",
    "JEWELERY",
    "ELECTRONICS",
    "WOMEN'S CLOTHING"
  ];
  @override
  void initState() {
    super.initState();
    productCubit = getItInstance<ProductCubit>();
    productCubit.getProductList(10, null,true);
  }

  List<Product> filterProduct(String keyword) {
    return allProducts
        .where(
          (element) =>
              element.title!.toLowerCase().contains(keyword.toLowerCase()),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Infinity Box',
          style: CommonStyles(context: context).getHeaderText(),
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            child: MaterialButton(
                splashColor: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), side: BorderSide()),
                onPressed: () {
                  setState(() {
                    search = !search;
                  });
                },
                child: Text('Search',
                    style:
                        CommonStyles(context: context).getWhiteNormalText())),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: MaterialButton(
                splashColor: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), side: BorderSide()),
                onPressed: () {
                  Navigator.pushNamed(context, RouteList.cart,
                      arguments: product);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    Text('Cart',
                        style: CommonStyles(context: context)
                            .getWhiteNormalText()),
                  ],
                )),
          )
        ],
      ),
      body: BlocProvider<ProductCubit>.value(
        value: productCubit,
        child: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {
            if (state is ProductListState) {
              setState(() {
                allProducts = state.product;
                filterProductList = state.product;
              });
            }
            if (state is ProductFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text(state.message)));
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  search == false
                      ? Wrap(
                          spacing: 5.0,
                          children: category.map((
                            exercise,
                          ) {
                            return FilterChip(
                              label: Text(exercise),
                              selected: _filters.contains(exercise),
                              onSelected: (bool value) {
                                print(value);
                                setState(() {
                                  if (value) {
                                    if (!_filters.contains(exercise)) {
                                      _filters.add(exercise);
                                    }
                                  } else {
                                    _filters.removeWhere((String name) {
                                      return name == exercise;
                                    });
                                  }
                                });
                                if (exercise.toLowerCase() == "jewelery" &&
                                    value == true) {
                                  productCubit.getProductList(null, 'jewelery',true);
                                } else if (exercise.toLowerCase() ==
                                        "jewelery" &&
                                    value == false) {
                                  productCubit.getProductList(null, null,true);
                                }
                              },
                            );
                          }).toList(),
                        )
                      : Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: TextField(
                            controller: _filter,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search),
                                hintText: 'Search',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.only()),
                            onChanged: (text) {
                              if (text.isNotEmpty) {
                                setState(() {
                                  allProducts = filterProduct(text);
                                  keyword = text;
                                });
                              } else {
                                allProducts = filterProductList;
                              }
                            },
                          ),
                        ),
                  Expanded(
                    child: LazyLoadScrollView(
                      isLoading: true,
                      onEndOfPage: () {
                        
                          productCubit.getProductList(20, null,false);
                        
                      },
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 25.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 0.80,
                        padding: EdgeInsets.all(10),
                        children: allProducts
                            .map((e) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetail(product: e)));
                                    // Navigator.pushNamed(context, RouteList.productDetail,arguments: p);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      // image: DecorationImage(
                                      //     image: NetworkImage(e.image!)),
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 150,
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                                image: NetworkImage(e.image!)),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            //border: Border.all(),
                                          ),
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            e.title!,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                      /*PagewiseGridView<Product>.count(
                          pageFuture: (pageIndex) {
                            return getList(pageIndex! * 20, 20, context);
                          },
                          pageSize: 20,
                          crossAxisCount: 2,
                          mainAxisSpacing: 25.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 0.80,
                          padding: EdgeInsets.all(10),
                          controller: scrollController,
                          loadingBuilder: (context) {
                            return Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                // margin: EdgeInsets.only(bottom: 200),
                                // child: Center(
                                child: Column(children: [
                                  Container(
                                    alignment: Alignment.topCenter,
                                    //child: Center(
                                    child: CircularProgressIndicator(
                                      valueColor:
                                          new AlwaysStoppedAnimation<Color>(
                                              Colors.orange),
                                      strokeWidth: 1.5,
                                    ),
                                    // ),
                                  )
                                ]),
                              ),
                            );
                          },
                          itemBuilder: (c, p, i) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetail(product: p)));
                                // Navigator.pushNamed(context, RouteList.productDetail,arguments: p);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: NetworkImage(p.image!)),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(),
                                ),
                                // child: Text(p.title!),
                              ),
                            );
                          }),*/
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<List<Product>> getList(
      int offset, int limit, BuildContext context) async {
    return allProducts;
  }
}
