import 'package:category/features/profile/view/profile_screen.dart';
import 'package:category/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helper/cache.dart';
import 'features/cart/add_cart/cubit/add_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AddCubit>(
            create: (context) => AddCubit(),
          ),
        ],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            home: SplashScreen()));
  }
}
// return const ScreenUtilInit(
//   designSize: Size(360, 690),
//   minTextAdapt: true,
//   splitScreenMode: true,
