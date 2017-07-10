$(document).on('turbolinks:load', function() {
  var form = $('form.new_plan_item, form.edit_plan_item');

  if (form.length > 0) {
    var checkBox = $('#plan_item_all_day')

    var toggleInputFields = function() {
      var allDay = checkBox.prop('checked');
      form.find('.visible-if-all-day').toggle(allDay);
      form.find('.hidden-if-all-day').toggle(!allDay);
    }

    toggleInputFields();

    checkBox.on('change', toggleInputFields);
  }
});
