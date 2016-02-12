# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#search').on 'focusout', ->
#    $('#search_result').hide()

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
          live_search(data,search_string)
    else
#      $('#search_result').hide()

  $('#search_text_value').on 'keyup', ->
    search_string = @.value
    if search_string.length >= 3
      cities = $('.cities')
      subcategories = $('.subcategories')
      if $('#full_search').checked == true
        send_search_full_request search_string
      else
        send_search_request search_string, get_checked_elements(cities), get_checked_subcategories(subcategories)

  $('#search_text_value_in_subcategory').on 'keyup', ->
    search_string = @.value
    if search_string.length >= 3
      cities = $('.cities_for_subcategory')
      subcategory = $('#subcategory').val()
      console.log(subcategory)
      send_search_request search_string, get_checked_elements(cities), subcategory


  $('.cities').on 'change', ->
    cities = $('.cities')
    subcategories = $('.subcategories')
    send_search_request $('#search_text_value').val(), get_checked_elements(cities), get_checked_subcategories(subcategories)

  $('.cities_for_subcategory').on 'change', ->
    cities = $('.cities_for_subcategory')
    subcategory = $('#subcategory').val()
    send_search_request $('#search_text_value').val(), get_checked_elements(cities), subcategory

  $('.subcategories').on 'change', ->
    cities = $('.cities')
    subcategories = $('.subcategories')
    send_search_request $('#search_text_value').val(), get_checked_elements(cities), get_checked_subcategories(subcategories)

  $('.categories').on 'click', ->
    category_id = @.id
    all_subcategories = $('.subcategories')
    for i in [0..all_subcategories.size() - 1]
      current_category = $('#' + all_subcategories[i].id).attr('catygory')
      if current_category == category_id
        all_subcategories[i].checked = true
      else
        all_subcategories[i].checked = false
    cities = $('.cities')
    subcategories = $('.subcategories')
    send_search_request $('#search_text_value').val(), get_checked_elements(cities), get_checked_subcategories(subcategories)

get_checked_elements = (elements) ->
  result_cities = new String()
  checked_cities = new Array()
  for i in [0..elements.size() - 1]
    if elements[i].checked == true
      checked_cities.push(elements[i].name)
  for i in [0...len = checked_cities.length]
    result_cities = result_cities + checked_cities[i]
    if i != checked_cities.length - 1
      result_cities = result_cities + '|'
  return result_cities

get_checked_subcategories = (elements) ->
  result_subcategories = new Array()
  for i in [0..elements.size() - 1]
    if elements[i].checked == true
      result_subcategories.push(elements[i].name)
  return result_subcategories

send_search_request = (search, result_cities, result_subcategories) ->
  $.ajax
    type: 'POST'
    url: '/search_new_ajax'
    data: { cities: result_cities, subcategories: result_subcategories, search: search}
    error: (jqXHR, textStatus, errorThrown) ->
      console.log('error')
    success: (data, textStatus, jqXHR) ->
      console.log('success')

send_search_full_request = (search) ->
  $.ajax
    type: 'POST'
    url: '/search_ajax_full'
    data: { search: search}
    error: (jqXHR, textStatus, errorThrown) ->
      console.log('error')
    success: (data, textStatus, jqXHR) ->
      console.log('success')

live_search = (data,search_request) ->
  ul = $('#result_search_ul').empty()
  ul.empty()
  for index of data
    if index < 3
      li = $('<li></li>', {
        "class": "li_class"
      })
      a = $('<a></a>', {
        "href":"/crafters/#{data[index].id}",
        "class": "a_class"
      })
      add_image_tag(li, data[index].avatar.url)
      create_new_li(li, 'company_name', data[index].company_name)
      create_new_li(li, 'description_search', data[index].description)
      create_new_li(li, 'address', data[index].address)
      create_new_li(li, 'city', data[index].city)

      a.append(li)

      ul.append(a)
    else
      url = "/search?utf8=✓&search="+search_request+"&commit=OK"
      li = $('<li><a id="all_results" class="all_results" href='+url+'>Просмотреть все результаты</a></li>', {
        "class": "li_class"
      })
      ul.append(li)
      break


create_new_li = (li, div_class_name, data) ->
  div = $('<div></div>', {
    "class": div_class_name
  }).text(data).appendTo(li)

add_image_tag = (li, image_src) ->
  image = $('<img/>', {
    "src": "/assets/" + image_src,
    "class": "company_logo"
  }).appendTo(li)
