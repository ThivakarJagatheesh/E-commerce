// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    Product({
         this.id,
         this.title,
         this.price,
         this.description,
         this.category,
         this.image,
         this.rating,
    });

    final int? id;
    final String? title;
    final double? price;
    final String? description;
    final String? category;
    final String? image;
    final Rating? rating;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category:json["category"],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating!.toJson(),
    };
}

class Category {
  final String? electronics;
  final String? jewelery;
  final String? mensClothing;
  final String? womensClothing;
  Category({this.electronics,this.jewelery,this.mensClothing,this.womensClothing});
  factory Category.fromJson(Map<String,dynamic>json)=>Category(
    electronics: json['electronics'],
    jewelery: json['jewelery'],
    mensClothing: json["men's clothing"],
    womensClothing: json["women's clothing"]
  );
}



class Rating {
    Rating({
        required this.rate,
        required this.count,
    });

    final double rate;
    final int count;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
