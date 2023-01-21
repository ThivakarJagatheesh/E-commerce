import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/Data/Models/no_params.dart';
import 'package:scanner/Data/Models/products.dart';
import 'package:scanner/Data/Table/product_hive.dart';
import 'package:scanner/Domain/Entities/product_params.dart';
import 'package:scanner/Domain/Usecase/Product/get_product_local_usecase.dart';
import 'package:scanner/Domain/Usecase/Product/product_list_usecase.dart';
import 'package:scanner/Domain/Usecase/Product/remove_product_local_usecase.dart';
import 'package:scanner/Domain/Usecase/Product/save_product_local_usecase.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productListUsecase, this.getProductLocalUsecase,
      this.saveProductLocalUsecase, this.removeProductFromLocal)
      : super(ProductInitial());
  final ProductListUsecase productListUsecase;
  final GetProductLocalUsecase getProductLocalUsecase;
  final SaveProductLocalUsecase saveProductLocalUsecase;
  final RemoveProductFromLocal removeProductFromLocal;
  void getProductList(int? limit, String? category,bool? loading) async {
    if(loading==true){
    emit(ProductLoading());}
    final response = await productListUsecase(
        ProductParams(limit: limit, category: category));
    emit(response.fold(
        (l) => ProductFailure(l.errorMsg), (r) => ProductListState(r)));
  }

  void saveProductLocal(Product product) async {
    emit(ProductInitial());
    ProductTable productTable = ProductTable.fromTable(product);
    final response = await saveProductLocalUsecase(productTable);
    emit(response.fold(
        (l) => ProductFailure(l.errorMsg), (r) => SaveProductListLocalState()));
  }

  void getProductLocal() async {
    //ProductTable productTable = ProductTable.fromTable(product);
    final response = await getProductLocalUsecase(NoParams());
    emit(response.fold(
        (l) => ProductFailure(l.errorMsg), (r) => GetProductListLocalState(r)));
  }

  void removeProductLocal(ProductTable product) async {
    final response = await removeProductFromLocal(product);
    emit(response.fold(
        (l) => ProductFailure(l.errorMsg), (r) => RemoveProductLocalState()));
  }
}
