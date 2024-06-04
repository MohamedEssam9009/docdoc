import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DocDoc',
        theme: ThemeData(
          primaryColor: ColorsManger.mainBlue,
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: false,
        ),
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
