import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routes/route_manager.dart';
import 'core/setup/app_env_setup.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'features/home/presentation/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppEnvSetup appEnvSetup = AppEnvSetup();

  await appEnvSetup.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (create) => HomeCubit(),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Clean Architecture with Bloc',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                textTheme:
                    Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
              ),
              home: child,
              onGenerateRoute: RouteManager.generateRoute,
            );
          },
          child: const HomeScreen(),
        ));
  }
}
