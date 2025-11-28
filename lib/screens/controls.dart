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
                                  icon: Icons.map_outlined,
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
                                      icon: Icons.lock,
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
    String? title,
    required String description,
    required IconData icon,
    required Color bgColor,
    required Color fgColor,
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
              if (title != null && isBigButton)
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: fgColor,
                  ),
                ),
              if (isBigButton)
                Text(
                  description,
                  style: TextStyle(
                    color: fgColor.withAlpha(200),
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                  ),
                ),
            ],
          ),
          if (isBigButton) Icon(icon, color: fgColor, size: 30),
          if (!isBigButton)
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 5),
              child: Column(
                spacing: 6,
                children: [
                  Icon(icon, color: fgColor, size: 30),
                  Text(
                    description,
                    style: TextStyle(
                      color: fgColor.withAlpha(200),
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                    ),
                  ),
                ],
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
