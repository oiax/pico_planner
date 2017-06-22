$(document).on('turbolinks:load', function() {
  var form = $('form.new_plan_item, form.edit_plan_item');

  if (form.length > 0) {
    console.log('Found!');
  }
});
