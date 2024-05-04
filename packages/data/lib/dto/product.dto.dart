import 'package:domain/entity/time_list.entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.dto.g.dart';

@JsonSerializable()
/// BasicDto, SundayDto 중 'data'를 위한 클래스
class ProductEntity {
  @JsonKey(name: 'prdId')
  int? prdId;

  @JsonKey(name: 'dplId')
  int? dplId;

  @JsonKey(name: 'productName')
  String? productName;

  @JsonKey(name: 'productDisplayName')
  String? productDisplayName;

  @JsonKey(name: 'reserveDt')
  String? reserveDt;

  @JsonKey(name: 'riderCount')
  int? riderCount;

  @JsonKey(name: 'timeList')
  List<TimeListEntity>? timeList;

  @JsonKey(name: 'ticketPrice')
  int? ticketPrice;

  @JsonKey(name: 'ticketSalePrice')
  int? ticketSalePrice;

  ProductEntity({
    this.dplId,
    this.prdId,
    this.productDisplayName,
    this.productName,
    this.reserveDt,
    this.riderCount,
    this.ticketPrice,
    this.ticketSalePrice,
    this.timeList,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductEntityToJson(this);
}
