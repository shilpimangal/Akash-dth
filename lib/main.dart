import 'package:Akash/presenter/logic/navigation/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/routes/app_routes.dart';
import 'config/theme/app_theme.dart';
import 'package:url_strategy/url_strategy.dart';

import 'di/injection_container.dart';

Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
      create: (context) => sl.get<NavigationCubit>(),
      child: MaterialApp.router(
        routerConfig: sl.get<AppRoutes>().router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          //textTheme: textTheme,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          //textTheme: textTheme,
        ),
      ),
    );
  }
}
