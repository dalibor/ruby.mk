// remap jQuery to $
(function ($) {
  $(function () {
    SyntaxHighlighter.defaults['toolbar'] = false;
    SyntaxHighlighter.all();

    $('#tweets_container').tweets({username: 'mk_rug', limit: 3});
  })
})(this.jQuery);
