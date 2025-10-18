import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget text;
  final Color backgroundColor;
  final Color textColor;
  final Size size;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.size,
    required this.fontSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        fixedSize: size,
        textStyle: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ),
      child: text,
    );
  }
}

class MainButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  const MainButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      text: Text(text),
      backgroundColor: Colors.indigo,
      textColor: Colors.white,
      size: const Size(125, 50),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }
}