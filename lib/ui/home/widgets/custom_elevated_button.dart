import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.borderSideColor,
    this.textStyle,
    required this.buttonContent,
  });

  VoidCallback? onPressed;
  Color? backgroundColor;
  Color? borderSideColor;
  TextStyle? textStyle;
  Widget buttonContent;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: height * 0.02),
        backgroundColor: backgroundColor ?? AppColors.primaryLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: borderSideColor ?? AppColors.primaryLight, width: 1.5),
        ),
      ),
      child: buttonContent,
    );
  }
}
