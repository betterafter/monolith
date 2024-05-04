// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductEntity _$ProductEntityFromJson(Map<String, dynamic> json) =>
    ProductEntity(
      dplId: (json['dplId'] as num?)?.toInt(),
      prdId: (json['prdId'] as num?)?.toInt(),
      productDisplayName: json['productDisplayName'] as String?,
      productName: json['productName'] as String?,
      reserveDt: json['reserveDt'] as String?,
      riderCount: (json['riderCount'] as num?)?.toInt(),
      ticketPrice: (json['ticketPrice'] as num?)?.toInt(),
      ticketSalePrice: (json['ticketSalePrice'] as num?)?.toInt(),
      timeList: (json['timeList'] as List<dynamic>?)
          ?.map((e) => TimeListEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductEntityToJson(ProductEntity instance) =>
    <String, dynamic>{
      'prdId': instance.prdId,
      'dplId': instance.dplId,
      'productName': instance.productName,
      'productDisplayName': instance.productDisplayName,
      'reserveDt': instance.reserveDt,
      'riderCount': instance.riderCount,
      'timeList': instance.timeList,
      'ticketPrice': instance.ticketPrice,
      'ticketSalePrice': instance.ticketSalePrice,
    };
