import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roadmap_game/models/character.dart';
import 'package:roadmap_game/providers/main_provider.dart';
import 'package:roadmap_game/providers/providers.dart';
import 'package:roadmap_game/screens/character_picker/character_picker.dart';

import 'package:roadmap_game/screens/levels/level_view.dart';
import 'package:roadmap_game/screens/levels/widget/level_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

late StreamController<Character?> loveController;

class LovePicker extends StatefulHookConsumerWidget {
  LovePicker({super.key});

  @override
  ConsumerState<LovePicker> createState() => _LovePickerState();
}

class _LovePickerState extends ConsumerState<LovePicker> {
  SharedPreferences? _prefs;
  Character? selectedLove;

  List<Character> loveCharacters = [
    love1Character,
    love2Character,
    love3Character,
    love4Character,
  ];

  @override
  void initState() {
    super.initState();
    loveController = ref.read(loveControllerProvider);
    _initializeSharedPreferences();
  }

  Future<void> _initializeSharedPreferences() async {
    _prefs = await ref.read(sharedPreferenceProvider);
    await _loadSelectedLove();
  }

  Future<void> _loadSelectedLove() async {
    final loveJson = _prefs?.getString('love');
    if (loveJson != null) {
      final loveMap = jsonDecode(loveJson) as Map<String, dynamic>;
      setState(() {
        selectedLove = Character.fromMap(loveMap);
      });
      loveController.add(selectedLove!);
    }
  }

  @override
  void dispose() {
    //loveController.close(); // Close StreamController to avoid memory leaks
    super.dispose();
  }

  // Future<void> toggleCharacter(Character love) async {
  //   if (_prefs != null) {
  //     final loveJson = jsonEncode(love.toMap());
  //     await _prefs!.setString('love', loveJson); // Save the selected love character
  //     setState(() {
  //       selectedLove = love;
  //     });
  //     loveController.add(selectedLove); // Update StreamController with the selected character
  //   }
  // }


Future<void> toggleCharacter(Character love) async {
  if (_prefs != null) {
    try {
      final loveJson = jsonEncode(love.toMap());

      // Save the selected love character and wait for it to complete
      await _prefs!.setString('love', loveJson);

      // Once saved, update the UI state and notify the StreamController
      setState(() {
        selectedLove = love;
      });

      loveController.add(selectedLove); // Update StreamController with the selected character
    } catch (e) {
      print("Failed to save love character: $e");
    }
  }
}

  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: loveCharacters.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Adjust as needed
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: 1, // Adjust based on image dimensions
        ),
        itemBuilder: (context, index) {
          final character = loveCharacters[index];
          return CharacterPickerImage(
            character: character,
            func: toggleCharacter,
            selectedCharacter: selectedLove,
          );
        },
      ),
    );
  }
}



class CharacterPickerImage extends StatefulWidget {
  CharacterPickerImage({
    super.key, 
    required this.character, 
    required this.func, 
    required this.selectedCharacter,
  });

  final Character character;
  final Function(Character) func;
  final Character? selectedCharacter; // All

  @override
  State<CharacterPickerImage> createState() => _CharacterPickerImageState();
}

class _CharacterPickerImageState extends State<CharacterPickerImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.func(widget.character);
      },
      child: Container(
        decoration: BoxDecoration(
          border:  Border.all(color:widget.selectedCharacter == widget.character ? Colors.blue : Colors.transparent, width: 4),// Blue border if selected
             
          borderRadius: BorderRadius.circular(100),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            height: MediaQuery.of(context).size.width * 0.4,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Image(
              image: AssetImage(widget.character.defaultImage),
            ),
          ),
        ),
      ),
    );
  }
}

