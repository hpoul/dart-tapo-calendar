
class Calendar {
  Element wrapper;
  
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
  
  Calendar(Element this.wrapper) {
    init();
  }
  
  
  void init() {
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
    print("hehe");
  }
}
