$(document).on('turbolinks:load', function() {
  $('.date-picker').datetimepicker({
    locale: 'ja',
    format: 'YYYY-MM-DD',
    dayViewHeaderFormat: 'YYYY年 MMMM',
    icons: {
      previous: 'fa fa-chevron-left',
      next: 'fa fa-chevron-right'
    }
  });
  $('.time-picker').datetimepicker({
    format: 'HH:mm',
    icons: {
      up: 'fa fa-arrow-up',
      down: 'fa fa-arrow-down',
    }
  });
});
