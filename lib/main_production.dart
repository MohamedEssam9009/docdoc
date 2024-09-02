import 'package:docdoc/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/shared_pref_helper.dart';
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

 checkIfUserIsLoggedIn() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
