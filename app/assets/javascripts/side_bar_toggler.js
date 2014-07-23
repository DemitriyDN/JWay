$(function() {
  var sidebarToggleInit = function(){
    var toggleArrow = $('.sidebar_closing div'),
        sideBar = $('#sidebar'),
        post = $('.post'),
        content = $('#content'),
        comments_wrapper = $('#comments-wrapper');

    if ( localStorage['full_view'] === 'true' ){
      toggleArrow.addClass('left').removeClass('right');

      sideBar.addClass('closed_sidebar');
      post.addClass('opened_post');
      content.addClass('opened_content');
      comments_wrapper.addClass('opened_comments');
    };


    $('.sidebar_closing').on('click', function(){
      if ( localStorage['full_view'] === 'true' ){
        localStorage['full_view'] = 'false';

        toggleArrow.addClass('right').removeClass('left');

        sideBar.animate({ width: 280 });
        post.animate({ width: 620 });
        content.animate({ width: 890 });
        comments_wrapper.animate({ width: 620 });
      } else {
        localStorage['full_view'] = 'true';

        toggleArrow.addClass('left').removeClass('right');

        sideBar.animate({ width: 0 });
        post.animate({ width: 905 });
        content.animate({ width: 1170 });
        comments_wrapper.animate({ width: 905 });
      }
    })
  }

  if ($('body').hasClass('posts') && $('body').hasClass('show')){
    sidebarToggleInit();
  };
});
