
class SimpleEvent extends CalendarEvent {
  Date _start;
  Date _end;
  String _title;
  String _body;
  
  SimpleEvent([Date start, Date end, String title, String body]) {
    _start = start;
    _end = end;
    _title = title;
    _body = body;
  }
  
  Date get start => _start;
  Date get end => _end;
  String get title => _title;
  String get body => _body;
}
