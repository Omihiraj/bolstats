import 'package:bolstats/constants/constants.dart';
import 'package:bolstats/pages/home_page.dart';
import 'package:bolstats/pages/orders_page.dart';
import 'package:bolstats/pages/settings_page.dart';
import 'package:bolstats/pages/statistics_page.dart';
import 'package:bolstats/pages/stock_page.dart';
import 'package:flutter/material.dart';
import 'components/custom_nav_bar.dart';

class PageHandler extends StatefulWidget {
  const PageHandler({super.key});

  @override
  State<PageHandler> createState() => _PageHandlerState();
}

class _PageHandlerState extends State<PageHandler> {
  var index = 0;
  final pages = [
    const HomePage(),
    const OrdersPage(),
    const StatisticsPage(),
    const StockPage(),
    const SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: pages[index],
      bottomNavigationBar: CustomNavBar(
        index: index,
        onChangedTab: onChangedTab,
      ),
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
