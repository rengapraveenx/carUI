import 'package:carui/screens/controls.dart';
import 'package:carui/screens/widgets/os_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EvDashboardScreen extends StatelessWidget {
  const EvDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 45),
        child: SingleChildScrollView(
          child: Column(
            spacing: 50,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
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
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "Renga",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ).animate().slideX(begin: -1, end: 0, duration: 400.ms),

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
                          .animate(delay: 200.ms)
                          .slideX(begin: 0, end: -1.3, duration: 450.ms),
                    ],
                  ),
                ],
              ),

              // CAR CARD
              Container(
                width: double.infinity,
                height: 400,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xfff4efe9),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Model Name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Model 2.0",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "DURA chassis",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ).animate().slideX(begin: -1, end: 0, duration: 500.ms),

                    const SizedBox(height: 10),

                    // CAR HERO
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ControlsScreen(),
                        ),
                      ),
                      child: SizedBox(
                        width: 250,
                        height: 250,
                        child: Hero(
                          tag: 'carTag',
                          child: Transform.translate(
                            offset: Offset(150, -10),
                            child: Transform.rotate(
                              angle: -1.57,
                              child: Transform.scale(
                                scale: 2.2,
                                child: Image.asset("assets/car_top_view.png")
                                    .animate()
                                    .fadeIn(duration: 500.ms)
                                    .slideY(
                                      begin: 1,
                                      end: 0,
                                      duration: 700.ms,
                                      curve: Curves.easeOut,
                                    ),
                              ),
                            ),
                          ),
                          // .rotate(begin: 0, end: 2),
                          // .scale(
                          //   begin: const Offset(
                          //     0.5,
                          //     0.5,
                          //   ), // <-- must be Offset
                          //   end: const Offset(2.2, 2.2),
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // .animate().fadeIn(duration: 600.ms).slideY(begin: 1, end: 0),

              // MAP + BATTERY
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  const Text(
                    "Charging Stations",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),

                  Row(
                    spacing: 20,
                    children: [
                      Expanded(
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Colors.grey.shade200,
                          ),
                          child:
                              const SimpleOsmPreview(lat: 12.9716, lng: 77.5946)
                                  .animate()
                                  .fadeIn(duration: 600.ms)
                                  .slideX(begin: -1, end: 0),
                        ),
                      ),

                      // BATTERY
                      Container(
                        height: 200,
                        width: 60,
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
                                    height: 200 * 0.73,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.vertical(
                                        bottom: Radius.circular(22),
                                        top: Radius.circular(12),
                                      ),
                                      color: Colors.greenAccent.shade400,
                                    ),
                                  ).animate()
                                  // .fadeIn(duration: 600.ms)
                                  .scaleY(
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
