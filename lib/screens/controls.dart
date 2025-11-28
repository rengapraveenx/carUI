import 'package:carui/screens/widgets/hearder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ControlsScreen extends StatelessWidget {
  const ControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, right: 22, left: 22),
              child: Header(),
            ),
            const SizedBox(height: 30),

            // Control buttons
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _btn(Icons.flash_on, "Lights"),
                    _btn(Icons.ac_unit, "AC"),
                    _btn(Icons.lock, "Lock"),
                  ],
                )
                .animate()
                .fadeIn(duration: 800.ms)
                .slideY(begin: 1.5, end: 0)
                .fadeIn(),

            const SizedBox(height: 100),

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
                    offset: Offset(0, 150),
                    child: Transform.rotate(
                      angle: 0,
                      child: Transform.scale(
                        scale: 1,
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

  Widget _btn(IconData icon, String label) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, size: 30, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
