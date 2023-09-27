import 'dart:developer';

import 'package:hive/hive.dart';

class LocalDb {
  String boxName = "password";
  String key = "pinkod";

  ///add
  Future<void> add(int pin, String key) async {
    var box = await Hive.openBox(boxName);
    box.put(key, pin);
    log('saved');
  }

  ///get
  Future<int?> get(String key) async {
    try {
      var box = await Hive.openBox(boxName);
      final result = box.get(key);
      return result;
    } catch (e) {
      return null;
    }
  }

  ///delete
  Future<void> delete(String key) async {
    var box = await Hive.openBox(boxName);
    box.delete(key);
  }
}
