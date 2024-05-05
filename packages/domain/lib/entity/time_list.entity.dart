import 'package:domain/entity/product_detail_list.entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'time_list.entity.g.dart';

@JsonSerializable()
/// basic, sunday의 timeList를 위한 클래스
class TimeListEntity {
  @JsonKey(name: 'timeSlot')
  String? timeSlot;

  @JsonKey(name: 'stcDetailId')
  String? stcDetailId;

  @JsonKey(name: 'stockStartTime')
  String? stockStartTime;

  @JsonKey(name: 'stockEndTime')
  String? stockEndTime;

  @JsonKey(name: 'stockUseYn')
  bool? stockUseYn;

  @JsonKey(name: 'stockCount')
  int? stockCount;

  @JsonKey(name: 'totStockCount')
  int? totStockCount;

  @JsonKey(name: 'enabled')
  bool? enabled;

  @JsonKey(name: 'operationStopYn')
  bool? operationStopYn;

  @JsonKey(name: 'appOnlyYn')
  bool? appOnlyYn;

  @JsonKey(name: 'productDetailList')
  List<ProductDetailListEntity>? productDetailList;

  @JsonKey(name: 'optionList')
  List<dynamic>? optionList;

  @JsonKey(name: 'stockStatusStr')
  String? stockStatusStr;

  @JsonKey(name: 'stockStatus')
  int? stockStatus;

  bool? soldOut;

  TimeListEntity({
    this.enabled,
    this.operationStopYn,
    this.optionList,
    this.productDetailList,
    this.stcDetailId,
    this.stockCount,
    this.stockEndTime,
    this.stockStartTime,
    this.stockStatus,
    this.stockStatusStr,
    this.stockUseYn,
    this.timeSlot,
    this.totStockCount,
    this.appOnlyYn,
  });

  factory TimeListEntity.fromJson(Map<String, dynamic> json) =>
      _$TimeListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TimeListEntityToJson(this);

  @override
  String toString() {
    return '''{
      enabled: $enabled,
      operationStopYn: $operationStopYn,
      optionList: $optionList,
      productDetailList: $productDetailList,
      stcDetailId: $stcDetailId,
      stockCount: $stockCount,
      stockEndTime: $stockEndTime,
      stockStatus: $stockStatus,
      stockStatusStr: $stockStatusStr,
      stockUseYn: $stockUseYn,
      timeSlot: $timeSlot,
      totStockCount: $totStockCount,
    }''';
  }
}
