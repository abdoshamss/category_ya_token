
import 'package:category/features/profile/view/profile_screen.dart';
import 'package:category/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helper/cash.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPref.init();
    return const ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        home: SplashScreen(),
      
      ),
    );
  }}