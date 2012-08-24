
abstract class DayDatasource {
  /**
   * Returns a list of events which start at the current day.
   */
  abstract List<CalendarEvent> getEvents();
  /**
   * Returns the day for which this datasource is responsible.
   */
  abstract Date getDay();
}
