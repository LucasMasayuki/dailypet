import 'package:flutter/widgets.dart';

import 'package:dailypet/modules/diary/infra/models/pet_model.dart';

class Diary {
  @required
  final int id;

  @required
  final String title;

  @required
  final PetModel pet;

  Diary(
    this.id,
    this.title,
    this.pet,
  );
}
