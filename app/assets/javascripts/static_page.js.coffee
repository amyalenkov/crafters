# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#search').on 'focusout', ->
    $('#search_result').hide()
  $('#search').on 'keyup', ->
    search_string = @.value
    if search_string.length >= 3
      $('#search_result').show()
      $.ajax
        type: 'POST'
        url: '/search_ajax'
        data: { search: search_string }
        error: (jqXHR, textStatus, errorThrown) ->
          console.log('error')
        success: (data, textStatus, jqXHR) ->
          console.log('success')
          live_search(data)
    else
      $('#search_result').hide()

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
    add_image_tag(li, data[index].avatar.url)
    ul.append(li)

create_new_li = (li, div_class_name, data) ->
  div = $('<div></div>', {
    "class": div_class_name
  }).text(data).appendTo(li)

add_image_tag = (li, image_src) ->
  image = $('<img/>', {
    "src": "/assets/"+image_src,
    "height": 100,
    "width": 100
  }).appendTo(li)
