import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Header extends StatelessWidget {
  final Color textColor;
  const Header({super.key, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Name animation
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Hello, ",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w300,
                  color: textColor,
                ),
              ),
              TextSpan(
                text: "Renga",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ],
          ),
        ).animate(delay: 400.ms).slideX(begin: -1.3, end: 0, duration: 400.ms),

        // Search + Profile
        Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xff1e1f2a),
              ),
              child: const Icon(Icons.search, color: Colors.white),
            ),

            // Profile sliding behind search
            Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage("assets/profile.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                .animate(delay: 800.ms)
                .slideX(begin: 0, end: -1.3, duration: 450.ms),
          ],
        ),
      ],
    );
  }
}
