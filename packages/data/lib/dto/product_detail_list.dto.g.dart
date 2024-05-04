// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_list.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailListEntity _$ProductDetailListEntityFromJson(
        Map<String, dynamic> json) =>
    ProductDetailListEntity(
      prdDetailId: (json['prdDetailId'] as num?)?.toInt(),
      entranceStartTime: json['entranceStartTime'] as String?,
      entranceEndTime: json['entranceEndTime'] as String?,
      orderNo: (json['orderNo'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductDetailListEntityToJson(
        ProductDetailListEntity instance) =>
    <String, dynamic>{
      'prdDetailId': instance.prdDetailId,
      'entranceStartTime': instance.entranceStartTime,
      'entranceEndTime': instance.entranceEndTime,
      'orderNo': instance.orderNo,
    };
