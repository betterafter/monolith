// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_list.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeListEntity _$TimeListEntityFromJson(Map<String, dynamic> json) =>
    TimeListEntity(
      enabled: json['enabled'] as bool?,
      appOnlyYn: json['appOnlyYn'] as bool?,
      operationStopYn: json['operationStopYn'] as bool?,
      optionList: json['optionList'] as List<dynamic>?,
      productDetailList: (json['productDetailList'] as List<dynamic>?)
          ?.map((e) =>
              ProductDetailListEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      stcDetailId: json['stcDetailId'] as String?,
      stockCount: (json['stockCount'] as num?)?.toInt(),
      stockEndTime: json['stockEndTime'] as String?,
      stockStartTime: json['stockStartTime'] as String?,
      stockStatus: (json['stockStatus'] as num?)?.toInt(),
      stockStatusStr: json['stockStatusStr'] as String?,
      stockUseYn: json['stockUseYn'] as bool?,
      timeSlot: json['timeSlot'] as String?,
      totStockCount: (json['totStockCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TimeListEntityToJson(TimeListEntity instance) =>
    <String, dynamic>{
      'timeSlot': instance.timeSlot,
      'stcDetailId': instance.stcDetailId,
      'stockStartTime': instance.stockStartTime,
      'stockEndTime': instance.stockEndTime,
      'stockUseYn': instance.stockUseYn,
      'stockCount': instance.stockCount,
      'totStockCount': instance.totStockCount,
      'enabled': instance.enabled,
      'operationStopYn': instance.operationStopYn,
      'appOnlyYn': instance.appOnlyYn,
      'productDetailList': instance.productDetailList,
      'optionList': instance.optionList,
      'stockStatusStr': instance.stockStatusStr,
      'stockStatus': instance.stockStatus,
    };
