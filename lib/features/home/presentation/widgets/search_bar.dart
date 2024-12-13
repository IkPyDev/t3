import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:t3/core/components/custom_text_field.dart';
import 'package:t3/core/theme/theme_app.dart';
import 'package:t3/core/utils/assets.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController fromController;

  final TextEditingController toController;

  const CustomSearchBar({super.key, required this.fromController, required this.toController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16).w,
      decoration: BoxDecoration(
        color: ThemeApp.grey8,
        borderRadius: BorderRadius.circular(16).r,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.w),
        decoration: BoxDecoration(
          color: ThemeApp.grey4,
          borderRadius: BorderRadius.circular(16).r,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,

          children: [
            SvgPicture.asset(
              IconsAssets.search,
              fit: BoxFit.scaleDown,
            ),
            16.horizontalSpace,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(

                    isReadonly: true,
                    controller: fromController,
                    hintText: "Город, страна",
                  ),
                  Divider(
                    color: ThemeApp.grey6.withOpacity(0.6),
                  ),
                  CustomTextField(
                    isReadonly: true,

                    controller: toController,
                    hintText: "Куда - Турция",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
