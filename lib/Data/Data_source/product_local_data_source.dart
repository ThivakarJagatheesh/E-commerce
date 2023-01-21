import 'package:scanner/Data/Table/product_hive.dart';
import 'package:hive/hive.dart';

abstract class ProductLocalDataSource {
  Future<void> saveProduct(ProductTable productTable);
  Future<List<ProductTable>> getProducts();
  Future<void> deleteProduct(int id);
  Future<void> updateProduct(ProductTable productTable);
  Future<bool> checkIfProduct(int id);
}

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  @override
  Future<void> deleteProduct(int id) async {
    final box = await Hive.openBox<ProductTable>('product_table');
    box.delete(id);
  }

  @override
  Future<List<ProductTable>> getProducts() async {
    final box = await Hive.openBox<ProductTable>('product_table');

    return box.values.toList();
  }

  @override
  Future<void> saveProduct(ProductTable productTable) async {
    final box = await Hive.openBox<ProductTable>('product_table');
   
    box.put(productTable.id, productTable);
   
    
  }

  @override
  Future<void> updateProduct(ProductTable productTable) async {
    final box = await Hive.openBox<ProductTable>('product_table');
    box.put(productTable.id, productTable);
  }

  @override
  Future<bool> checkIfProduct(int id) async {
    final assetBox = await Hive.openBox<ProductTable>('product_table');
    final result = assetBox.values.where((item) => item.id == id);
    print("Result length ${result.length}");
    return result.length >0 ? true : false;
  }
}
