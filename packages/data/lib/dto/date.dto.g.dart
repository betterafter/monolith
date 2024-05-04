// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateDto _$DateDtoFromJson(Map<String, dynamic> json) => DateDto(
      dplId: (json['dplId'] as num?)?.toInt(),
      date: json['date'] as String?,
      enabled: json['enabled'] as bool?,
      holidayYn: json['holidayYn'] as bool?,
    );

Map<String, dynamic> _$DateDtoToJson(DateDto instance) => <String, dynamic>{
      'dplId': instance.dplId,
      'date': instance.date,
      'enabled': instance.enabled,
      'holidayYn': instance.holidayYn,
    };
