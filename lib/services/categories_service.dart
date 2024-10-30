import 'dart:convert';

import '../helper/api.dart';
import '../models/product_model.dart';
import 'package:http/http.dart' as http;

class CategoriesService{
  Future<List<ProductModel>> getCategoriesProducts({required String categoryName}) async {
    List<dynamic> data=
    await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');

      List<ProductModel> productlist = [];
      for (int i = 0; i < data.length; i++) {
        productlist.add(ProductModel.fromJson(data[i]));
      }
      return productlist;
  }
}