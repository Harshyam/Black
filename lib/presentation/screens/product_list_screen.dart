import 'package:black/core/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryId});

  final String categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CategoryProvider>(context, listen: false)
        .getProductByCategoryId(id: widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Consumer<CategoryProvider>(
        builder: (context, value, child) => ListView.builder(
          shrinkWrap: true,
          itemCount: value.productsByCategoryId.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Image.network(
                          value.productsByCategoryId[index].image ?? '',
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Text(
                          value.productsByCategoryId[index].title ?? '',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
