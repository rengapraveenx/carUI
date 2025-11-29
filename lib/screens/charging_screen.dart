import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ChargingScreen extends StatelessWidget {
  const ChargingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black87,
      backgroundColor: Color(0xff2D3742),
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset('assets/blk.png'),
                  ),
                ).animate().fadeIn(duration: 1000.ms).rotate(begin: 0, end: 1),

                GestureDetector(
                      onPanUpdate: (details) {
                        if (details.delta.dy < -10) {
                          print("Swipe UP");
                        } else if (details.delta.dy > 10) {
                          Navigator.pop(context);
                        } else if (details.delta.dx > 10) {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => const ChargerScreen(),
                          //   ),
                          // );
                        } else if (details.delta.dx < -10) {
                          Navigator.pop(context);
                        }
                      },
                      child: Hero(
                        tag: 'carTag',
                        child: Transform.translate(
                          offset: Offset(0, -200),
                          child: Transform.rotate(
                            angle: 0,
                            child: Transform.scale(
                              scale: 1,
                              child: Image.asset("assets/car_top_view.png"),
                            ),
                          ),
                        ),
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 800.ms)
                    .slideY(begin: -0.2, end: 0),
              ],
            ),

            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Column(
                spacing: 30,
                children: [
                  batteryStatusWidget(
                    chargingText: 'Charging',
                    percentage: '70%',
                    timeLeft: '20 min left',
                    fontSize: 60,
                    glowColor: Colors.white,
                  ),
                  Container(
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: 300,
                    decoration: BoxDecoration(
                      color: Color(0xffFCF5F5).withAlpha(100),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Row(
                      spacing: 6,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        cell().animate(delay: 300.ms).fadeIn(duration: 100.ms),
                        cell().animate(delay: 600.ms).fadeIn(duration: 100.ms),
                        cell().animate(delay: 900.ms).fadeIn(duration: 100.ms),
                        cell().animate(delay: 1200.ms).fadeIn(duration: 100.ms),
                        cell().animate(delay: 1500.ms).fadeIn(duration: 100.ms),
                        cell()
                            .animate(
                              delay: 1800.ms,
                              autoPlay: true,
                              onPlay: (controller) =>
                                  controller.repeat(reverse: true),
                            )
                            .fadeIn(duration: 800.ms, delay: 400.ms),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cell() {
    return Container(
      height: 90,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffCDED6D),
      ),
    );
  }

  Widget batteryStatusWidget({
    required String chargingText,
    required String percentage,
    required String timeLeft,
    Color glowColor = Colors.greenAccent,
    double fontSize = 50,
    Duration duration = const Duration(seconds: 2),
  }) {
    // Extract numeric value from percentage string
    final int targetValue = int.tryParse(percentage.replaceAll('%', '')) ?? 0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: targetValue.toDouble()),
          duration: duration,
          builder: (context, value, child) {
            return Text(
              '${value.toInt()}%',
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: glowColor,
                shadows: [
                  Shadow(
                    blurRadius: 20.0,
                    color: glowColor,
                    offset: Offset(0, 0),
                  ),
                  Shadow(
                    blurRadius: 30.0,
                    color: glowColor.withOpacity(0.5),
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            );
          },
        ),

        SizedBox(height: 8),

        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '$chargingText ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                text: '($timeLeft)',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
