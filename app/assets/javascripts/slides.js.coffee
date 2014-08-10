# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

findOrCreateCommentArea = (comment) ->
  ul = $('<ul>').attr('page', comment.page_number)
  if $(".comments ul").size() == 0
    $(".comments").append(ul)
  else if $(".comments ul[page=#{comment.page_number}]").size() == 0
    pages = $(".comments ul").filter (index) ->
      $(@).attr('page') < comment.page_number

    if pages.size() == 0
      $(".comments").append(ul)
    else
      $(pages).last().after(ul)
  $(".comments ul[page=#{comment.page_number}]")

addComment = (comment) ->
  li = $('<li>').text("#{comment.page_number}: #{comment.content}")
  findOrCreateCommentArea(comment).append(li)

$(document).on 'page:change', ->
  if $('.slide').size() > 0
    $('#new_comment').bind 'ajax:complete', ->
      $('#comment_content').val('')

    $.ajax "#{location.pathname}/comments.json"
      .done (json) ->
        for comment in json
          addComment(comment)

    setInterval ->
      page_num = $('iframe').contents().find('.goToSlideLabel input').val()
      $('#comment_page_number').val(page_num)
      $(".comments ul[page=#{page_num}]").addClass('active')
      $(".comments ul[page!=#{page_num}]").removeClass('active')
    , 1000
