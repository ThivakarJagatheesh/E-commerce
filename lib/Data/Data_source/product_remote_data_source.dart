import 'package:scanner/Data/Config/api_client.dart';
import 'package:scanner/Data/Config/app_constants.dart';
import 'package:scanner/Data/Models/products.dart';

final productUrl = AppConstants.baseUrl;

abstract class ProductRemoteDataSource {
  Future<List<Product>> getAllProducts(int? limit, String? category);
  Future<List<Product>> getAllProductsWithLimits(int? limit);
  Future<List<Product>> getAllProductsForCategory();
  Future<List<Product>> getAllProductForCategoryWithJewellery();
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final ApiClient apiClient;
  ProductRemoteDataSourceImpl(this.apiClient);
  @override
  Future<List<Product>> getAllProductForCategoryWithJewellery() async {
    Map<String, String> headers = {
      "Accept": "application/json",
      'Content-Type': 'application/json'
    };
    final response = await apiClient
        .getMethod('$productUrl/products/category/jewelery', headers: headers);
    return productFromJson(response);
  }

  @override
  Future<List<Product>> getAllProducts(int? limits, String? category) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      'Content-Type': 'application/json'
    };
    dynamic response;
    if (limits != null) {
      response = await apiClient.getMethod('$productUrl/products?limit=$limits',
          headers: headers);
    } else if (category != null) {
      response = await apiClient.getMethod(
          '$productUrl/products/category/${category.toLowerCase()}',
          headers: headers);
    } else {
      response =
          await apiClient.getMethod('$productUrl/products', headers: headers);
    }

    return productFromJson(response);
  }

  @override
  Future<List<Product>> getAllProductsForCategory() async {
    Map<String, String> headers = {
      "Accept": "application/json",
      'Content-Type': 'application/json'
    };
    final response = await apiClient
        .getMethod('$productUrl/products/categories', headers: headers);
    return productFromJson(response);
  }

  @override
  Future<List<Product>> getAllProductsWithLimits(int? limit) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      'Content-Type': 'application/json'
    };
    final response = await apiClient
        .getMethod('$productUrl/products?limit=$limit', headers: headers);
    return productFromJson(response);
  }
}
