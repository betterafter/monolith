import 'package:collection/collection.dart';

import '../entity/date.entity.dart';

class ReservationUiTranslator {
  static final Map<int, String> _weekDay = {
    1: '월',
    2: '화',
    3: '수',
    4: '목',
    5: '금',
    6: '토',
    7: '일'
  };

  static List<DateEntity>? dateTranslatedList(List<DateEntity>? dateList) {
    if (dateList == null) {
      return [];
    }

    dateList.forEachIndexed((index, date) {
      var fullDate = date.date != null ? DateTime.parse(date.date!) : null;

      date.monthString =
          fullDate?.day == 1 || index == 0 ? '${fullDate?.month}월' : null;
      date.dayString = fullDate?.day.toString();

      // var currDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      // 오늘 날짜 하드코딩
      var currDate = '2021-05-05';
      date.isToday = date.date == currDate;
      date.dayOfWeek = date.isToday == true ? '오늘' : _weekDay[fullDate?.weekday];
      date.isSunday = _weekDay[fullDate?.weekday] == '일';
      date.fullDateString =
          '${date.date?.replaceAll('-', '.')} (${date.dayOfWeek})';
    });

    return dateList;
  }
}
