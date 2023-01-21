import 'package:scanner/Data/Models/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:scanner/Data/Models/products.dart';
import 'package:scanner/Domain/Entities/product_params.dart';
import 'package:scanner/Domain/Repository/product_repo.dart';
import 'package:scanner/Domain/Usecase/usecase.dart';

class ProductListUsecase extends Usecase<List<Product>, ProductParams> {
  final ProductRepository productRepository;
  ProductListUsecase(this.productRepository);
  @override
  Future<Either<AppError, List<Product>>> call(ProductParams params) async =>
      await productRepository.getAllProducts(params.limit, params.category);
}
