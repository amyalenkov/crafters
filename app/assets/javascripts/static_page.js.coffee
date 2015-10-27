# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#search').on 'keyup', ->
    search_string = @.value
    if search_string.length >= 1
      $.ajax
        type: 'POST'
        url: '/search_ajax'
        data: { search: search_string }
        error: (jqXHR, textStatus, errorThrown) ->
          console.log('error')
        success: (data, textStatus, jqXHR) ->
          console.log('success')
          live_search(data)

live_search = (data) ->
  console.log(data)
