import 'package:carui/screens/service_screen.dart';
import 'package:carui/screens/widgets/action_button.dart';
import 'package:carui/screens/widgets/battery_widget.dart';
import 'package:carui/screens/widgets/hearder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ControlsScreen extends StatelessWidget {
  const ControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, right: 22, left: 22),
              child: Header(textColor: Colors.white),
            ),
            const SizedBox(height: 30),

            // Control buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child:
                        Row(
                              spacing: 10,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BatteryWidget(width: 100, height: 230),
                                //* AC
                                actionButton(
                                  title: '24 C',
                                  description: 'Climate',
                                  icon: Icons.ac_unit,
                                  bgColor: Color(0xFFE1EEFA),
                                  fgColor: Colors.blueGrey,
                                  isBigButton: true,
                                ),
                              ],
                            )
                            .animate()
                            .fadeIn(duration: 400.ms)
                            .slideX(begin: -1.5, end: 0)
                            .fadeIn(),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child:
                        Column(
                              spacing: 10,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                //* Map
                                actionButton(
                                  description: 'Direction',
                                  icon: Icons.map,
                                  bgColor: Color(0xFFFFFDFE),
                                  fgColor: Color(0xff4D3F56),
                                  isBigButton: false,
                                ),
                                Row(
                                  spacing: 10,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    //* Lock
                                    actionButton(
                                      description: 'Locked',
                                      icon: Icons.lock,
                                      bgColor: Color(0xFF5D5E74),
                                      fgColor: Color(0xFFFFFBFF),
                                      isBigButton: false,
                                    ),
                                    //* Care
                                    actionButton(
                                      title: '2 Mid',
                                      description: 'Care',
                                      icon: Icons.circle_notifications,
                                      bgColor: Color(0xFFFCEAE7),
                                      fgColor: Color(0xFF967E84),
                                      isBigButton: true,
                                    ),
                                  ],
                                ),
                              ],
                            )
                            .animate()
                            .fadeIn(duration: 400.ms)
                            .slideX(begin: 1.5, end: 0)
                            .fadeIn(),
                  ),
                ],
              ),
            ),

            // HERO CAR
            Expanded(
              child: GestureDetector(
                onPanUpdate: (details) {
                  if (details.delta.dy < -10) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ServiceScreen()),
                    );
                  } else if (details.delta.dy > 10) {
                    print("Swipe DOWN");
                  } else if (details.delta.dx > 10) {
                    print("Swipe RIGHT");
                  } else if (details.delta.dx < -10) {
                    print("Swipe LEFT");
                  }
                },
                onTap: () {
                  Navigator.pop(context);
                },
                child: Hero(
                  tag: 'carTag',
                  child: Transform.translate(
                    offset: Offset(0, 100),
                    child: Transform.rotate(
                      angle: 0,
                      child: Transform.scale(
                        scale: 1.3,
                        child: Image.asset("assets/car_top_view.png"),
                      ),
                    ),
                  ),
                ).animate().fadeIn(duration: 500.ms).slideY(begin: 1, end: 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
