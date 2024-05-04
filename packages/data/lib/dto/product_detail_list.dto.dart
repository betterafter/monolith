import 'package:json_annotation/json_annotation.dart';

part 'product_detail_list.dto.g.dart';

@JsonSerializable()
/// basic과 sunday의 productDetailList를 위한 클래스
class ProductDetailListDto {
  @JsonKey(name: 'prdDetailId')
  int? prdDetailId;

  @JsonKey(name: 'entranceStartTime')
  String? entranceStartTime;

  @JsonKey(name: 'entranceEndTime')
  String? entranceEndTime;

  @JsonKey(name: 'orderNo')
  int? orderNo;

  ProductDetailListDto({
    this.prdDetailId,
    this.entranceStartTime,
    this.entranceEndTime,
    this.orderNo,
  });

  factory ProductDetailListDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailListDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailListDtoToJson(this);
}
