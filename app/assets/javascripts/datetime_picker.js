$(document).on('turbolinks:load', function() {
  var icons = {
    time: 'fa fa-clock-o',
    date: 'fa fa-calendar',
    up: 'fa fa-arrow-up',
    down: 'fa fa-arrow-down',
    previous: 'fa fa-chevron-left',
    next: 'fa fa-chevron-right'
  };
  var keyBinds = {
    up: null,
    down: null,
    left: null,
    right: null
  };
  $('.date-picker').datetimepicker({
    locale: 'ja',
    format: 'YYYY-MM-DD',
    dayViewHeaderFormat: 'YYYY年 MMMM',
    icons: icons,
    keyBinds: keyBinds
  });
  $('.time-picker').datetimepicker({
    format: 'HH:mm',
    icons: icons,
    keyBinds: keyBinds
  });
});
