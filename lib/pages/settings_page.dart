import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../components/components.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool status = false;
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
          settingsBar(width: screenWidth, settingName: 'Face Id voor toegang'),
          settingsBar(
              width: screenWidth,
              settingName: 'Notificatie bij nieuwe bestelling'),
          settingsBar(
              width: screenWidth, settingName: 'Notificatie bij nieuwe retour'),
          settingsBar(
              width: screenWidth, settingName: 'Notificatie bij lage voorraad'),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.04,
                right: screenWidth * 0.04,
                bottom: screenWidth * 0.04),
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
                child: const Text("Uitloggen",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFFF64141)))),
          )
        ],
      ),
    );
  }
}
