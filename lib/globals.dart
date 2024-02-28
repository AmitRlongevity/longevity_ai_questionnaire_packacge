import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

late WidgetRef appRef;

abstract class EnvironmentVariables{
  static const mailUser = String.fromEnvironment('MAIL_USER', defaultValue: '');
  static const mailPassword = String.fromEnvironment('MAIL_PASSWORD', defaultValue: '');
  static const version = String.fromEnvironment('VERSION', defaultValue: 'PROD');
}

const designSize = Size(450, 945);

late BuildContext globalContext;

const String kAppVersion = '0.0.1+31';

late final FragmentProgram kScaleShader;

Size kWindowSize = const Size(0, 0);