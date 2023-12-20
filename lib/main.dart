import 'package:flutter/material.dart';
import 'package:flutter_piton/product/navigation/go_router.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          routeInformationProvider: RouterManager.instance.router.routeInformationProvider,
          routeInformationParser: RouterManager.instance.router.routeInformationParser,
          routerDelegate: RouterManager.instance.router.routerDelegate,
        );
      },
    );
  }
}
