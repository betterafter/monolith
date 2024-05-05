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

  bool isToday = false;

  bool isSunday = false;

  // 5월, 6월...
  String? monthString;

  // 1 2 3 4 5...
  String? dayString;

  // 2024.05.05 (월)
  String? fullDateString;

  // 월화수목금토일
  String? dayOfWeek;

  DateEntity({this.dplId, this.date, this.enabled, this.holidayYn});

  factory DateEntity.fromJson(Map<String, dynamic> json) =>
      _$DateEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DateEntityToJson(this);

  @override
  String toString() {
    return '''{
      dplId: $dplId,
      date: $date,
      enabled: $enabled,
      holidayYn: $holidayYn,
      monthString: $monthString,
      fullDateString: $fullDateString,
      dayOfWeek: $dayOfWeek
    }
    ''';
  }
}
