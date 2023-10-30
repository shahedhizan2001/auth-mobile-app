import 'dart:io';

import 'package:auth/commen/helper/dependencie_injection.config.dart';
import 'package:auth/feature/auth/presentation/state/auth_bloc.dart';
import 'package:auth/feature/auth/presentation/ui/secreens/profile_secreen.dart';
import 'package:auth/feature/auth/presentation/ui/secreens/register_secreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'commen/helper/dependencie_injection.dart';
import 'commen/service/storage_service.dart';
import 'feature/auth/presentation/ui/secreens/login_secreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await getIt.allReady();
  await StorageService.init();
  StorageService.getIsChecked();
  runApp(BlocProvider(create: (context) => GetIt.I<AuthBloc>(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (_ , child) {
    return MaterialApp(
    routes: {
      'Login':(context) => Log_in(),
      'Register':(context) => Register(),
      'Profile':(context)=> Profile()
    },
      home: StorageService.getIsChecked()==true?Profile():Log_in(),
    debugShowCheckedModeBanner: false,
    );
    }
    );
  }
}