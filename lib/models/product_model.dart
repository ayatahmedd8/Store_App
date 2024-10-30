// class ProductModel{
//
//   final dynamic id;
//   final String title;
//   final String description;
//   final double price;
//   final String image;
//   final String category;
//   final RatingModel? rating;
//   ProductModel(  {
//     required this.category,
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.image,
//     this.rating,
//    });
//
//    factory ProductModel.fromJson(jsonData){
//     return ProductModel(
//       id: jsonData['id'],
//       title: jsonData['title'],
//       description: jsonData['description'],
//       price: jsonData['price'],
//       image: jsonData['image'],
//       category: jsonData['category'],
//       rating: (jsonData['rate'] is int) ? (jsonData['rate'] as int).toDouble() : jsonData['rate'],
//
//      // rating: RatingModel.fromJson(jsonData['rating '])
//     );}
//
// }
// class RatingModel{
//
//   final double rate;
//   final int count;
//   RatingModel({required this.rate, required this .count});
//
//   factory RatingModel.fromJson(jsonData){
//     return RatingModel(
//       rate: jsonData['rate'],
//       count: jsonData['count']
//     );}
//
// }
class ProductModel {
  final dynamic id;
  final String title;
  final String description;
  final double price;
  final String image;
  final String category;
  final RatingModel? rating;
  bool isFavorite; // New property to track if it's a favorite

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    this.rating,
    this.isFavorite=false,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      description: jsonData['description'],
      price: (jsonData['price'] is int) ? (jsonData['price'] as int).toDouble() : jsonData['price'],
      image: jsonData['image'],
      category: jsonData['category'],
      rating: jsonData['rating'] != null ? RatingModel.fromJson(jsonData['rating']) : null,
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: (jsonData['rate'] is int) ? (jsonData['rate'] as int).toDouble() : jsonData['rate'],
      count: jsonData['count'] ?? 0,
    );
  }
}
