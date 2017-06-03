$(document).on('turbolinks:load', function() {
  var form = $('form.new_plan_item, form.edit_plan_item');

  if (form.length > 0) {
    function toggleInputFields() {
      var allDay = $('#plan_item_all_day').prop('checked');
      form.find('.visible-if-all-day').toggle(allDay);
      form.find('.hidden-if-all-day').toggle(!allDay);
    }

    toggleInputFields();

    $('#plan_item_all_day').on('change', toggleInputFields);
  }
});