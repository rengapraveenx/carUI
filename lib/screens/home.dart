import 'package:flutter/material.dart';

class EvDashboardScreen extends StatefulWidget {
  const EvDashboardScreen({super.key});

  @override
  State<EvDashboardScreen> createState() => _EvDashboardScreenState();
}

class _EvDashboardScreenState extends State<EvDashboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> nameSlideX;
  late Animation<double> profileSlideX;
  late Animation<double> cardSlideY;
  late Animation<double> carSlideX;
  late Animation<double> modelSlideX;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // 1. Name from left
    nameSlideX = Tween<double>(begin: -80, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
      ),
    );

    // 2. Profile image coming from behind search button
    profileSlideX = Tween<double>(begin: 0, end: -60).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.1, 0.40, curve: Curves.easeOut),
      ),
    );

    // 3. Car card from bottom
    cardSlideY = Tween<double>(begin: 100, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 0.55, curve: Curves.easeOut),
      ),
    );

    // 4. Car image from right (after card animation)
    carSlideX = Tween<double>(begin: 550, end: 200).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.55, 0.90, curve: Curves.easeOut),
      ),
    );

    // 5. Model name from left
    modelSlideX = Tween<double>(begin: -50, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.60, 1.0, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Name (slide from left)
                    Transform.translate(
                      offset: Offset(nameSlideX.value, 0),
                      child: const Text(
                        "Hello, Renga",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Search + Profile Stack
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        // Search button (static)
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff1e1f2a),
                          ),
                          child: const Icon(Icons.search, color: Colors.white),
                        ),

                        // Profile Image sliding from behind search button
                        Transform.translate(
                          offset: Offset(profileSlideX.value, 0),
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage("assets/profile.jpg"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // CAR CARD (coming from bottom)
                Transform.translate(
                  offset: Offset(0, cardSlideY.value),
                  child: Container(
                    width: double.infinity,
                    height: 350,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xfff4efe9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      spacing: 20,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Model Name from left
                        Transform.translate(
                          offset: Offset(modelSlideX.value, 0),
                          child: const Text(
                            "Model 2.0",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // CAR IMAGE from right
                        Transform.translate(
                          offset: Offset(carSlideX.value, 0),
                          child: Transform.rotate(
                            angle: -1.57,
                            child: Transform.scale(
                              scale: 2.2,
                              child: Image.asset(
                                "assets/car_top_view.png",
                                height: 200,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // Map + Battery (NO ANIMATION)
                const Text(
                  "Charging Stations",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    // Map preview - static
                    Expanded(
                      child: Container(
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade200,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),

                    // Battery preview - static
                    Container(
                      height: 140,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.greenAccent.shade100,
                      ),
                      child: const Center(
                        child: Text(
                          "53%",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
