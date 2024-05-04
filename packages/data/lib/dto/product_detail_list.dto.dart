import 'package:json_annotation/json_annotation.dart';

part 'product_detail_list.dto.g.dart';

@JsonSerializable()
/// basic과 sunday의 productDetailList를 위한 클래스
class ProductDetailListEntity {
  @JsonKey(name: 'prdDetailId')
  int? prdDetailId;

  @JsonKey(name: 'entranceStartTime')
  String? entranceStartTime;

  @JsonKey(name: 'entranceEndTime')
  String? entranceEndTime;

  @JsonKey(name: 'orderNo')
  int? orderNo;

  ProductDetailListEntity({
    this.prdDetailId,
    this.entranceStartTime,
    this.entranceEndTime,
    this.orderNo,
  });

  factory ProductDetailListEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailListEntityToJson(this);
}
