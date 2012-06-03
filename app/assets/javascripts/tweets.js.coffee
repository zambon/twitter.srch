# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# How to make it global?
# setup_latest_queries_elements = () ->
#   $('.query_srch').hide()
#   
#   $('.queries li').mouseover( () ->
#     $(this).children('.query_srch').show()
#   )
#   $('.queries li').mouseout( () ->
#     $(this).children('.query_srch').hide()
#   )
#   $('.queries li').click( () ->
#     q = $(this).children('.query_info').children('.text').html()
#     from_user = $(this).children('.query_info').children('p.from_user').html()
#     language = $(this).children('.query_info').children('p.language').html()
#     
#     $('#latest_query_q, #query_q').val(q) if q?
#     $('#latest_query_from_user, #query_from_user').val(from_user) if from_user?
#     $('#latest_query_language, #query_language').val(language) if language?
#     
#     $('.spinner').show()
#     $('#latest').submit()
#   )

$(document).ready( () ->
  $('.spinner').hide()
  
  $('form[data-remote=true]').each( (index, value) ->
    $(value).submit( () ->
      $('.spinner').show()
    )
  )
  
  $('#advanced_form').hide()
  $('#clear_form_button').hide()
  
  $('#toggle_forms_button').click( (event) ->
    event.preventDefault()
    if $('#simple_form:visible').html() == null
      $(this).text('advanced')
      $('#simple_form').show()
      $('#advanced_form').hide()
      $('#clear_form_button').hide()
    else
      $(this).text('simple')
      $('#simple_form').hide()
      $('#advanced_form').show()
      $('#clear_form_button').show()
  )
  
  $('#clear_form_button').click( (event) ->
    event.preventDefault()
    $('#latest_query_q, #query_q').val(null)
    $('#latest_query_from_user, #query_from_user').val(null)
    $('#latest_query_language, #query_language').val(null)
  )
  
  setup_latest_queries_elements()
);
