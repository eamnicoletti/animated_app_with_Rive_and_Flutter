import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'info_card.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 0.80,
        height: double.infinity,
        color: const Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            children: const [
              InfoCard(
                name: "Emilio Nicoletti",
                profession: "Coder",
              )
            ],
          ),
        ),
      ),
    );
  }
}
