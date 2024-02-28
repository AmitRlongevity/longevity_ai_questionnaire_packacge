library longevity_ai_questionnaire;

import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:longevity_ai_questionnaire/ui/router/root_router.dart';


import 'firebase_options.dart';
import 'globals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  kScaleShader = await FragmentProgram.fromAsset('shaders/scale_shader.frag');
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    appRef = ref;
    globalContext = context;
    kWindowSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      //minTextAdapt: true,
      designSize: designSize,
      builder: (context, _) => Builder(
          builder: (context) {
            return MaterialApp.router(
              title: 'New User Questionnaire',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                //useMaterial3: true,
              ),
              routerConfig: AppRouter.config(),
              color: Colors.transparent,
            );
          }
      ),
    );
  }
}