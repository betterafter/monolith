abstract class DateEvent {
  const DateEvent();

  factory DateEvent.init() = DateInitEvent;

  factory DateEvent.select(String dateString) = DateSelectEvent;
}

class DateInitEvent extends DateEvent {

}

class DateSelectEvent extends DateEvent {
  final String dateString;

  DateSelectEvent(this.dateString);
}

