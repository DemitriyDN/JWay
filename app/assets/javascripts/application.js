//= require jquery
//= require jquery_ujs
//= require_self

//= require ./highlighter/shCore
//= require ./highlighter/shBrushJScript
//= require ./highlighter/shBrushRuby
//= require ./highlighter/shBrushXml
//= require ./highlighter/shBrushSass

$(function() {
  SyntaxHighlighter.all();
});
