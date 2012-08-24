#import('dart:html');

#import('../lib/tapo_calendar.dart');

num rotatePos = 0;

/**
 * Create a few example events..
 */
DayDatasource prepareDayDatasource() {
  Date now = new Date.now();
  Date today = new Date(now.year, now.month, now.day);
  
  List<CalendarEvent> events = new List();
  // create a example event from 9 to 11
  
  
  CalendarEvent event1 = new SimpleEvent(
      start: today.add(new Duration(hours: 5)),
      end: today.add(new Duration(hours: 6)),
      title: "First Event",
      body: "With some descriptive text. (Scroll down for the second event ;) )");
  events.add(event1);

  
  CalendarEvent event2 = new SimpleEvent(
      start: today.add(new Duration(hours: 9)),
      end: today.add(new Duration(hours: 11)),
      title: "Test Event",
      body: "Some long description about this event");
  
  events.add(event2);
  
  return new SimpleDayDatasource(today, events);
}

void main() {
  Element placeholder = query('div#placeholder');
  Calendar c = new Calendar(placeholder);
  //c.setDatasource()
  c.init(prepareDayDatasource());
  
  query("body p").text = "Hello World!";

}
