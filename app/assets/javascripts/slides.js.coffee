# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'page:change', ->
  if $('.slide').size() > 0
    $('#new_comment').bind 'ajax:complete', ->
      $('#comment_content').val('')

    $.ajax "#{location.pathname}/comments.json"
      .done (json) ->
        for comment in json
          ul = $(".comments ul.page_#{comment.page_number}")
          if ul.size() == 0
            $(".comments").append("<ul class='page_#{comment.page_number}'></ul>")
            ul = $(".comments ul.page_#{comment.page_number}")
          ul.append("<li>#{comment.page_number}: #{comment.content}</li>")

    setInterval ->
      page_num = $('iframe').contents().find('.goToSlideLabel input').val()
      $('#comment_page_number').val(page_num)
      $(".comments ul.page_#{page_num}").addClass('active')
      $(".comments ul:not(.page_#{page_num})").removeClass('active')
    , 1000
