import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nxt_task/presentation/screens/Reservation/Reservation.dart';
import 'package:sizer/sizer.dart';
import 'common/utils/theme.dart';
import 'data/remote/api_services.dart';



Future<void> main() async {
  await ApiServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return   Sizer(builder: (context, orientation, deviceType) {
      return BlocProvider(
        create: (context) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return MaterialApp(
              theme: themeMode == ThemeMode.light
                  ? ThemeClass.lightTheme
                  : ThemeClass.darkTheme,
              home: const ReservationScreen(),
            );
          },
        ),
      );
    });
  }
}

