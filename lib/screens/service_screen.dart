import 'package:carui/screens/charger_screen.dart';
import 'package:carui/screens/widgets/hearder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, right: 22, left: 22),
              child: Header(textColor: Colors.white),
            ),

            // HERO CAR
            SizedBox(
              height: 700,
              child: GestureDetector(
                onPanUpdate: (details) {
                  if (details.delta.dy < -10) {
                    print("Swipe UP");
                  } else if (details.delta.dy > 10) {
                    Navigator.pop(context);
                  } else if (details.delta.dx > 10) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ChargerScreen()),
                    );
                  } else if (details.delta.dx < -10) {
                    Navigator.pop(context);
                  }
                },
                child: Hero(
                  tag: 'carTag',
                  child: Transform.translate(
                    offset: Offset(0, 0),
                    child: Transform.rotate(
                      angle: 0,
                      child: Transform.scale(
                        scale: 0.8,
                        child: Image.asset("assets/car_top_view.png"),
                      ),
                    ),
                  ),
                ),
              ),
            ).animate().fadeIn(duration: 500.ms).slideX(begin: 1, end: 0),

            Expanded(
              child: Container(
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
                      '2 Mid Care',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.circle_notifications, size: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
