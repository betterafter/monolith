// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateEntity _$DateEntityFromJson(Map<String, dynamic> json) => DateEntity(
      dplId: (json['dplId'] as num?)?.toInt(),
      date: json['date'] as String?,
      enabled: json['enabled'] as bool?,
      holidayYn: json['holidayYn'] as bool?,
    );

Map<String, dynamic> _$DateEntityToJson(DateEntity instance) =>
    <String, dynamic>{
      'dplId': instance.dplId,
      'date': instance.date,
      'enabled': instance.enabled,
      'holidayYn': instance.holidayYn,
    };
