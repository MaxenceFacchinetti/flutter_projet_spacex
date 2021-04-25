// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lancement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lancement _$LancementFromJson(Map<String, dynamic> json) {
  return $checkedNew('Lancement', json, () {
    final val = Lancement();
    $checkedConvert(json, 'name', (v) => val.name = v as String);
    $checkedConvert(
        json,
        'links',
        (v) => val.links =
            v == null ? null : Links.fromJson(v as Map<String, dynamic>));
    $checkedConvert(json, 'details', (v) => val.details = v as String);
    return val;
  });
}

Map<String, dynamic> _$LancementToJson(Lancement instance) => <String, dynamic>{
      'name': instance.name,
      'links': instance.links?.toJson(),
      'details': instance.details,
    };

Links _$LinksFromJson(Map<String, dynamic> json) {
  return $checkedNew('Links', json, () {
    final val = Links();
    $checkedConvert(
        json,
        'patch',
        (v) => val.patch =
            v == null ? null : Patch.fromJson(v as Map<String, dynamic>));
    return val;
  });
}

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'patch': instance.patch?.toJson(),
    };

Patch _$PatchFromJson(Map<String, dynamic> json) {
  return $checkedNew('Patch', json, () {
    final val = Patch();
    $checkedConvert(json, 'small', (v) => val.small = v as String);
    $checkedConvert(json, 'large', (v) => val.large = v as String);
    return val;
  });
}

Map<String, dynamic> _$PatchToJson(Patch instance) => <String, dynamic>{
      'small': instance.small,
      'large': instance.large,
    };
