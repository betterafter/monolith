import 'package:domain/extension.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'date.entity.g.dart';

@JsonSerializable()
class DateEntity {
  @JsonKey(name: 'dplId')
  int? dplId;

  @JsonKey(name: 'date')
  String? date;

  @JsonKey(name: 'enabled')
  bool? enabled;

  @JsonKey(name: 'holidayYn')
  bool? holidayYn;

  // 2024.05.05 (월)
  String? fullDateString;

  // 월화수목금토일
  String? dayOfWeek;

  DateEntity({this.dplId, this.date, this.enabled, this.holidayYn}) {
    var week = date != null ? DateTime.parse(date!).weekday : null;
    dayOfWeek = week != null ? weekDay[week] : null;
    fullDateString = date?.replaceAll('-', '.');
  }

  factory DateEntity.fromJson(Map<String, dynamic> json) =>
      _$DateEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DateEntityToJson(this);
}
