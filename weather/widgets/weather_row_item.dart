import 'package:flutter/material.dart';

// This creates the "row" blocks that display the upcoming days

class CurrentWeatherRow extends StatefulWidget {
  final double? lowTemp;
  final double? highTemp;
  final String weekDay;
  final IconData? icon; // Optional built-in icon
  final String? imagePath; // Optional custom image path

  CurrentWeatherRow({
    super.key,
    required this.lowTemp,
    required this.highTemp,
    required this.weekDay,
    this.icon,
    this.imagePath, // Initialize custom image path
  });

  @override
  State<CurrentWeatherRow> createState() => _CurrentWeatherRow();
}

class _CurrentWeatherRow extends State<CurrentWeatherRow> {
  @override
  Widget build(BuildContext context) {
    return Center( // Wrap in Center to center-align the box
      child: Container(
        width: 470, // Explicit width
        height: 80, // Explicit height
        decoration: BoxDecoration(
          color: const Color(0xFFAC3E45),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(1),
              blurRadius: 4,
            ),
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "   ${widget.weekDay}",
              style: const TextStyle(color: Colors.white, fontSize: 40),
              textAlign: TextAlign.left
            ),
            Text(
              "    ${widget.lowTemp?.toStringAsFixed(0)}  ",
              style: const TextStyle(color: Colors.white, fontSize: 45),
              textAlign: TextAlign.center,
            ),
            // Display built-in icon if provided
            if (widget.icon != null)
              Icon(
                widget.icon,
                color: Colors.white,
                size: 35,
              ),
            // Display custom image if provided
            if (widget.imagePath != null)
              Image.asset(
                widget.imagePath!,
                width: 35, // Adjust image size as needed
                height: 35,
                color: Colors.white, // Change the image color
                colorBlendMode: BlendMode.srcIn, // Use a suitable blend mode
              ),
            // SizedBox(width: 5),
            Text(
              " ${widget.highTemp?.toStringAsFixed(0)}",
              style: const TextStyle(color: Colors.white, fontSize: 45),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
