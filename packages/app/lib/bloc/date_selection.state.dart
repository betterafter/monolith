import 'dart:ui';

import 'package:domain/entity/date.entity.dart';
import 'package:domain/entity/time_list.entity.dart';

abstract class DateState {
  const DateState();

  factory DateState.selected({
    String? productName,
    String? productDisplayName,
    String? riderCount,
    List<TimeListEntity>? timeList,
  }) = DateSelectedState;

  factory DateState.error() = DateErrorState;

  factory DateState.initial({
    List<DateEntity>? dateList,
    int todayIndex,
  }) = DateInitialState;
}

class DateSelectedState extends DateState {
  final String? productName;
  final String? productDisplayName;
  final String? riderCount;
  final List<TimeListEntity>? timeList;

  DateSelectedState({
    this.productName,
    this.productDisplayName,
    this.riderCount,
    this.timeList,
  });
}

class DateErrorState extends DateState {}

class DateInitialState extends DateState {
  final List<DateEntity>? dateList;
  final int? todayIndex;

  DateInitialState({this.dateList, this.todayIndex});
}
