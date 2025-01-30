import 'package:flutter/material.dart';

// This creates the square blocks holding "feels like" and "rain chance"

class CurrentWeatherBlock extends StatefulWidget {
  final double? number;
  final String units;
  final String text;
  final IconData? icon; // Optional built-in icon
  final String? imagePath; // Optional custom image path

  CurrentWeatherBlock({
    super.key,
    required this.number,
    required this.units,
    required this.text,
    this.icon,
    this.imagePath, // Initialize custom image path
  });

  @override
  State<CurrentWeatherBlock> createState() => _CurrentWeatherRow();
}

class _CurrentWeatherRow extends State<CurrentWeatherBlock> {
  @override
  Widget build(BuildContext context) {
    return Center( // Wrap in Center to center-align the box
      child: Container(
        width: 190, // Creates max width and height of container
        height: 190, 
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                width: 35, // Image size
                height: 35,
                color: Colors.white, 
                colorBlendMode: BlendMode.srcIn, 
              ),
            SizedBox(height: 5), // creates spacing between icon and text
            Text(
              "${widget.number?.toStringAsFixed(0)}${widget.units}",
              style: const TextStyle(color: Colors.white, fontSize: 55),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.text,
              style: const TextStyle(color: Colors.white, fontSize: 26),
            ),
          ],
        ),
      ),
    );
  }
}
