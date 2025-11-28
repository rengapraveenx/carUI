import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BatteryWidget extends StatelessWidget {
  final double width;
  final double height;
  const BatteryWidget({super.key, this.width = 60, this.height = 200});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.grey.shade300,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child:
                Container(
                  height: height * 0.73,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(22),
                      top: Radius.circular(12),
                    ),
                    color: Color(0xffA5E73D),
                  ),
                ).animate().scaleY(
                  begin: 0,
                  end: 1,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                  alignment: Alignment.bottomCenter,
                ),
          ),
          const Text(
            "73%",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              // color: Color(0xff9E8D97),
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
