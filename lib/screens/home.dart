import 'package:carui/screens/controls.dart';
import 'package:carui/screens/widgets/battery_widget.dart';
import 'package:carui/screens/widgets/hearder_widget.dart';
import 'package:carui/screens/widgets/os_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EvDashboardScreen extends StatelessWidget {
  const EvDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 45),
        child: SingleChildScrollView(
          child: Column(
            spacing: 50,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Header(textColor: Colors.black),

              // CAR CARD
              Container(
                width: double.infinity,
                height: 400,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xfff4efe9),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Model Name
                    Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Model 2.0",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "DURA chassis",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        )
                        .animate(delay: 800.ms)
                        .slideX(begin: -1.5, end: 0, duration: 500.ms),

                    const SizedBox(height: 10),

                    // CAR HERO
                    GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ControlsScreen(),
                            ),
                          ),
                          child: SizedBox(
                            width: 250,
                            height: 250,
                            child: Hero(
                              tag: 'carTag',
                              child: Transform.translate(
                                offset: Offset(150, -10),
                                child: Transform.rotate(
                                  angle: -1.57,
                                  child: Transform.scale(
                                    scale: 2.2,
                                    child: Image.asset(
                                      "assets/car_top_view.png",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 500.ms)
                        .slideX(
                          begin: 1,
                          end: 0,
                          duration: 700.ms,
                          curve: Curves.easeOut,
                        ),
                  ],
                ),
              ),

              // MAP + BATTERY
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  const Text(
                    "Charging Stations",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),

                  Row(
                    spacing: 20,
                    children: [
                      Expanded(
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Colors.grey.shade200,
                          ),
                          child:
                              const SimpleOsmPreview(lat: 12.9716, lng: 77.5946)
                                  .animate(delay: 1000.ms)
                                  .fadeIn(duration: 600.ms)
                                  .slideX(begin: -1, end: 0),
                        ),
                      ),

                      // BATTERY
                      BatteryWidget(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
