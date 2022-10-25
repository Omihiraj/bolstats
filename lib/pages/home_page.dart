import 'package:flutter/material.dart';

import '../components/components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              userName: "Wouter"),
          SizedBox(
            height: screenWidth * 0.08,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                displaySummery(
                    width: screenWidth,
                    height: 60,
                    summeryName: 'Omzet',
                    value: "€ 800",
                    percentage: 5,
                    chartColor: const Color(0xFF8973FC)),
                displaySummery(
                    width: screenWidth,
                    height: 60,
                    summeryName: 'Bestellingen',
                    value: "20",
                    percentage: 25,
                    chartColor: Color(0xFF79C4FA)),
              ],
            ),
          ),
          SizedBox(
            height: screenWidth * 0.04,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                itemQtyDisplay(
                    width: screenWidth,
                    height: 60,
                    qtyName: "Verkopen",
                    qty: 34,
                    imgPath: "assets/box-icons/varkopen-1.png"),
                itemQtyDisplay(
                    width: screenWidth,
                    height: 60,
                    qtyName: "Openstaand",
                    qty: 40,
                    imgPath: "assets/box-icons/openstaand.png")
              ],
            ),
          )
        ],
      ),
    );
  }
}
