import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/user.dart';

class UserState {
  final String localUserKey = "LOCALUSERKEY";

  createLocalUser(User user) async {
    var box = await Hive.openBox<User>('user');
    box.put(localUserKey, user);
  }

  Future<User> loadLocalUser() async {
    var box = await Hive.openBox<User>('user');
    return box.get(localUserKey);
  }

  Future<void> deleteLocalUser() async {
    var box = await Hive.openBox<User>('user');
    return box.delete(localUserKey);
  }
}
