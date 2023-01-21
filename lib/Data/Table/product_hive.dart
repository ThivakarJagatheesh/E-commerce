import 'package:hive/hive.dart';
import 'package:scanner/Data/Models/products.dart';
part 'product_hive.g.dart';

@HiveType(typeId: 0)
class ProductTable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final double? price;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? electronices;
  @HiveField(5)
  final String? jewellery;
  @HiveField(6)
  final String? mensClothing;
  @HiveField(7)
  final String? womensClothing;
  @HiveField(8)
  final String? image;
  @HiveField(9)
  final double? rating;
  @HiveField(10)
  final int? count;

  ProductTable(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.electronices,
      this.jewellery,
      this.mensClothing,
      this.womensClothing,
      this.image,
      this.count,
      this.rating});

  factory ProductTable.fromTable(Product product) {
    return ProductTable(
        id: product.id,
        title: product.title,
        price: product.price,
        description: product.description,
        electronices: product.category!,
        jewellery: product.category!,
        mensClothing: product.category!,
        womensClothing: product.category!,
        image: product.image,
        count: product.rating!.count,
        rating: product.rating!.rate);
  }
}
