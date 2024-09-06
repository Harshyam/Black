import 'package:black/core/providers/ApiProvider.dart';
import 'package:black/domain/productModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
            child: Column(
              children: [
                Image.network(
                  productModel.image ?? '',
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Text(
                  productModel.title ?? '',
                  style: const TextStyle(color: Colors.black),
                ),
                InkWell(
                  child: const ColoredBox(
                    color: Colors.green,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Add to cart"),
                    ),
                  ),
                  onTap: () {
                    Provider.of<ApiProvider>(context, listen: false)
                        .addProductToCart(productModel);
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
