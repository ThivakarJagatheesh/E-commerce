import 'package:scanner/Data/Models/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:scanner/Data/Models/no_params.dart';
import 'package:scanner/Data/Table/product_hive.dart';
import 'package:scanner/Domain/Repository/product_repo.dart';
import 'package:scanner/Domain/Usecase/usecase.dart';

class GetProductLocalUsecase extends Usecase<List<ProductTable>,NoParams>{
  final ProductRepository productRepository;
  GetProductLocalUsecase(this.productRepository);
  @override

  Future<Either<AppError, List<ProductTable>>> call(NoParams params) async{
   return await productRepository.getProductListLocal();
  }

}