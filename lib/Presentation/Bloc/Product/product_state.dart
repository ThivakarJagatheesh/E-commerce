part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductFailure extends ProductState {
  final String message;
  ProductFailure(this.message);
  @override
  List<Object> get props => [message];
}

class ProductListState extends ProductState {
  final List<Product> product;
  ProductListState(this.product);
  @override
  List<Object> get props => [product];
}

class ProductListWithCategoryState extends ProductState {
  final List<Product> product;
  ProductListWithCategoryState(this.product);
  @override
  List<Object> get props => [product];
}

class GetProductListLocalState extends ProductState {
  final List<ProductTable> product;
  GetProductListLocalState(this.product);
  @override
  List<Object> get props => [product];
}

class SaveProductListLocalState extends ProductState {
  SaveProductListLocalState();
  @override
  List<Object> get props => [];
}
class RemoveProductLocalState extends ProductState {
  RemoveProductLocalState();
  @override
  List<Object> get props => [];
}