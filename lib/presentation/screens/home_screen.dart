import 'package:black/core/providers/ApiProvider.dart';
import 'package:black/core/providers/category_provider.dart';
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
        MediaQuery.of(context).size.height * 0.3; // 10% of screen height
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(20.0), // Radius for bottom corners
          ),
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
                      Text(
                        "See All",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Consumer<CategoryProvider>(
                  builder: (context, value, child) {
                    return SizedBox(
                      height: 110,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductListScreen(
                                        categoryId:
                                            value.categoryList[index].id),
                                  ),
                                );
                              },
                              child: Card(
                                child: Text(value.categoryList[index].name),
                              ),
                            );
                          },
                          itemCount: value.categoryList.length,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
      body: Consumer<ApiProvider>(
        builder: (context, value, child) => ListView.builder(
          shrinkWrap: true,
          itemCount: value.productList.length,
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
                          value.productList[index].image ?? '',
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Text(
                          value.productList[index].title ?? '',
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
