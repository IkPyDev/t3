import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t3/core/theme/theme_app.dart';
import 'package:t3/features/app/app.dart';
import 'package:t3/features/home/presentation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (context,child){

        return MaterialApp(
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          title: 'Mail Client',
          theme: AppTheme.darkTheme,

          home: child,
        );
      },
      splitScreenMode: true,
      child: const App(),
    );
  }
}

