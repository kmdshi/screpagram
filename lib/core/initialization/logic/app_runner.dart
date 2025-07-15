import 'dart:async';

import 'package:screpagram/core/initialization/logic/composition_root.dart';
import 'package:screpagram/core/initialization/widget/root_context.dart';
import 'package:screpagram/core/utils/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

sealed class AppRunner {
  AppRunner._();

  static Future<void> startup() async {
    await runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      final compositionResult = await const CompositionRoot().compose();
      runApp(RootContext(compositionResult: compositionResult));
    }, (error, stack) {
      debugPrint('Unhandled error: $error');
    });
  }
}
