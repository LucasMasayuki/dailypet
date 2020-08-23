import 'package:flutter/widgets.dart';

import 'pet.dart';

class Diary {
  @required
  final int id;

  @required
  final String title;

  @required
  final Pet pet;

  Diary(
    this.id,
    this.title,
    this.pet,
  );
}
