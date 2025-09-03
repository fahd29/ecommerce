import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/auth/presentation/login/shared_prefs_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes_manager/route_generator.dart';
import 'domain/di/di.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await SharedPrefsUtils.init();
 var token=SharedPrefsUtils.getData(key: "token");
 String route;
 if(token==null){
   route=Routes.signInRoute;
 }else{
   route=Routes.mainRoute;
 }

  configureDependencies();
  runApp( MainApp(route: route,));
}

class MainApp extends StatelessWidget {
  String route;
  MainApp({required this.route});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: route,
      ),
    );
  }
}
