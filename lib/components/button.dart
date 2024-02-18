import "package:flutter/material.dart";

class Button extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;

  const Button({super.key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Material(
        elevation: 6.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: const Color(0xFF006be9),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Center(
              child: Text(
                buttonText,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: 3.2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
