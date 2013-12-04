$(document).ready(function() {
  $('.jqmWindow').jqm();

  $('[data-form]').each(function(index, ele) {
    $('#' + $(ele).data('form') + '.jqmWindow').jqmAddTrigger($('[data-form=' + $(ele).data('form') + ']'));
  });

});