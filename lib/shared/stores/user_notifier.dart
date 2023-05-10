import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserNotifier extends ValueNotifier<UserModel?> {
  UserNotifier() : super(null);

  UserModel? get user => value;

  set user(UserModel? user) => value = user;
}
