import 'package:flutter/material.dart';

import '../components/components.dart';
import '../constants/constants.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  int status = 1;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          headerRow(
              img: "assets/box-icons/notification.png",
              width: screenWidth,
              pageName: "STATISTIEKEN"),
          SizedBox(height: screenWidth * 0.08),
          topTapBar(
              firstBtn: "Deze Week",
              secondBtn: "Deze Maand",
              width: screenWidth),
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
                    value: "€ 2.4k",
                    percentage: 5,
                    chartColor: const Color(0xFF8973FC)),
                displaySummery(
                    width: screenWidth,
                    height: 60,
                    summeryName: 'Bestellingen',
                    value: "1436",
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
                    qty: 1560,
                    imgPath: "assets/box-icons/varkopen-1.png"),
                itemQtyDisplay(
                    width: screenWidth,
                    height: 60,
                    qtyName: "Retours",
                    qty: 25,
                    imgPath: "assets/box-icons/retours.png")
              ],
            ),
          ),
          SizedBox(
            height: screenWidth * 0.04,
          ),
          statiticsChart(
              color: Color(0xFF79C4FA), width: screenWidth, chartName: "Omzet"),
          SizedBox(
            height: screenWidth * 0.04,
          ),
          statiticsChart(
              color: Color(0xFF79C4FA),
              width: screenWidth,
              chartName: "Bestellingen")
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
