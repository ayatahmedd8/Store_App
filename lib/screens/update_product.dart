import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_apps/models/product_model.dart';
import 'package:store_apps/services/update_product.dart';
import 'package:store_apps/widgets/Custom_text_form_fieldd.dart';
import 'package:store_apps/widgets/Custombutton.dart';


class UpdateProduct extends StatefulWidget{

  static String id ='update product';

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? ProductName,desc,image;

  String? price;
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    ProductModel product=ModalRoute.of(context)!.settings.arguments as ProductModel;
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Update Product',
                style: TextStyle(
                  color: Colors.black
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 100,),
                    CustomTextFieldd(
                      onChanged: (data){
                        ProductName=data;
                      },
                      hintText: 'Product Name',
                    ),
                    SizedBox(height: 10,),
                    CustomTextFieldd(
                      onChanged: (data){
                        desc=data;
                      },
                      hintText: 'description',
                    ),
                    SizedBox(height: 10,),
                    CustomTextFieldd(
                      inputType: TextInputType.number,
                      onChanged: (data){
                        price=data;
                      },
                      hintText: 'Price',
                    ),
                    SizedBox(height: 10,),
                    CustomTextFieldd(
                      onChanged: (data){
                        image=data;
                      },
                      hintText: 'image',
                    ),
                    SizedBox(height: 70,),
                    CustomButton(
                        text: 'Update',
                        onpressed: () async{
                           isLoading=true;
                            setState(() {});
                            try {
                             await UpdateProductService().updateProduct(
                                  id: product.id,
                                  title: ProductName==null ? product.title :ProductName!,
                                  price: price ==null ? product.price.toString() : price!,
                                  desc: desc==null ? product.description : desc!,
                                  image: image==null ? product.image : image!,
                                  category: product.category);
                            }catch(e){
                              print(e.toString());
                            }
                           isLoading = false;
                           setState(() {});
                        })
                  ],
                ),
              ),
            ),
          ),
        );
  }
}