import 'package:json_annotation/json_annotation.dart';

enum IngredientType {
  @JsonValue('egg')
  egg,
  @JsonValue('flour')
  flour,
  @JsonValue('sugar')
  sugar,
  @JsonValue('salt')
  salt,
  @JsonValue('pepper')
  pepper,
}
