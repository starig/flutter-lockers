import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lockers/config/colors.dart';
import 'package:lockers/config/routes.dart';
import 'package:lockers/cubits/lockers/lockers_cubit.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => LockersCubit())),
      ],
      child: MaterialApp(
        title: "Lockers",
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: routes,
        theme: ThemeData(
            fontFamily: "Manrope",
            scaffoldBackgroundColor: bgHeader,
            appBarTheme: AppBarTheme(
              backgroundColor: bgHeader,
            )),
      ),
    );
  }
}
