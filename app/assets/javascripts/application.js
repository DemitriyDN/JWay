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

$(function() {
  SyntaxHighlighter.all();
});
