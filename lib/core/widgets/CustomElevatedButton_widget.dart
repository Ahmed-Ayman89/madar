import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 135, // قريب من 134.99
      height: 41,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(Icons.arrow_back_ios, size: 9),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF259CCB),
          elevation: 6,
          shadowColor: Colors.black.withOpacity(0.25),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(68),
          ),
        ),

        label: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
