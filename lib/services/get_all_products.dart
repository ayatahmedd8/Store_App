import 'dart:convert';

import 'package:http/http.dart';
import 'package:store_apps/helper/api.dart';
import '../models/product_model.dart';

 class GetAllProducts{
   Future<List<ProductModel>> getAllProducts() async {
     List<dynamic> data=
                 await Api().get(url: 'https://fakestoreapi.com/products');

       List<ProductModel> productlist = [];
       for (int i = 0; i < data.length; i++) {
         productlist.add(ProductModel.fromJson(data[i]));
       }
       return productlist;
   }
}