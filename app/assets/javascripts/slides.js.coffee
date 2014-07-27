# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#new_comment input[type="submit"]').click ->
    page_num = $('iframe').contents().find('.goToSlideLabel input').val()
    $('#comment_page_number').val(page_num)
