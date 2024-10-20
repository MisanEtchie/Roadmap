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
        content: Text(

          type == "Game" ? "Are you sure you want to reset the entire game? This will reset your gameplay progress." :
            'Are you sure you want to reset this level? This will reset your gameplay progress for level $level.'),
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
              type == "Game" ?  _resetGame() : _resetLevel();
              Navigator.of(context).pop(); // Close the dialog

              // Optionally, show a confirmation message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text( type == "Game" ? 'Game has been reset.' : 'Level $level has been reset.')),
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
    final levelNotifier = ref.read(levelProvider.notifier);
    final gameplayNotifier = ref.read(gameplayProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // Adjust as needed
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display and modify Level
            Text(
              'Level: $level',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 8),

            ElevatedButton(
  onPressed: () {
    _showResetConfirmationDialog(context, "Game");
  },
  child: const Text('Reset Game'),
),

SizedBox(height: 12,),

ElevatedButton(
  onPressed: () {
    _showResetConfirmationDialog(context, "Level");
  },
  child: const Text('Reset Level'),
),




            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    levelNotifier.decrement();
                  },
                  child: const Text('-'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    levelNotifier.increment();
                  },
                  child: const Text('+'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Set Level',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _levelInput = int.tryParse(value);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (_levelInput != null) {
                      levelNotifier.setLevel(_levelInput!);
                      FocusScope.of(context).unfocus(); // Dismiss keyboard
                    }
                  },
                  child: const Text('Set'),
                ),
              ],
            ),
            const Divider(height: 32),
            // Display and modify Gameplay
            Text(
              'Gameplay: $gameplay',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    gameplayNotifier.decrement();
                  },
                  child: const Text('-'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    gameplayNotifier.increment();
                  },
                  child: const Text('+'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Set Gameplay',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _gameplayInput = int.tryParse(value);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (_gameplayInput != null) {
                      gameplayNotifier.setGameplay(_gameplayInput!);
                      FocusScope.of(context).unfocus(); // Dismiss keyboard
                    }
                  },
                  child: const Text('Set'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}