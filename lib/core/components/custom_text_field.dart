import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:t3/core/theme/theme_app.dart';
import 'package:t3/core/theme/typo_style.dart';
import 'package:t3/core/utils/assets.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      this.hintText,
      this.suffixString,
      this.suffixIcon,
      this.prefixIcon,
      this.isClear = false,
      this.padding = const EdgeInsets.all(0),

      this.prefixString,
      this.backgroundColor, this.isEnable =true, this.isReadonly=false});

  final String? hintText;
  final TextEditingController controller;
  final String? suffixString;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isClear;
  final EdgeInsets padding;
  final bool isEnable ;
  final bool isReadonly ;

  final String? prefixString;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      scrollPadding: padding,
      enabled: isEnable,
      readOnly: isReadonly,
      controller: controller,
      decoration: InputDecoration(

        border: InputBorder.none,
        suffixText: suffixString,
        contentPadding: padding,
        prefixText: prefixString,
        isDense: true,
        suffixIcon: isClear
            ? IconButton(
                onPressed: () {
                  controller.clear();
                },
                icon: SvgPicture.asset(
                  IconsAssets.close,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(ThemeApp.white, BlendMode.srcIn),
                ))
            : suffixIcon,
        prefixIcon: prefixIcon,
        filled: backgroundColor != null,
        fillColor: backgroundColor ?? ThemeApp.grey4,
        hintText: hintText,
        hintStyle: TypoStyle.buttonText1.copyWith(color: ThemeApp.grey6),
      ),
    );
  }
}
