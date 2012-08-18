#import('dart:html');

#import('../lib/tapo_calendar.dart');

num rotatePos = 0;

void main() {
  Element placeholder = query('div#placeholder');
  new Calendar(placeholder);
  query("body p").text = "Hello World!";

}
