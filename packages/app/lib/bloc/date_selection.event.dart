abstract class DateEvent {
  const DateEvent();

  factory DateEvent.init() = DateInitEvent;

  factory DateEvent.select(String dateString) = DateSelectEvent;

  factory DateEvent.timeSelect(String? timeSlot) = TimeSelectEvent;
}

class DateInitEvent extends DateEvent {

}

class DateSelectEvent extends DateEvent {
  final String dateString;
  final int? selectedIndex;

  DateSelectEvent(this.dateString, {this.selectedIndex});
}

class TimeSelectEvent extends DateEvent {
  final String? timeSlot;

  TimeSelectEvent(this.timeSlot);
}

class SelectNextButtonEvent extends DateEvent {

}
