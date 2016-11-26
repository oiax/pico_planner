$(document).on('turbolinks:load', function() {
  $('.datetime-picker').datetimepicker({
    locale: 'ja',
    format: 'YYYY-MM-DD HH:mm',
    dayViewHeaderFormat: 'YYYY年 MMMM',
    focusOnShow: false,
    icons: {
      time: 'fa fa-clock-o',
      date: 'fa fa-calendar',
      up: 'fa fa-arrow-up',
      down: 'fa fa-arrow-down',
      previous: 'fa fa-chevron-left',
      next: 'fa fa-chevron-right'
    }
  });
});
