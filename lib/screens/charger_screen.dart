import 'dart:ui';

import 'package:carui/screens/widgets/battery_widget.dart';
import 'package:carui/screens/widgets/hearder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ChargerScreen extends StatelessWidget {
  const ChargerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBF6F4),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, right: 22, left: 22),
              child: Header(textColor: Colors.black),
            ),

            // HERO CAR
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                SizedBox(
                  height: 700,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      if (details.delta.dy < -10) {
                        print("Swipe UP");
                      } else if (details.delta.dy > 10) {
                        Navigator.pop(context);
                      } else if (details.delta.dx > 10) {
                        print("Swipe RIGHT");
                      } else if (details.delta.dx < -10) {
                        Navigator.pop(context);
                      }
                    },
                    child: Hero(
                      tag: 'carTag',
                      child: Transform.translate(
                        offset: Offset(180, 60),
                        child: Transform.rotate(
                          angle: 0,
                          child: Transform.scale(
                            scale: 1,
                            child: Image.asset("assets/car_top_view.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ).animate().fadeIn(duration: 500.ms).slideX(begin: 1, end: 0),

                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BatteryWidget(width: 140, height: 230),
                        Container(
                          height: 200,
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Color(0xffE1EEFA),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 10,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'CHAdeMO',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    '\$3.60/KWT',
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/ch.png',
                                width: 100,
                                height: 100,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),

                        // ✨ GLASSY BORDER
                        border: Border.all(
                          color: Colors.white.withOpacity(0.25), // glass edge
                          width: 3,
                        ),

                        // ✨ GLASS BACKGROUND
                        color: Colors.white.withOpacity(0.12),
                      ),
                      padding: const EdgeInsets.all(22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            '2 Mid Care',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Icon(
                            Icons.circle_notifications,
                            size: 30,
                            color: Colors.black87,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
