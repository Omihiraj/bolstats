import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../constants/constants.dart';

const double innerBoxPad = 10.0;
final List<Color> gradientColor = [const Color(0xFF8973FC), Colors.white];
Widget displaySummery(
    {required String summeryName,
    required String value,
    required double percentage,
    required double width,
    required double height,
    required Color chartColor}) {
  return Container(
      width: width * 0.44,
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
      padding: const EdgeInsets.all(innerBoxPad),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(summeryName,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF011633))),
          const SizedBox(
            height: 10,
          ),
          Text(
            value,
            style: const TextStyle(
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xFF011633)),
          )
        ]),
        Column(children: [
          Row(
            children: [
              Icon(
                Icons.arrow_upward,
                color: chartColor,
                size: 12,
              ),
              Text(
                "$percentage%",
                style: TextStyle(
                  color: chartColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(
              width: 70, height: 30, child: summeryChart(color: chartColor))
        ])
      ]));
}

Widget itemQtyDisplay(
    {required String qtyName,
    required int qty,
    required String imgPath,
    required double width,
    required double height}) {
  return Container(
      width: width * 0.44,
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
      padding: const EdgeInsets.all(innerBoxPad),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            qtyName,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              color: Color(0xFF011633),
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "$qty",
            style: const TextStyle(
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xFF011633)),
          )
        ]),
        Image.asset(
          imgPath,
          width: 40,
          height: 40,
        )
      ]));
}

Widget productBox(
    {required String pImg,
    required String pName,
    String? pId,
    required double pPrice,
    required double width,
    int? qty}) {
  return Padding(
    padding: EdgeInsets.only(
      left: width * 0.04,
      right: width * 0.04,
      bottom: width * 0.04,
    ),
    child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
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
        padding: const EdgeInsets.all(15),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Image.asset(
                pImg,
                width: 50,
                height: 50,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                width: width * 0.04,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  pName,
                  style: const TextStyle(
                      color: primaryFontColor, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: width * 0.02,
                ),
                qty != null
                    ? Text("Price: €$pPrice",
                        style: const TextStyle(
                            color: primaryFontColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 12))
                    : Text(
                        pId!,
                        style: const TextStyle(
                            color: primaryFontColor,
                            fontWeight: FontWeight.w300),
                      )
              ]),
            ],
          ),
          qty != null
              ? Text("$qty",
                  style: const TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18))
              : Text(
                  "€ $pPrice",
                  style: const TextStyle(
                      color: primaryColor, fontWeight: FontWeight.w600),
                )
        ])),
  );
}

Widget summeryChart({required Color color}) {
  return LineChart(LineChartData(
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        show: false,
      ),
      lineBarsData: [
        LineChartBarData(
            spots: const [
              FlSpot(0, 3),
              FlSpot(2.6, 2),
              FlSpot(4.9, 5),
              FlSpot(6.8, 2.5),
              FlSpot(8, 4),
              FlSpot(9.5, 3),
              FlSpot(11, 6),
            ],
            isCurved: true,
            barWidth: 2,
            color: color,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.5),
                  color.withOpacity(0.05),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.repeated,
              ),
            ))
      ]));
}

Widget headerRow({
  String? pageName,
  required String img,
  String? userName,
  required double width,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
    child: SizedBox(
      width: width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        userName != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welkom therug,",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF011633)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text("$userName 👋",
                      style: const TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF011633)))
                ],
              )
            : Text(pageName!,
                style: const TextStyle(
                    fontFamily: 'Outfit',
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF011633))),
        Image.asset(
          img,
          width: 25,
          height: 25,
        )
      ]),
    ),
  );
}

Widget statiticsChart(
    {required Color color, required double width, required String chartName}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
    child: Container(
      padding: const EdgeInsets.only(top: 20, bottom: 15, left: 15, right: 15),
      width: width,
      height: 260,
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
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(chartName,
              style: const TextStyle(
                  color: primaryFontColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18)),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: LineChart(LineChartData(
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 6,
                gridData: FlGridData(show: true, drawVerticalLine: false),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                  leftTitles: AxisTitles(
                    sideTitles: _leftTitles,
                  ),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 3),
                      FlSpot(2.6, 2),
                      FlSpot(4.9, 5),
                      FlSpot(6.8, 2.5),
                      FlSpot(8, 4),
                      FlSpot(9.5, 3),
                      FlSpot(11, 6),
                    ],
                    isCurved: true,
                    barWidth: 3,
                    color: color,
                    dotData: FlDotData(show: false),
                  )
                ])),
          ),
        ],
      ),
    ),
  );
}

SideTitles get _bottomTitles => SideTitles(
      showTitles: true,
      getTitlesWidget: (value, meta) {
        String text = '';
        switch (value.toInt()) {
          case 0:
            text = 'Mon';
            break;
          case 3:
            text = 'Tue';
            break;
          case 5:
            text = 'Wed';
            break;
          case 7:
            text = 'Thu';
            break;
          case 9:
            text = 'Fri';
            break;
          case 11:
            text = 'Sat';
            break;
        }

        return Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w400),
        );
      },
    );

SideTitles get _leftTitles => SideTitles(
      reservedSize: 50,
      showTitles: true,
      getTitlesWidget: (value, meta) {
        String text = '';
        switch (value.toInt()) {
          case 0:
            text = '€0';
            break;
          case 1:
            text = '€500';
            break;
          case 2:
            text = '€1.5K';
            break;
          case 3:
            text = '€2.5K';
            break;
          case 4:
            text = '€3.5K';
            break;
          case 5:
            text = '€4.5K';
            break;
        }

        return Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w400),
        );
      },
    );

class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key});

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      activeColor: primaryColor,
      width: 50.0,
      height: 27.0,
      value: isSwitched,
      borderRadius: 20.0,
      onToggle: (val) {
        setState(() {
          isSwitched = val;
        });
      },
    );
  }
}

Widget settingsBar({required String settingName, required double width}) {
  return Padding(
    padding: EdgeInsets.only(
        left: width * 0.04, right: width * 0.04, bottom: width * 0.04),
    child: Container(
        padding: const EdgeInsets.all(innerBoxPad * 1.5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 231, 231, 231),
                offset: Offset(
                  0,
                  10.0,
                ),
                blurRadius: 30.0,
                spreadRadius: 0.0,
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(settingName,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
            const ToggleSwitch(),
          ],
        )),
  );
}
