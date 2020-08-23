import 'package:flutter/widgets.dart';

class Pet {
  @required
  final int id;

  @required
  final String name;

  @required
  final String description;

  Pet(
    this.id,
    this.name,
    this.description,
  );
}
