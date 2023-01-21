import 'package:scanner/Data/Models/app_error.dart';
import 'package:scanner/Data/Models/products.dart';
import 'package:dartz/dartz.dart';
import 'package:scanner/Data/Table/product_hive.dart';
abstract class ProductRepository{
   Future<Either<AppError,List<Product>>> getAllProducts(int?limit,String? category);
   Future<Either<AppError,void>>saveProductLocal(ProductTable product);
   Future<Either<AppError,void>>updateProductLocal(ProductTable product);
   Future<Either<AppError,void>>deleteProductLocal(ProductTable product);
   Future<Either<AppError,List<ProductTable>>>getProductListLocal();

  // Future<Either<AppError,List<Product>>> getAllProductsWithLimits(int? limit);
  // Future<Either<AppError,List<Product>>> getAllProductsForCategory();
  // Future<Either<AppError,List<Product>>> getAllProductForCategoryWithJewellery();
}