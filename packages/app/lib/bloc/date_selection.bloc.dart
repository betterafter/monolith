import 'package:domain/usecase/reservation.usecase.dart';

import 'package:app/bloc/date_selection.event.dart';
import 'package:app/bloc/date_selection.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateSelectionBloc extends Bloc<DateEvent, DateState> {
  final ReservationUsecase reservationUsecase;

  DateSelectionBloc(this.reservationUsecase) : super(DateState.initial()) {
    on<DateInitEvent>(_getDate);
    on<DateSelectEvent>(_selectDate);
  }

  Future<void> _getDate(
    DateInitEvent event,
    Emitter<DateState> emit,
  ) async {
    try {
      var dateList = await reservationUsecase.getDateList();
      var todayIndex = dateList?.indexWhere((date) => date.isToday);

      emit(DateState.initial(
        dateList: dateList,
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
      var product =
          await reservationUsecase.getReservationInfo(dateString: selectDate);

      print('[keykat] product: $product');
    } catch (e) {
      emit(DateState.error());
    }

    return;
  }
}
