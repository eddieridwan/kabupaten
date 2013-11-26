// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

  $(".multiselect").multiselect({
    selectedList: 4
  });

  $('input.enable_submit').on('input', function() {
    if ($(this).val() != '') {
      $('input.enable_on_input').removeAttr("disabled");
    } else {
      // check other enable submit fields for this form
      var trigger_fields = $(this.form).find('.enable_submit');
      // disable submit only if all fields are ''
      var has_input = false;
      trigger_fields.each(function(e) {
        if ($(this).val() != '') {
          has_input = true;
        }
      });
      if (has_input === false) {
        $('input.enable_on_input').attr("disabled", "disabled");
      }
    };
  });

  $('#kabupaten_name').on('input', function() {
    if ($(this).val() === '') {
      $('#filter_kabupaten_id').val('');
    };
  });

});