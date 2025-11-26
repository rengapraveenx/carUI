import 'package:carui/screens/widgets/os_map_widget.dart';
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
  late Animation<double> cardOpacity;

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
    cardSlideY = Tween<double>(begin: 400, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 0.45, curve: Curves.easeOut),
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
    modelSlideX = Tween<double>(begin: -200, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.60, 1.0, curve: Curves.easeOut),
      ),
    );

    cardOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 0.45, curve: Curves.easeOut),
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
            child: SingleChildScrollView(
              child: Column(
                spacing: 50,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Name (slide from left)
                      Transform.translate(
                        offset: Offset(nameSlideX.value, 0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Hello, ",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w300, // light style
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: "Renga",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold, // bold style
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Search + Profile Stack
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff1e1f2a),
                            ),
                            child: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),

                          // Profile Image sliding from behind search button
                          Transform.translate(
                            offset: Offset(profileSlideX.value, 0),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                  image: AssetImage("assets/profile.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // const SizedBox(height: 20),

                  // CAR CARD (coming from bottom)
                  FadeTransition(
                    opacity: cardOpacity,
                    child: Transform.translate(
                      offset: Offset(0, cardSlideY.value),
                      child: Container(
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
                            // Model Name from left
                            Transform.translate(
                              offset: Offset(modelSlideX.value, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Model 2.0",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "DURA chassis",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
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
                  ),

                  // Map + Battery (NO ANIMATION)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20,
                    children: [
                      const Text(
                        "Charging Stations",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Row(
                        spacing: 20,
                        children: [
                          // Map preview - static
                          Expanded(
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Colors.grey.shade200,
                              ),
                              child: SimpleOsmPreview(
                                lat: 12.9716,
                                lng: 77.5946,
                              ),
                            ),
                          ),

                          // Battery preview - static
                          Container(
                            height: 200,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: Colors
                                  .grey
                                  .shade300, // background for empty area
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Filled battery level (53%)
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 200 * 0.73, // 53% fill
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(22),
                                        top: Radius.circular(12),
                                      ),
                                      color: Colors.greenAccent.shade400,
                                    ),
                                  ),
                                ),

                                // Percentage Text
                                const Text(
                                  "73%",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
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
          );
        },
      ),
    );
  }
}
