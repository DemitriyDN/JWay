//= require jquery
//= require jquery_ujs
//= require_self

//= require_tree ./tags
//= require_tree ./bootstrap

//= require markitup
//= require markitup/sets/markdown/set

$(function() {
myMarkdownSettings = {
    resizeHandle: 'false',

    nameSpace: 'markdownEditor',
    markupSet: [
        {name:'Heading 1', key:"1", openWith:'# ', placeHolder:'Title...' },
        {name:'Heading 2', key:"2", openWith:'## ', placeHolder:'Title...' },
        {name:'Heading 3', key:"3", openWith:'### ', placeHolder:'Title...' },
        {name:'Heading 4', key:"4", openWith:'#### ', placeHolder:'Title...' },
        {name:'Heading 5', key:"5", openWith:'##### ', placeHolder:'Title...' },
        {name:'Heading 6', key:"6", openWith:'###### ', placeHolder:'Title...' },
        {separator:'---------------' },

        {name: 'Horizontal line', openWith:'***'},
        {name:'Bold', key:"B", openWith:'**', closeWith:'**'},
        {name:'Italic', key:"I", openWith:'_', closeWith:'_'},
        {name: 'Italic', openWith:'*', closeWith:'*'},
        {name: 'Stroke', openWith:'~~', closeWith:'~~'},

        {separator:'---------------' },
        {name:'Bulleted List', openWith:'- ' },
        {name:'Numeric List', openWith:function(markItUp) {
            return markItUp.line+'. ';
        }},
        {separator:'---------------' },
        {name:'Picture', key:"P", replaceWith:'![[![Alternative text]!]]([![Url:!:http://]!] "[![Title]!]")'},
        {name:'Link', key:"L", openWith:'[', closeWith:']([![Url:!:http://]!] "[![Title]!]")', placeHolder:'Your text to link here...' },
        {separator:'---------------'},
        {name:'Code Block / Code', openWith:'(!(\t|!|`)!)', closeWith:'(!(`)!)'},




        // {name:'Date',
        //  className:"date",
        //  replaceWith:function() {
        //     var date = new Date()
        //     var weekday = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
        //     var monthname = ["January","February","March","April","May","June","July","August","September","October","November","December"];
        //     var D = weekday[date.getDay()];
        //     var d = date.getDate();
        //     var m = monthname[date.getMonth()];
        //     var y = date.getFullYear();
        //     var h = date.getHours();
        //     var i = date.getMinutes();
        //     var s = date.getSeconds();
        //     return (D +" "+ d + " " + m + " " + y + " " + h + ":" + i + ":" + s);
        //  }
        // }


    ]
}


  $('.undoreset #post_body').markItUp(myMarkdownSettings)

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
