import 'package:flutter/material.dart';

import '../components/components.dart';
import '../constants/constants.dart';
import '../models/product.dart';
import '../services/product_api.dart';

class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          headerRow(
              img: "assets/box-icons/notification.png",
              width: screenWidth,
              pageName: "VOORRAAD"),
          SizedBox(height: screenWidth * 0.08),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "PRODUCT",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: primaryFontColor),
                ),
                Text("VOORRAD",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: primaryFontColor))
              ],
            ),
          ),
          SizedBox(height: screenWidth * 0.08),
          SizedBox(
            height: 500,
            child: FutureBuilder<List<Product>>(
                future: ProductApi.getOpenProducts(context),
                builder: (context, snapshot) {
                  final products = snapshot.data;
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(child: CircularProgressIndicator());
                    default:
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return const Center(
                          child: Text(
                            "No Products Found",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: products!.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return productBox(
                                  width: screenWidth,
                                  qty: product.productQty,
                                  pName: product.productName,
                                  pImg: product.productImg,
                                  pPrice: product.productPrice);
                            });
                      }
                  }
                }),
          )
        ],
      ),
    );
  }
}
