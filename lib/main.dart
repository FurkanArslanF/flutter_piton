import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_piton/product/cubit/login_cubit.dart';
import 'package:flutter_piton/product/cubit/register_cubit.dart';
import 'package:flutter_piton/product/navigation/go_router.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            routeInformationProvider: RouterManager.instance.router.routeInformationProvider,
            routeInformationParser: RouterManager.instance.router.routeInformationParser,
            routerDelegate: RouterManager.instance.router.routerDelegate,
          );
        },
      ),
    );
  }
}
