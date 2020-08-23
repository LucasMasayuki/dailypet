import 'package:flutter/widgets.dart';

import 'diary.dart';

class User {
  @required
  final int id;

  @required
  final String first_name;

  @required
  final String last_name;

  @required
  final List<Diary> diaries;

  User(
    this.id,
    this.first_name,
    this.last_name,
    this.diaries,
  );
}
