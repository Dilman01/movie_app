import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart' as path_provider;

import 'di/get_it.dart' as getIt;
import 'presentation/movie_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

// only support portrait orientation
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));

  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  // Hive.registerAdapter(MovieTableAdapter());

// Initializinh GetIt to provide the dependencies.
  unawaited(getIt.init());

  runApp(const MovieApp());
}
