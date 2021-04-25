import 'package:json_annotation/json_annotation.dart';

part 'lancement.g.dart';

// flutter pub run build_runner build

@JsonSerializable(
  checked: true,
  explicitToJson: true,
  fieldRename: FieldRename.snake
)
  class Lancement{

    String name;
    Links links;
    String details;

    Lancement();

    factory Lancement.fromJson(Map<String, dynamic> json) => _$LancementFromJson(json);
    Map<String, dynamic> toJson() => _$LancementToJson(this);
}

@JsonSerializable(
    checked: true,
    explicitToJson: true,
    fieldRename: FieldRename.snake
)
class Links{


  Patch patch;

  Links();

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
  Map<String, dynamic> toJson() => _$LinksToJson(this);

}

@JsonSerializable(
    checked: true,
    explicitToJson: true,
    fieldRename: FieldRename.snake
)
class Patch{
  String small;
  String large;

  Patch();

  factory Patch.fromJson(Map<String, dynamic> json) => _$PatchFromJson(json);
  Map<String, dynamic> toJson() => _$PatchToJson(this);
}