import 'package:flutter/material.dart';
import 'package:planningpoker/models/deck.model.dart';
import 'package:planningpoker/models/player.model.dart';
import 'package:planningpoker/models/room.model.dart';
import 'package:planningpoker/models/settings.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static const themeMode = "pp_v3_themeMode";
  static const tapToReveal = "pp_v3_tapToReveal";
  static const vibration = "pp_v3_vibration";
  static const selectedDeck = "pp_v3_selectedDeck";
  static const customDeck = "pp_v3_customDeck";
  static const seenIntro = "pp_v3_seenIntro";
  static const roomId = "pp_v3_roomId";
  static const roomName = "pp_v3_roomName";
  static const username = "pp_v3_username";
  static const currentCard = "pp_v3_currentCard";
}

class Repository {
  /// Save the settings to [SharedPreferences]. Only non-null settings are considered.
  Future<void> saveSettings(Settings settings) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt(Prefs.themeMode, settings.themeMode.index);
    await prefs.setBool(Prefs.tapToReveal, settings.tapToReveal);
    await prefs.setBool(Prefs.vibration, settings.vibration);
    await prefs.setInt(Prefs.selectedDeck, settings.selectedDeck.index);
    await prefs.setStringList(Prefs.customDeck, settings.customDeck);
    await prefs.setBool(Prefs.seenIntro, settings.seenIntro);
  }

  /// Load the settings from [SharedPreferences].
  Future<Settings> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    final defaultSettings = Settings.initialState();

    final themeMode = prefs.getInt(Prefs.themeMode);
    final tapToReveal = prefs.getBool(Prefs.tapToReveal);
    final vibration = prefs.getBool(Prefs.vibration);
    final selectedDeckIndex = prefs.getInt(Prefs.selectedDeck);
    var selectedDeck = defaultSettings.selectedDeck;
    if (selectedDeckIndex != null && selectedDeckIndex.isBetween(0, DeckType.values.length - 1)) {
      selectedDeck = DeckType.values[selectedDeckIndex];
    }
    final customDeck = prefs.getStringList(Prefs.customDeck);
    final seenIntro = prefs.getBool(Prefs.seenIntro);

    return defaultSettings.copyWith(
      themeMode: ThemeMode.values[themeMode ?? 0],
      tapToReveal: tapToReveal,
      vibration: vibration,
      selectedDeck: selectedDeck,
      customDeck: customDeck,
      seenIntro: seenIntro,
    );
  }

  /// Save the room to [SharedPreferences]. Only non-null values are considered.
  Future<void> saveRoom(Room room) async {
    final prefs = await SharedPreferences.getInstance();

    if (room.uid.isNotEmpty) {
      await prefs.setString(Prefs.roomId, room.uid);
    }
    if (room.name.isNotEmpty) {
      await prefs.setString(Prefs.roomName, room.name);
    }
  }

  /// Load the room from [SharedPreferences].
  Future<Room> loadRoom() async {
    final prefs = await SharedPreferences.getInstance();

    final defaultRoom = Room.initialState();

    final roomId = prefs.getString(Prefs.roomId);
    final roomName = prefs.getString(Prefs.roomName);

    return defaultRoom.copyWith(
      uid: roomId,
      name: roomName,
    );
  }

  /// Save the player to [SharedPreferences]. Only non-null values are considered.
  Future<void> savePlayer(Player player) async {
    final prefs = await SharedPreferences.getInstance();

    if (player.username.isNotEmpty) {
      await prefs.setString(Prefs.username, player.username);
    }
    if (player.currentCard != '_') {
      await prefs.setString(Prefs.currentCard, player.currentCard);
    }
  }

  /// Load the player from [SharedPreferences].
  Future<Player> loadPlayer() async {
    final prefs = await SharedPreferences.getInstance();

    final defaultPlayer = Player.initialState();

    final username = prefs.getString(Prefs.username);
    final currentCard = prefs.getString(Prefs.currentCard);

    return defaultPlayer.copyWith(
      username: username,
      currentCard: currentCard,
    );
  }

  Future<void> resetRoomAndPlayer() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(Prefs.roomId);
    await prefs.remove(Prefs.roomName);
    await prefs.remove(Prefs.username);
    await prefs.remove(Prefs.currentCard);
  }
}

/// Range method extension.
extension Range on num {
  /// Checks whether a [num] is between [from] and [to] inclusive.
  bool isBetween(num from, num to) {
    return from <= this && this <= to;
  }
}
