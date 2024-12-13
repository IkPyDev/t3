import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:t3/core/components/custom_button.dart';
import 'package:t3/core/theme/theme_app.dart';
import 'package:t3/core/theme/typo_style.dart';
import 'package:t3/core/utils/assets.dart';
import 'package:t3/features/home/domain/model/event_model.dart';
import 'package:t3/features/home/presentation/widgets/Event_item.dart';
import 'package:t3/features/home/presentation/widgets/bar_navigation.dart';
import 'package:t3/features/home/presentation/widgets/home_bottom_sheet.dart';
import 'package:t3/features/home/presentation/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    fromController.dispose();
    toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    26.verticalSpace,
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Поиск дешевых\n авиабилетов",
                        style: TypoStyle.title1.copyWith(color: context.colors.onPrimary),
                      ),
                    ),
                    38.verticalSpace,
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            useSafeArea: true,
                            sheetAnimationStyle: AnimationStyle(
                              curve: Curves.easeInOut,
                              duration: const Duration(milliseconds: 300),
            
                            ),
                            context: context,
                            builder: (context) => const HomeBottomSheet());
                      },
                      child: AbsorbPointer(
                        child: CustomSearchBar(fromController: fromController, toController: toController),
                      ),
                    ),
                    32.verticalSpace,
                    Text(
                      "Музыкально отлететь",
                      style: TypoStyle.title1.copyWith(color: context.colors.onPrimary),
                    ),
                    20.verticalSpace,
                    SizedBox(
                      height: 250.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const EventItem(
                              event: EventModel(
                                  title: 'Socrat& Lera', town: 'Санкт- Петербург', price: EventPrice(value: 2390), id: 100),
                            );
                          }),
                    ),
                    CustomButton(onTap: () {  }, title: 'Показать все места',color: ThemeApp.grey3,textStyle: TypoStyle.title3,),
                    25.verticalSpace,
                    Text("Ваш первый раз", style: TypoStyle.title1.copyWith(color: context.colors.onPrimary)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BarNavigation()
    );
  }
}
