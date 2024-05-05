import 'package:collection/collection.dart';

import 'package:domain/entity/date.entity.dart';
import 'package:domain/entity/product.entity.dart';
import 'package:domain/usecase/reservation.usecase.dart';

import 'package:app/bloc/date_selection.event.dart';
import 'package:app/bloc/date_selection.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateSelectionBloc extends Bloc<DateEvent, DateState> {
  final ReservationUsecase reservationUsecase;

  int? _selectedDateIndex;
  ProductEntity? _currentProduct;
  List<DateEntity>? _dateList;
  String? _currentTime;
  String? _currentFullDate;

  DateSelectionBloc(this.reservationUsecase) : super(DateState.initial()) {
    on<DateInitEvent>(_getDate);
    on<DateSelectEvent>(_selectDate);
    on<TimeSelectEvent>(_selectTime);
    on<SelectNextButtonEvent>(_selectNextButton);
  }

  Future<void> _getDate(
    DateInitEvent event,
    Emitter<DateState> emit,
  ) async {
    try {
      _dateList = await reservationUsecase.getDateList();
      var todayIndex = _dateList?.indexWhere((date) => date.isToday == true);

      emit(DateState.initial(
        dateList: _dateList,
        todayIndex: todayIndex ?? 0,
      ));
    } catch (e) {
      emit(DateState.error());
    }
  }

  Future<void> _selectDate(
    DateSelectEvent event,
    Emitter<DateState> emit,
  ) async {
    try {
      var selectDate = event.dateString;
      _currentProduct =
          await reservationUsecase.getReservationInfo(dateString: selectDate);

      _selectedDateIndex = event.selectedIndex;
      _currentFullDate = _selectedDateIndex != null && _dateList != null
          ? _dateList![_selectedDateIndex!].fullDateString
          : null;

      emit(DateSelectedState(
        productName: _currentProduct?.productName,
        productDisplayName: _currentProduct?.productDisplayName,
        riderCount: _currentProduct?.riderCount.toString(),
        timeList: _currentProduct?.timeList,
      ));
    } catch (e) {
      emit(DateState.error());
    }

    return;
  }

  Future<void> _selectTime(
    TimeSelectEvent event,
    Emitter<DateState> emit,
  ) async {
    _currentTime = event.timeSlot;
  }

  Future<void> _selectNextButton(
    SelectNextButtonEvent event,
    Emitter<DateState> emit,
  ) async {
    try {
      var date = '$_currentFullDate $_currentTime';
      var totalPrice = _currentProduct != null &&
              _currentProduct!.riderCount != null &&
              _currentProduct!.ticketPrice != null
          ? (_currentProduct!.ticketPrice! * _currentProduct!.riderCount!)
              .toString()
          : '0';

      var price = '';
      var priceList = totalPrice.split('').reversed.slices(3).toList().reversed;
      print('$totalPrice $priceList');
      priceList.forEachIndexed((index, element) {
        price += element.reversed.join('');
        if (index != priceList.length - 1) {
          price += ',';
        }
      });

      emit(SelectNextButtonState(
        productName: _currentProduct?.productName,
        productDisplayName: _currentProduct?.productDisplayName,
        riderCount: _currentProduct?.riderCount.toString(),
        date: date,
        ticketPrice: price,
      ));
    } catch (e) {
      emit(DateState.error());
    }
  }
}
