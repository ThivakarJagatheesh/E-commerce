import 'dart:io';

import 'package:scanner/Data/Data_source/product_local_data_source.dart';
import 'package:scanner/Data/Data_source/product_remote_data_source.dart';
import 'package:scanner/Data/Models/json_response_exception.dart';
import 'package:scanner/Data/Models/products.dart';
import 'package:scanner/Data/Models/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:scanner/Data/Table/product_hive.dart';
import 'package:scanner/Domain/Repository/product_repo.dart';

class ProductRepoImpl extends ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;
  final ProductLocalDataSource productLocalDataSource;
  ProductRepoImpl(this.productRemoteDataSource, this.productLocalDataSource);
  @override
  // Future<Either<AppError, List<Product>>> getAllProductForCategoryWithJewellery() {
  //   // TODO: implement getAllProductForCategoryWithJewellery
  //   throw UnimplementedError();
  // }

  @override
  Future<Either<AppError, List<Product>>> getAllProducts(
      int? limit, String? category) async {
    try {
      final response =
          await productRemoteDataSource.getAllProducts(limit, category);
      return Right(response);
    } on SocketException {
      return Left(
          AppError(AppErrorType.network, 'Server Connectivity Error!!!'));
    } on JsonResponseStatusException catch (e) {
      return Left(AppError(AppErrorType.api, e.message.toString()));
    }
  }

  @override
  Future<Either<AppError, void>> deleteProductLocal(
      ProductTable product) async {
    try {
      final response = await productLocalDataSource.deleteProduct(product.id!);
      return Right(response);
    } catch (e) {
      return Left(AppError(AppErrorType.api, 'Something Went Wrong'));
    }
  }

  @override
  Future<Either<AppError, List<ProductTable>>> getProductListLocal() async {
    try {
      final response = await productLocalDataSource.getProducts();
      return Right(response);
    } catch (e) {
      return Left(AppError(AppErrorType.api, 'Something Went Wrong'));
    }
  }

  @override
  Future<Either<AppError, void>> saveProductLocal(ProductTable product) async {
    try {
      final response = await productLocalDataSource.checkIfProduct(product.id!);
      if (!response) {
        final response = await productLocalDataSource.saveProduct(product);

        return Right(response);
      } else {
        return Left(AppError(AppErrorType.api, 'already Exist!!!'));
      }
    } catch (e) {
      return Left(AppError(AppErrorType.api, 'already Exist!!!'));
    }
  }

  @override
  Future<Either<AppError, void>> updateProductLocal(
      ProductTable product) async {
    try {
      final response = await productLocalDataSource.updateProduct(product);
      return Right(response);
    } catch (e) {
      throw Left(AppError(AppErrorType.api, ''));
    }
  }

  // @override
  // Future<Either<AppError, List<Product>>> getAllProductsForCategory() {
  //   // TODO: implement getAllProductsForCategory
  //   throw UnimplementedError();
  // }

  // @override
  // Future<Either<AppError, List<Product>>> getAllProductsWithLimits(int? limit) {
  //   // TODO: implement getAllProductsWithLimits
  //   throw UnimplementedError();
  // }
}
