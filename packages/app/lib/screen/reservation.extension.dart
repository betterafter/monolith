
import 'package:app/component/MLColor.dart';
import 'package:flutter/material.dart';

extension ReservationExtension on TextStyle {
  TextStyle selectedDayStyle() {
    return const TextStyle(
      color: MLColor.mlWhite,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    );
  }

  TextStyle unSelectedDayStyle(bool isHoliday) {
    return TextStyle(
      color: isHoliday
              ? MLColor.mlHolidayColor
              : MLColor.mlPrimaryColor,
      fontWeight: FontWeight.w300,
      fontSize: 20,
    );
  }

  TextStyle selectedWeekStyle() {
    return const TextStyle(
      color: MLColor.mlBlue,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    );
  }

  TextStyle unSelectedWeekStyle(bool isToday, bool isHoliday) {
    return TextStyle(
      color: isToday
          ? MLColor.mlTodayColor
          : isHoliday
              ? MLColor.mlHolidayColor
              : MLColor.mlPrimaryColor,
      fontWeight: FontWeight.w300,
      fontSize: 14,
    );
  }
}
