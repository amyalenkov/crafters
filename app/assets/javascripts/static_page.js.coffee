# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#search').on 'keyup', ->
    search_string = @.value
    if search_string.length >= 3
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
  ul = $('#result_search_ul').empty()
  ul.empty()
  for index of data
    li = $('<li></li>', {
      "class": "li_class"
    })
    create_new_li(li, 'company_name', data[index].company_name)
    create_new_li(li, 'address', data[index].address)
    create_new_li(li, 'city', data[index].city)
    ul.append(li)

create_new_li = (li, div_class_name, data) ->
  div = $('<div></div>', {
    "class": div_class_name
  }).text(data).appendTo(li)
