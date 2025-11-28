
  import 'package:flutter/material.dart';

Widget actionButton({
    String? title,
    required String description,
    required IconData icon,
    required Color bgColor,
    required Color fgColor,
    bool isBigButton = true,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isBigButton ? 18 : 10,
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: bgColor,
      ),
      child: Column(
        spacing: 10,
        children: [
          Column(
            children: [
              if (title != null && isBigButton)
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: fgColor,
                  ),
                ),
              if (isBigButton)
                Text(
                  description,
                  style: TextStyle(
                    color: fgColor.withAlpha(200),
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                  ),
                ),
            ],
          ),
          if (isBigButton) Icon(icon, color: fgColor, size: 30),
          if (!isBigButton)
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 5),
              child: Column(
                spacing: 6,
                children: [
                  Icon(icon, color: fgColor, size: 30),
                  Text(
                    description,
                    style: TextStyle(
                      color: fgColor.withAlpha(200),
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }