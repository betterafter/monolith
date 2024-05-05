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
    )
      ..isToday = json['isToday'] as bool?
      ..isSunday = json['isSunday'] as bool?
      ..monthString = json['monthString'] as String?
      ..dayString = json['dayString'] as String?
      ..fullDateString = json['fullDateString'] as String?
      ..dayOfWeek = json['dayOfWeek'] as String?;

Map<String, dynamic> _$DateEntityToJson(DateEntity instance) =>
    <String, dynamic>{
      'dplId': instance.dplId,
      'date': instance.date,
      'enabled': instance.enabled,
      'holidayYn': instance.holidayYn,
      'isToday': instance.isToday,
      'isSunday': instance.isSunday,
      'monthString': instance.monthString,
      'dayString': instance.dayString,
      'fullDateString': instance.fullDateString,
      'dayOfWeek': instance.dayOfWeek,
    };
