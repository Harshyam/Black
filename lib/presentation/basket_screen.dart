import 'package:black/core/providers/basket_provider.dart';
import 'package:black/presentation/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<BasketProvider>(context, listen: false).getBasketProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<BasketProvider>(
        builder: (context, value, child) {
          return value.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.basketProducts.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      productModel: value.basketProducts[index],
                    );
                  },
                );
        },
      ),
    );
  }
}
