import 'package:black/core/providers/ApiProvider.dart';
import 'package:black/core/providers/category_provider.dart';
import 'package:black/presentation/product/product_card.dart';
import 'package:black/presentation/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CategoryProvider>(context, listen: false).fetchAllCategories();
    Provider.of<ApiProvider>(context, listen: false).productApi();
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight =
        MediaQuery.of(context).size.height * 0.24; // 10% of screen height
    return Scaffold(
      backgroundColor: const Color(0xFFE3F3FF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AppBar(
          backgroundColor: Colors.black,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0), // Adds some horizontal padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/homeScreen/Menu.png",
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Image.asset(
                      "assets/B_logo.png",
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Image.asset(
                      "assets/homeScreen/Notification.png",
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ), // Adds spacing between the logo and search bar
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0), // Adds padding around the search bar
                child: SizedBox(
                  height: 45.0, // Set the desired height here
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          color: Colors.white, // Focused border color
                          width: 2.0, // Width of the focused border
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Explore Categories",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Consumer<CategoryProvider>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 10),
                    child: SizedBox(
                      height: 40,
                      child: ListView.builder(
                        itemCount: value.categoryList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductListScreen(
                                      categoryId: value.categoryList[index].id),
                                ),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 06, left: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white.withOpacity(.2),
                                ),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 14, left: 14),
                                  child: Text(
                                    value.categoryList[index].name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      body: Consumer<ApiProvider>(
        builder: (context, value, child) => ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: value.productList.length,
          itemBuilder: (context, index) {
            return ProductCard(
              productModel: value.productList[index],
            );
          },
        ),
      ),
    );
  }
}
