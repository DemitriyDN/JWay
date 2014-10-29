$(function() {
  var cuts = $('.summary figure.code.cut'),
      closeCuts;

  closeCuts = function(){
    cuts.find('.highlight').toggle();
  };

  $('.summary figure.code.cut').on('click', function(){
    closeCuts();
  });

  closeCuts();
});
