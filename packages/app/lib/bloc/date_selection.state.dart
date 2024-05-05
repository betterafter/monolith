import 'package:domain/entity/date.entity.dart';
import 'package:domain/entity/product.entity.dart';

abstract class DateState {
  const DateState();

  factory DateState.selected(ProductEntity product) = DateSelectedState;

  factory DateState.error() = DateErrorState;

  factory DateState.initial({
    List<DateEntity>? dateList,
    int todayIndex,
  }) = DateInitialState;
}

class DateSelectedState extends DateState {
  final ProductEntity product;

  DateSelectedState(this.product);
}

class DateErrorState extends DateState {}

class DateInitialState extends DateState {
  final List<DateEntity>? dateList;
  final int? todayIndex;

  DateInitialState({this.dateList, this.todayIndex});
}
