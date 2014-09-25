// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-datepicker
//= require tinymce
//= require_tree .

$(function() {
  $("#songs_search input").keyup(function() {
    $.get($("#songs_search").attr("action"), $("#songs_search").serialize(), null, "script");
    return false;
  });
  $("#song_arrangements_search input").keyup(function() {
    $.get($("#song_arrangements_search").attr("action"), $("#song_arrangements_search").serialize(), null, "script");
    return false;
  });
  $("#song_arrangement_files_search input").keyup(function() {
    $.get($("#song_arrangement_files_search").attr("action"), $("#song_arrangement_files_search").serialize(), null, "script");
    return false;
  });
  $("#blog_posts_search input").keyup(function() {
    $.get($("#blog_posts_search").attr("action"), $("#blog_posts_search").serialize(), null, "script");
    return false;
  });
  $("#blog_post_tags_search input").keyup(function() {
    $.get($("#blog_post_tags_search").attr("action"), $("#blog_post_tags_search").serialize(), null, "script");
    return false;
  });
});