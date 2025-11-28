import 'package:carui/screens/charger_screen.dart';
import 'package:carui/screens/widgets/hearder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black87,
      backgroundColor: Color(0xff2D3742),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, right: 22, left: 22),
              child: Header(textColor: Colors.white),
            ),

            // HERO CAR
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset('assets/blk.png'),
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 1000.ms)
                      .rotate(begin: 0, end: 1),

                  GestureDetector(
                    onPanUpdate: (details) {
                      if (details.delta.dy < -10) {
                        print("Swipe UP");
                      } else if (details.delta.dy > 10) {
                        Navigator.pop(context);
                      } else if (details.delta.dx > 10) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ChargerScreen(),
                          ),
                        );
                      } else if (details.delta.dx < -10) {
                        Navigator.pop(context);
                      }
                    },
                    child: Hero(
                      tag: 'carTag',
                      child: Transform.scale(
                        scale: 0.8,
                        child: Image.asset("assets/car_top_view.png"),
                      ),
                    ),
                  ).animate().fadeIn(duration: 500.ms).slideX(begin: 1, end: 0),

                  // LEFT BLINK LIGHT
                  Positioned(
                    top: 470,
                    left: 60,
                    child:
                        Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Color(0xffFF5751),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.red.withOpacity(0.6),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.priority_high_outlined,
                                color: Colors.white,
                                size: 15,
                              ),
                            )
                            .animate(
                              delay: 1000.ms,
                              onPlay: (controller) =>
                                  controller.repeat(reverse: true),
                            )
                            .fadeIn(duration: 300.ms)
                            .scale(
                              begin: Offset(0.7, 0.7),
                              end: Offset(1.2, 1.2),
                              duration: 700.ms,
                            ),
                  ),

                  // RIGHT BLINK LIGHT
                  Positioned(
                    top: 240,
                    right: 80,
                    child:
                        Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Color(0xffFF5751),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.red.withOpacity(0.6),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.priority_high_outlined,
                                color: Colors.white,
                                size: 15,
                              ),
                            )
                            .animate(
                              delay: 1300.ms,
                              onPlay: (controller) =>
                                  controller.repeat(reverse: true),
                            )
                            .fadeIn(duration: 300.ms)
                            .scale(
                              begin: Offset(0.7, 0.7),
                              end: Offset(1.2, 1.2),
                              duration: 700.ms,
                            ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffFCF5F5),
                borderRadius: BorderRadius.circular(32),
              ),
              padding: const EdgeInsets.all(22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '2 Mid Care Required',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.circle_notifications, size: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
