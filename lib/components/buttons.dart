import 'package:flutter/material.dart';

class FarmButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  const FarmButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,

    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? 300,
        decoration: BoxDecoration(
          color: backgroundColor ??
              Colors.green, // Use provided backgroundColor or default to green
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black), // Add a border
        ),
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: textColor ??
                  Colors.white, // Use provided textColor or default to white
            ),
          ),
        ),
      ),
    );
  }
}
