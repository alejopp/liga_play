import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String buttonText;
  final Color? backgroundColour;
  final Function()? onTapped;

  const CustomPrimaryButton({
    super.key,
    required this.buttonText,
    this.backgroundColour,
    this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 50.0,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onTapped,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5), // Esquinas redondeadas
              ),
              backgroundColor: backgroundColour),
          child: Text(buttonText),
        ),
      ),
    );
  }
}
