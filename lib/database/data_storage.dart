import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class DataStorage {
  static const String kDataKey = 'saved_data';

  Future<void> saveData(List<Map<String, dynamic>> data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String> jsonList = data.map((item) => jsonEncode(item)).toList();
    await prefs.setStringList(kDataKey, jsonList);
  }

  Future<List<Map<String, dynamic>>> loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String>? jsonList = prefs.getStringList(kDataKey);
    if (jsonList != null) {
      final List<Map<String, dynamic>> data = jsonList.map((item) {
        return jsonDecode(item) as Map<String, dynamic>;
      }).toList();
      return data;
    }

    return [];
  }

  Future<void> deleteData(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(kDataKey);
    if (jsonList != null) {
      final List<Map<String, dynamic>> data = jsonList.map((item) {
        return jsonDecode(item) as Map<String, dynamic>;
      }).toList();
      final updatedData = data.where((item) => item['id'] != id).toList();
      final updatedJsonList =
          updatedData.map((item) => jsonEncode(item)).toList();
      await prefs.setStringList(kDataKey, updatedJsonList);
    }
  }

  Future<void> deleteAllData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> editData(String id, String newData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(kDataKey);
    if (jsonList != null) {
      final List<Map<String, dynamic>> data = jsonList.map((item) {
        return jsonDecode(item) as Map<String, dynamic>;
      }).toList();
      final updatedData = data.map((item) {
        if (item['id'] == id) {
          return {...item, 'title': newData};
        }
        return item;
      }).toList();
      final updatedJsonList =
          updatedData.map((item) => jsonEncode(item)).toList();
      await prefs.setStringList(kDataKey, updatedJsonList);
    }
  }

}
