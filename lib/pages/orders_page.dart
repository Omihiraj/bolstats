import 'package:flutter/material.dart';

import '../components/components.dart';
import '../constants/constants.dart';
import '../models/product.dart';
import '../services/product_api.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int status = 1;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          headerRow(
              img: "assets/box-icons/notification.png",
              width: screenWidth,
              pageName: "BESTTELLINGEN"),
          SizedBox(height: screenWidth * 0.04),
          topTapBar(
              firstBtn: "Openstaand",
              secondBtn: "Verzonden",
              width: screenWidth),
          SizedBox(
            height: screenWidth * 0.08,
          ),
          SizedBox(
            height: 500,
            child: FutureBuilder<List<Product>>(
                future: status == 1
                    ? ProductApi.getOpenProducts(context)
                    : ProductApi.getSentProducts(context),
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
                                  pId: product.productId,
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

  Widget topTapBar({
    required double width,
    required String firstBtn,
    required String secondBtn,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.045),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.015, vertical: width * 0.015),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 231, 231, 231),
              offset: Offset(
                0,
                10.0,
              ),
              blurRadius: 30.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        width: width,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          InkWell(
            onTap: () {
              setState(() {
                status = 1;
              });
            },
            child: Container(
              height: 43,
              width: width * 0.44,
              //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                  color: status == 1 ? primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                  child: Text(
                firstBtn,
                style: TextStyle(
                  color: status == 1 ? Colors.white : Colors.black,
                ),
              )),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                status = 2;
              });
            },
            child: Container(
              height: 43,
              width: width * 0.44,
              //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                  color: status == 2 ? primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                  child: Text(
                secondBtn,
                style: TextStyle(
                  color: status == 2 ? Colors.white : Colors.black,
                ),
              )),
            ),
          )
        ]),
      ),
    );
  }
}
