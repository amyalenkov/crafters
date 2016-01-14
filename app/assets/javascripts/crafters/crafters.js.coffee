# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#category_id').on 'change', ->
    $.ajax
      url: '/get_subcategory'
      type: 'POST'
      dataType: 'html'
      data:
        category_id: @.options[@.selectedIndex].value
      error: () ->
        console.log('error')
      success: (data) ->
        result = JSON.parse data
        $('#crafter_subcategory_id').attr 'disabled', false
        $('#crafter_subcategory_id').empty()
        for id, name of result
          option = $ '<option>'
          option.attr 'value', id
          option.text name
          $('#crafter_subcategory_id').append option

  $('#crafter_avatar').on 'change', ->
    $('#img_view_upload').attr('src', URL.createObjectURL(@.files[0]));

  $('#crafter_images').on 'change', ->
    $('#img_view_upload').attr('src', URL.createObjectURL(@.files[0]));
    images = $('#div_album_images')
    for i in [1..@.files.length]
#      div = $('<div class="div_for_one_image"><div/>')
      div = $('<div class="upload_images"><div/>')
      div_box = $('<div class="box"><div/>')
      div_image = $('<div class="image"><div/>')
      $('<img/>', {
        "src": URL.createObjectURL(@.files[i-1]),
        "height": 100,
        "width": 100,
      }).appendTo(div_image)
      div_image.appendTo(div_box)
      $('<label class="label_login">Имя изображения</label>').appendTo(div_box)
      $('<input class="upload_images" id="img_name'+i+'" name="img_name'+i+'" type="text" value="">').appendTo(div_box)
      $('<label class="label_login">Описание</label>').appendTo(div_box)
      $('<input class="upload_images" id="img_desc'+i+'" name="img_decs'+i+'" type="text" value="">').appendTo(div_box)

#      div_check_box = $('<div class="checkbox"><div/>')
#      $('<label class="label_for_checkbox">').appendTo(div_check_box)
#      $('<input class="input_checkbox" name="logo'+i+'" type="checkbox" value="1">Использовать как обложку для альбома').appendTo(div_check_box)

#      div_check_box.appendTo(div_box)
#      div_box.appendTo(div)
#      div.appendTo(images)
      div_check_box_label = $('<label class="label_for_checkbox"></label>')
      $('<input class="upload_images set_crafter_album_logo" name="logo'+i+'" type="checkbox" value="1">Использовать как обложку для альбома').appendTo(div_check_box_label)
      div_check_box_label.appendTo(div_check_box)
      div_check_box.appendTo(div_box)
      div_box.appendTo(div)
      div.appendTo(images)

# событие на динамические создаваемые checbox'ы
  $('.modal-body').on 'change', '[type=checkbox]',->
    checked_name = @.name
    inputs = $('.set_crafter_album_logo')
    for input in inputs
      if input.name != checked_name
        input.checked = false