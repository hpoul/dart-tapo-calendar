
class Calendar {
  Element wrapper;
  
  // For now we only support one day, so we only need the day datasource.
  DayDatasource _dayds;
  
  int _hourHeight = 60;
  int _minuteFactor = 15;
  double _hourMultiplier;
  double _timeFrameHeight;
  
  static final String TEMPLATE = '''
<div class="tapo-calendar">
  <div class="cal-wrapper">
    <table class="cal-table">
      <tr>
        <td class="cal-timecol-placeholder"></td>
        <td>
          <div class="cal-timegrid-wrapper">
            <div class="cal-timegrid">
              <!-- this will include the time grid (the background grid) -->
            </div>
          </div>
        </td>
      </tr>
      <tr>
        <td class="cal-timecol">
          <!-- this will include the time labels -->
        </td>
        <td class="cal-datescol">
          <!-- this will include the actual date events. -->
        </td>
      </tr>
    </table>
  </div>
</div>
''';
  static final String TEMPLATE_EVENT = '''
<div class="cal-event ui-corner-all ui-droppable">
  <div class="cal-event-titlebar">
    <span class="cal-event-time">09:40 - 12:24</span>
    <span class="cal-event-title">Example Title</span>
    <!--a style="float: right;"><img src="/media/saas/images/openerp/listgrid/delete_inline.gif"></a-->
  </div>
  <div class="cal-event-body-wrapper">
    <input type="text" class="cal-event-body">
  </div>
  <div class="cal-event-resize"></div>
</div>
''';
  
  Calendar(Element this.wrapper) {
    _hourMultiplier = 60 / _minuteFactor;
    _timeFrameHeight = _hourHeight / _hourMultiplier;
  }
  
  
  void init(DayDatasource dayds) {
    _dayds = dayds;
    _init();
  }
  
  void _init() {
    Element el = new Element.html(TEMPLATE);
    Element timecol = el.query('.cal-timecol');
    Element timegrid = el.query('.cal-timegrid');
    for(num i = 0 ; i < 24 ; i++) {
      String hour = i < 10 ? "0${i}" : i.toString();
      Element hourLabel = new Element.html('''<div class="cal-timelabel-wrapper"><div class="cal-timelabel">${hour}:00</div></div>''');
      timecol.nodes.add(hourLabel);
      
      Element gridLine = new Element.html('''<div class="cal-timegrid-hour"><div class="cal-timegrid-hour-half"></div></div>''');
      timegrid.nodes.add(gridLine);
    }
    wrapper.nodes.add(el);
    
    _updateEventDisplays();
  }
  
  String _formatTime(Date date) {
    String hour = date.hour < 10 ? "0${date.hour}" : "${date.hour}";
    String minute = date.minute < 10 ? "0${date.minute}" : "${date.minute}";
    return "${hour}:${minute}";
  }
  
  
  void _updateEventDisplays() {
    List<CalendarEvent> events = _dayds.getEvents();
    DivElement eventWrapper = new DivElement();
    eventWrapper.classes.add("cal-eventlistwrapper");
    for (CalendarEvent event in events) {
      Element elEvent = new Element.html(TEMPLATE_EVENT);
      
      String start = _formatTime(event.start);
      String end = _formatTime(event.end);
      elEvent.query('.cal-event-time').text = "${start} - ${end}";
      elEvent.query('.cal-event-title').text = event.title;
      elEvent.query('input.cal-event-body').value = event.body;
      
      // calculate x coordinate
      Date startDate = event.start;
      int quarters = ((event.start.hour * _hourMultiplier) + (event.start.minute / _minuteFactor)).round().toInt();
      int endquarters = ((event.end.hour * _hourMultiplier) + (event.end.minute / _minuteFactor)).round().toInt();
      print("${event.start.hour}, ${event.start.minute} - ${event.end.hour} /// ${(event.start.hour * _hourMultiplier + event.start.minute) / _minuteFactor} -- startquarters: ${quarters} end: ${endquarters}");
      int top = (quarters * _timeFrameHeight).toInt();
      int height = ((endquarters - quarters) * _timeFrameHeight).toInt();
      print("timeframeheight: ${_timeFrameHeight}");
      elEvent.style.height = "${height}px";
      elEvent.style.top = "${top}px";
      
      eventWrapper.nodes.add(elEvent);
    }
    
    wrapper.query('.cal-datescol').nodes.add(eventWrapper);
  }
}
