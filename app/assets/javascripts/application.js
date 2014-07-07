//= require jquery
//= require jquery_ujs
//= require_self

//= require ./highlighter/shCore
//= require ./highlighter/shBrushJScript
//= require ./highlighter/shBrushRuby
//= require ./highlighter/shBrushXml
//= require ./highlighter/shBrushSass

//= require_tree ./redactor-rails
//= require_tree ./tags
//= require_tree ./bootstrap

$(function() {
  SyntaxHighlighter.all();

  $('.activate-article').bootstrapSwitch();
  $('.activate-article').on('switchChange.bootstrapSwitch', function(event, state) {
    $.ajax({
      type: "POST",
      url: "/posts/swich_state",
      data: { id: $(this).data('id'), state: state }
    }).done(function() {
      flash = "<div id='flash_message_notification' class='alert alert-success'><strong>Пост поменял состояние </strong></div>"
      $('#main').prepend(flash);

    });
  });
});
