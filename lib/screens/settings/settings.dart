import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roadmap_game/providers/main_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String levelKey = 'level';
const String gameplayKey = 'gameplay';

class LevelState extends StateNotifier<int> {
  LevelState(this._prefs) : super(_prefs.getInt(levelKey) ?? 1);

  final SharedPreferences _prefs;

  void setLevel(int newLevel) {
    state = newLevel;
    _prefs.setInt(levelKey, state);
  }

  void increment() {
    setLevel(state + 1);
  }

  void decrement() {
    if (state > 0) {
      setLevel(state - 1);
    }
  }
}

final levelProvider = StateNotifierProvider<LevelState, int>((ref) {
  final prefs = ref.read(sharedPreferenceProvider);
  return LevelState(prefs);
});

// Gameplay StateNotifier and Provider
class GameplayState extends StateNotifier<int> {
  GameplayState(this._prefs) : super(_prefs.getInt(gameplayKey) ?? 0);

  final SharedPreferences _prefs;

  void setGameplay(int newGameplay) {
    state = newGameplay;
    _prefs.setInt(gameplayKey, state);
  }

  void increment() {
    setGameplay(state + 1);
  }

  void decrement() {
    if (state > 0) {
      setGameplay(state - 1);
    }
  }
}

final gameplayProvider = StateNotifierProvider<GameplayState, int>((ref) {
  final prefs = ref.read(sharedPreferenceProvider);
  return GameplayState(prefs);
});

// Settings Page
class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  ConsumerState<Settings> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  int? _levelInput;
  int? _gameplayInput;

  void _showResetConfirmationDialog(BuildContext context, String type) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final level = ref.watch(levelProvider);

        return AlertDialog(
          title: const Text('Reset Game'),
          content: Text(type == "Game"
              ? "Are you sure you want to reset the entire game? This will reset your gameplay progress."
              : 'Are you sure you want to reset this level? This will reset your gameplay progress for level $level.'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                // Perform the reset action
                type == "Game" ? _resetGame() : _resetLevel();
                Navigator.of(context).pop(); // Close the dialog

                // Optionally, show a confirmation message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(type == "Game"
                          ? 'Game has been reset.'
                          : 'Level $level has been reset.')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _resetGame() {
    // Reset level and gameplay using Riverpod notifiers
    ref.read(levelProvider.notifier).setLevel(1);
    ref.read(gameplayProvider.notifier).setGameplay(0);

    // Reset any additional state variables if necessary
    setState(() {
      _levelInput = null;
      _gameplayInput = null;
    });
  }

  void _resetLevel() {
    // Reset level and gameplay using Riverpod notifiers
    //ref.read(levelProvider.notifier).setLevel(1);
    ref.read(gameplayProvider.notifier).setGameplay(0);

    // Reset any additional state variables if necessary
    setState(() {
      //_levelInput = null;
      _gameplayInput = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Watch the current level and gameplay values
    final level = ref.watch(levelProvider);
    final gameplay = ref.watch(gameplayProvider);

    // Obtain the notifiers to modify the values

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // Adjust as needed
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: Text(
              "Settings",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            )),
            const SizedBox(height: 24),
            SizedBox(
              width:
                  double.infinity, // Makes the button stretch across the screen
              child: ElevatedButton(
                onPressed: () {
                  _showResetConfirmationDialog(context, "Game");
                },
                style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue, // Set the background color to blue
      elevation: 0, // Remove the elevation
    ),
                child: const Text('Reset Game', style: TextStyle(color: Colors.white),),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width:
                  double.infinity, // Makes the button stretch across the screen
              child: ElevatedButton(
                onPressed: () {
                  _showResetConfirmationDialog(context, "Level");
                },
                style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue, // Set the background color to blue
      elevation: 0, // Remove the elevation
    ),
                child: const Text('Reset Level', style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
