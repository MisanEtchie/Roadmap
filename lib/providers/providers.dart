// providers.dart or any appropriate file
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadmap_game/models/character.dart';

final characterControllerProvider = Provider<StreamController<Character?>>((ref) {
  final controller = StreamController<Character?>.broadcast();
  ref.onDispose(() {
    controller.close();
  });
  return controller;
});


final loveControllerProvider = Provider<StreamController<Character?>>((ref) {
  final controller = StreamController<Character?>.broadcast();
  ref.onDispose(() {
    controller.close();
  });
  return controller;
});
