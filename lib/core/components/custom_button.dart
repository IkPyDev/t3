import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t3/core/theme/theme_app.dart';
import 'package:t3/core/theme/typo_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    this.padding = const EdgeInsets.all(12),
    required this.title,
    this.color =ThemeApp.blue,
    this.textColor =ThemeApp.white, this.borderRadius, this.textStyle,
  });

  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final String title;
  final EdgeInsetsGeometry padding;
  final Color color;
  final Color textColor;
  final double? borderRadius;



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

        style: ElevatedButton.styleFrom(
            foregroundColor: ThemeApp.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8).r),
            backgroundColor: color),
        onPressed: onTap,
        child: Container(
          width: double.infinity,
          padding: padding,
          child: Text(
            textAlign: TextAlign.center,
            title,
            overflow: TextOverflow.ellipsis,
            style: textStyle ??  TypoStyle.buttonText1.copyWith(color: textColor),
          ),
        ));
  }
}
