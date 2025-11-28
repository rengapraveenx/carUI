import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ControlsScreen extends StatelessWidget {
  const ControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Car Controls",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),

          // Control buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _btn(Icons.flash_on, "Lights"),
              _btn(Icons.ac_unit, "AC"),
              _btn(Icons.lock, "Lock"),
            ],
          ).animate().slideY(begin: -0.5, end: 0).fadeIn(),

          const SizedBox(height: 100),

          // HERO CAR
          Hero(
            tag: 'carTag',
            child: Image.asset(
              "assets/car_top_view.png",
            ).animate().slideY(begin: 1, end: 0),
            // .scale(begin: 0.8, end: 2.8),
            // .scale(begin: Offset(0.8, 0.8), end: Offset(2.8, 2.8)),
          ),
        ],
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
