// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_list.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailListDto _$ProductDetailListDtoFromJson(
        Map<String, dynamic> json) =>
    ProductDetailListDto(
      prdDetailId: (json['prdDetailId'] as num?)?.toInt(),
      entranceStartTime: json['entranceStartTime'] as String?,
      entranceEndTime: json['entranceEndTime'] as String?,
      orderNo: (json['orderNo'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductDetailListDtoToJson(
        ProductDetailListDto instance) =>
    <String, dynamic>{
      'prdDetailId': instance.prdDetailId,
      'entranceStartTime': instance.entranceStartTime,
      'entranceEndTime': instance.entranceEndTime,
      'orderNo': instance.orderNo,
    };
