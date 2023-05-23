import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lockers/cubits/lockers/lockers_cubit.dart';
import 'package:lockers/screens/home_screen.dart';
import 'package:lockers/screens/splash.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LockersCubit>().getLockers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LockersCubit, LockersState>(
      builder: (context, state) {
        if (state.isLoaded) {
          return HomeScreen();
        } else {
          return SplashScreen();
        }
      },
    );
  }
}
