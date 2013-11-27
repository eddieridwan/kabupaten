// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

  $('input.enable_submit').on('input', function() {
    if ($(this).val() != "") {
      $('input.enable_on_input').removeAttr("disabled");
    } else {
      $('input.enable_on_input').attr("disabled", "disabled");
    };
  });

});