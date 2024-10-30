import 'package:flutter/material.dart';
import 'package:store_apps/models/product_model.dart';
import 'package:store_apps/screens/update_product.dart';

class customCard extends StatelessWidget {
  customCard({
    required this.product,
    super.key,
  });

 ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProduct.id, arguments: product);
      },
      child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 40,
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0,
                        offset: Offset(10,10)
                    )]
              ),
              child:  Card(
                elevation: 10,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title.substring(0,6),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 3,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$' '${product.price.toString()}',
                            style: TextStyle(
                                fontSize: 16
                            ),
                          ),
                          Icon(Icons.favorite,color: Colors.red,)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                right: 30,
                top:-50,
                child: Image.network(
                product.image,
                  width: 100,
                  height: 100,
                )
            )
          ]
      ),
    );
  }
}
