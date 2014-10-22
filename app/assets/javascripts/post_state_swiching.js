$(function() {
  $('.activate-article').bootstrapSwitch();
  $('.activate-article').on('switchChange.bootstrapSwitch', function(event, state) {
    $.ajax({
      type: 'PUT',
      url: '/posts/change_state',
      data: { url_link: $(this).data('url-link'), state: state }
    }).done(function() {
      flash = "<div id='flash_message_notification' class='alert alert-success'><strong>Пост поменял состояние </strong></div>"
      $('#main').prepend(flash);
    });
  });
});
