import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'di/get_it.dart' as getIt;
import 'presentation/movie_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

// only support portrait orientation
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));

// Initializinh GetIt to provide the dependencies.
  unawaited(getIt.init());

  runApp(const MovieApp());
}
