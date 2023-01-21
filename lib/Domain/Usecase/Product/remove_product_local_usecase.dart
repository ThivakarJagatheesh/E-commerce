import 'package:scanner/Data/Models/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:scanner/Data/Table/product_hive.dart';
import 'package:scanner/Domain/Repository/product_repo.dart';
import 'package:scanner/Domain/Usecase/usecase.dart';

class RemoveProductFromLocal extends Usecase<void,ProductTable>{
  final ProductRepository productRepository;
  RemoveProductFromLocal(this.productRepository);
  @override
  Future<Either<AppError, void>> call(ProductTable params) async{
    return await productRepository.deleteProductLocal(params);
  }
  
}