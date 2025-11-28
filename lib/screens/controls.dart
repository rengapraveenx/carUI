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
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
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
                                actionButton(
                                  title: '24 C',
                                  description: 'Climate',
                                  icon: Icons.ac_unit,
                                  bgColor: Color(0xFFE1EEFA),
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
                                actionButton(
                                  title: '24 C',
                                  description: 'Climate',
                                  icon: Icons.ac_unit,
                                  bgColor: Color(0xFFE1EEFA),
                                  isBigButton: false,
                                ),
                                Row(
                                  spacing: 10,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    actionButton(
                                      title: '24 C',
                                      description: 'Climate',
                                      icon: Icons.ac_unit,
                                      bgColor: Color(0xFFE1EEFA),
                                      isBigButton: false,
                                    ),
                                    actionButton(
                                      title: '24 C',
                                      description: 'Climate',
                                      icon: Icons.ac_unit,
                                      bgColor: Color(0xFFE1EEFA),
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
                    print("Swipe UP");
                  } else if (details.delta.dy > 10) {
                    print("Swipe DOWN");
                  } else if (details.delta.dx > 10) {
                    print("Swipe RIGHT");
                  } else if (details.delta.dx < -10) {
                    print("Swipe LEFT");
                  }
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

  Widget actionButton({
    required String title,
    String? description,
    required IconData icon,
    required Color bgColor,
    bool isBigButton = true,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isBigButton ? 18 : 10,
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: bgColor,
      ),
      child: Column(
        spacing: 10,
        children: [
          Column(
            children: [
              if (isBigButton)
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              if (description != null && isBigButton)
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.blueGrey.withAlpha(200),
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                  ),
                ),
            ],
          ),
          if (isBigButton) Icon(icon, color: Colors.blueGrey, size: 30),
          if (!isBigButton) Icon(icon, color: Colors.blueGrey, size: 30),
          if (!isBigButton)
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
        ],
      ),
    );
  }

  Widget batteryIndicator() {
    return Stack(children: [

      ],
    );
  }
}
