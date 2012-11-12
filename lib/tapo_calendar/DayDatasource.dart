part of tapo_calendar;

abstract class DayDatasource {
  /**
   * Returns a list of events which start at the current day.
   */
  List<CalendarEvent> getEvents();
  /**
   * Returns the day for which this datasource is responsible.
   */
  Date getDay();
}
