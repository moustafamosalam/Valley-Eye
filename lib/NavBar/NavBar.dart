import 'package:flutter/material.dart';
import 'package:weather_towers/NavBar/IconsList.dart';
import 'package:weather_towers/NavBar/TowerTitle.dart';

class BottonNavWithAnimatedIcons extends StatefulWidget {
  final String towerName;

  const BottonNavWithAnimatedIcons({super.key,
    required this.towerName,
  });

  @override
  State<BottonNavWithAnimatedIcons> createState() =>
      _BottonNavWithAnimatedIconsState(towerName: towerName);
}

class _BottonNavWithAnimatedIconsState
    extends State<BottonNavWithAnimatedIcons> {
  String towerName;

  _BottonNavWithAnimatedIconsState({required this.towerName});

  List<String> pages = ["Chat", "Search", "History", "Notification", "Profile"];

  @override
  void initState() {
    selctedNavIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        TowerTitle(towerName: towerName),
        centerWidget[selctedNavIndex],
        Positioned(
          bottom: 0.0,
          right: 25.0,
          left: 25.0,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 60,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(1),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                  color: bottonNavBgColor.withOpacity(0.1),
                  offset: const Offset(0, 20),
                  blurRadius: 35,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  bottomNavItems.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selctedNavIndex = index;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedBar(isActive: selctedNavIndex == index),
                          SizedBox(
                            height: 32,
                            width: 29,
                            child: Opacity(
                              opacity: selctedNavIndex == index ? 1 : 0.5,
                              child: bottomNavItems[index],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 2),
      height: 2,
      width: isActive ? 20 : 0,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
