import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:t3/core/theme/theme_app.dart';
import 'package:t3/core/theme/typo_style.dart';
import 'package:t3/core/utils/assets.dart';
import 'package:t3/features/home/domain/model/event_model.dart';

class EventItem extends StatelessWidget {
  final EventModel event;
  const EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0.w),
      color: context.colors.inversePrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0).w,
            child: Image.asset(
              ImageAssets.img6,
              fit: BoxFit.cover,
              height: 120.w,
              width: 120.w,
            ),
          ),
          8.verticalSpace,
          Text(
            event.title,
            style: TypoStyle.title3.copyWith(color: context.colors.onPrimary),
          ),
          8.verticalSpace,
          Text(
            event.town,
            style: TypoStyle.text2.copyWith(color: context.colors.onPrimary),
          ),
          8.verticalSpace,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(IconsAssets.airplane,fit: BoxFit.scaleDown,),
              Text(
                'от ${event.price.value} руб.',
                style: TypoStyle.text2.copyWith(color: context.colors.onPrimary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
