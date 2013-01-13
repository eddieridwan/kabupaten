$(document).ready(function() {
  $('.translate').click(function() {
    var source_element = $('#' + $(this).attr('source'));
    var translated_text = $('.translated_text', this);
    var original_text = $('.original_text', this);
    if ($('.translate_text', this).is(':visible')) {
      if (translated_text.text().trim() == '') {
        original_text.html(source_element.html());
        $.post('/translate/translate', { content: source_element.html() }, function(data) {
          source_element.html(data);
          translated_text.html(data);
        });
      };
      source_element.html(translated_text.html());
    } else {
      source_element.html(original_text.html());
    };
    $('.translate_text', this).toggle();
    $('.untranslate_text', this).toggle();
  });
});