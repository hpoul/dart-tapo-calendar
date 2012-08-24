#library('tapo_calendar');

#import('dart:html');

#source('tapo_calendar/Calendar.dart');
#source('tapo_calendar/CalendarDatasource.dart');
#source('tapo_calendar/DayDatasource.dart');
#source('tapo_calendar/Event.dart');

#source('tapo_calendar/SimpleDayDatasource.dart');
#source('tapo_calendar/SimpleEvent.dart');

/*
#import('dart:html');

num rotatePos = 0;

void main() {
  query("#text").text = "Click me!";

  query("#text").on.click.add(rotateText);
}

void rotateText(Event event) {
  rotatePos += 360;

  var textElement = query("#text");

  textElement.style.transition = "1s";
  textElement.style.transform = "rotate(${rotatePos}deg)";
}
*/