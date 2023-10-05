import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app_route/router.dart';
import 'core/local_database/cache_helpler.dart';
import 'core/utilities/theme_data.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.cacheInitialization();
  //Bloc.observer = SimpleBlocObserver();
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        scrollBehavior: ScrollConfiguration.of(context).copyWith(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
        ),
        title: 'Book Store',
        debugShowCheckedModeBanner: false,
        theme: themeData(context),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
