import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roadmap_game/models/character.dart';
import 'package:roadmap_game/providers/main_provider.dart';
import 'package:roadmap_game/providers/providers.dart';

import 'package:roadmap_game/screens/levels/level_view.dart';
import 'package:roadmap_game/screens/levels/widget/level_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

late StreamController<Character?> characterController;

class CharacterPicker extends StatefulHookConsumerWidget {
  final bool isNotNew;
  CharacterPicker(this.isNotNew, {super.key});

  @override
  ConsumerState<CharacterPicker> createState() => _CharacterPickerState();
}

class _CharacterPickerState extends ConsumerState<CharacterPicker> {
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
  void dispose() {
    
    super.dispose();
  }

  

  

  Future<void> toggleCharacter(Character character) async {
    if (_prefs != null) {
      final characterJson = jsonEncode(character.toMap());
      await _prefs!.setString('character', characterJson);
      setState(() {
        selectedCharacter = character;
      });

      characterController.add(selectedCharacter);
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            if (widget.isNotNew)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  children: [
                    GestureDetector(
                      //icon: Icon(Icons.home),
                      onTap: () {
                        Navigator.of(context).pop();
                        //player.stop(); // Stop audio when leaving
                      },
                      child: const BackArrowButton(),
                      //color: Colors.white,
                    ),
                    const Spacer(),

                    SizedBox(width: 24,),

                    Container(
                      width: MediaQuery.of(context).size.width - 120,
                      child: const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 12.0),
                                      child: Text(
                                        "Changing character doesn't affect game progress",
                                        maxLines: 2,
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                      ),
                                    ),
                    ),
                    //Text("selected character: ${selectedCharacter?.name ?? "None"}"),
                  ],
                ),
              ),
            if (!widget.isNotNew)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  "Select Your Character",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      // First row of characters
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CharacterPickerImage(
                            character: amCharacter,
                            func: toggleCharacter,
                            selectedCharacter: selectedCharacter,
                          ),
                          CharacterPickerImage(
                            character: bwCharacter,
                            func: toggleCharacter,
                            selectedCharacter: selectedCharacter,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Second row of characters
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CharacterPickerImage(
                            character: lwCharacter,
                            func: toggleCharacter,
                            selectedCharacter: selectedCharacter,
                          ),
                          CharacterPickerImage(
                            character: wwCharacter,
                            func: toggleCharacter,
                            selectedCharacter: selectedCharacter,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Third row of characters
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CharacterPickerImage(
                            character: wmCharacter,
                            func: toggleCharacter,
                            selectedCharacter: selectedCharacter,
                          ),
                          CharacterPickerImage(
                            character: bmCharacter,
                            func: toggleCharacter,
                            selectedCharacter: selectedCharacter,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Fourth row of characters
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CharacterPickerImage(
                            character: awCharacter,
                            func: toggleCharacter,
                            selectedCharacter: selectedCharacter,
                          ),
                          CharacterPickerImage(
                            character: lmCharacter,
                            func: toggleCharacter,
                            selectedCharacter: selectedCharacter,
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
            // Play button at the bottom
            if (!widget.isNotNew && selectedCharacter != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LevelView(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: double.infinity,
                    height: 40,
                    child: const Center(
                      child: Text(
                        "Play",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if (!widget.isNotNew && selectedCharacter == null)
              const SizedBox(height: 16),
          ],
        ),
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

