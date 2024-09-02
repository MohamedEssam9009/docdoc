import 'package:docdoc/main_production.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'doc_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await checkIfUserIsLoggedIn();
  // to fix texts being hidden bug in flutter_screenUtil in release mode
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(appRouter: AppRouter()));
}
