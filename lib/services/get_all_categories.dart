import 'dart:convert';
import 'package:http/http.dart';

import '../helper/api.dart';


class AllCategoriesServicse{

  Future<List<String>> getAllcategories() async {
    List<String> data= await Api().get(url: 'https://fakestoreapi.com/products/categories');
      return data;

  }
}