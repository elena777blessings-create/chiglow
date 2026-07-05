import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/energy_models.dart';

/// Service for persisting and loading Harmony Journal entries.
class JournalStorage {
  static const String _storageKey = 'chiglow_journal_entries';

  /// Save all journal entries to local storage.
  static Future<void> saveEntries(List<JournalEntry> entries) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = entries.map((e) => e.toJson()).toList();
    await prefs.setString(_storageKey, jsonEncode(jsonList));
  }

  /// Load all journal entries from local storage.
  static Future<List<JournalEntry>> loadEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storageKey);
    if (raw == null || raw.isEmpty) return [];
    final List<dynamic> jsonList = jsonDecode(raw);
    return jsonList.map((j) => JournalEntry.fromJson(j as Map<String, dynamic>)).toList();
  }

  /// Add a single entry and persist.
  static Future<void> addEntry(JournalEntry entry) async {
    final entries = await loadEntries();
    entries.insert(0, entry); // newest first
    await saveEntries(entries);
  }

  /// Delete an entry by id and persist.
  static Future<void> deleteEntry(String id) async {
    final entries = await loadEntries();
    entries.removeWhere((e) => e.id == id);
    await saveEntries(entries);
  }
}