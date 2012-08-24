
class SimpleDayDatasource extends DayDatasource {
  List<CalendarEvent> _events;
  Date _day;
  
  SimpleDayDatasource(this._day, this._events);
  
  List<CalendarEvent> getEvents() => _events;
  Date getDay() => _day;
}
