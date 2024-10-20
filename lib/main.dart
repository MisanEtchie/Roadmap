import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roadmap_game/models/character.dart';
import 'package:roadmap_game/providers/main_provider.dart';
import 'package:roadmap_game/providers/providers.dart';
import 'package:roadmap_game/screens/character_picker/character_picker.dart';
import 'package:roadmap_game/screens/levels/level_view.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferenceProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  // This widget is the root of your application.

  SharedPreferences? _prefs;
  Character? selectedCharacter;

  @override
  void initState() {
    super.initState();
    characterController = ref.read(characterControllerProvider);
    _prefs = ref.read(sharedPreferenceProvider);
    _initializeSharedPreferences();
  }

  void _initializeSharedPreferences() async {
    await _loadSelectedCharacter();
  }

  Future<void> _loadSelectedCharacter() async {
    final characterJson = _prefs?.getString('character');
    if (characterJson != null) {
      final characterMap = jsonDecode(characterJson) as Map<String, dynamic>;
      setState(() {
        selectedCharacter = Character.fromMap(characterMap);
      });
      characterController.add(selectedCharacter!);
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: (selectedCharacter != null) ? LevelView() :CharacterPicker(false)
    );
  }
}


