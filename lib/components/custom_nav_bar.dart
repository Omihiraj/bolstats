import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomNavBar extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;
  const CustomNavBar({
    Key? key,
    required this.index,
    required this.onChangedTab,
  }) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          boxShadow: [
            //BoxShadow
            BoxShadow(
              color: Color.fromARGB(255, 231, 231, 231),
              offset: Offset(
                0,
                -10.0,
              ),
              blurRadius: 30.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            tabItem(
                index: 0,
                img: "assets/icons/home.png",
                imgActive: "assets/icons/home-active.png"),
            tabItem(
                index: 1,
                img: "assets/icons/orders.png",
                imgActive: "assets/icons/orders-active.png"),
            tabItem(
                index: 2,
                img: "assets/icons/statistics.png",
                imgActive: "assets/icons/statistics-active.png"),
            tabItem(
                index: 3,
                img: "assets/icons/stock.png",
                imgActive: "assets/icons/stock-active.png"),
            tabItem(
                index: 4,
                img: "assets/icons/setting.png",
                imgActive: "assets/icons/setting-active.png"),
          ]),
        ),
      ),
    );
  }

  Widget tabItem(
      {required int index, required String img, required String imgActive}) {
    final isSelected = index == widget.index;

    return InkWell(
      onTap: () => widget.onChangedTab(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 28,
            height: 28,
            child: isSelected ? Image.asset(imgActive) : Image.asset(img),
          ),
          const SizedBox(
            height: 8,
          ),
          isSelected
              ? Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
