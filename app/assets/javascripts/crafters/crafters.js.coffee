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
    images = $('.show_album')
    for i in [1..@.files.length]
      div_box = $('<div class="image_box"><div/>')
      $('<button class="delete" name="image'+i+'" type="button">×').appendTo(div_box)

      div_box_left = $('<div class="left"><div/>')
      div_img = $('<div class="img"><div/>')
      div_box_right = $('<div class="right"><div/>')

      $('<img/>', {
        "src": URL.createObjectURL(@.files[i-1]),
      }).appendTo(div_img)

      div_img.appendTo(div_box_left)
      div_box_left.appendTo(div_box)
      div_box.appendTo(images)

      $('<label class="label_login name">Имя изображения</label>').appendTo(div_box_right)
      $('<input class="form-control name" id="img_name'+i+'" name="img_name'+i+'" type="text" value="'+@.files[i-1].name+'">').appendTo(div_box_right)
      $('<label class="label_login description">Описание</label>').appendTo(div_box_right)
      $('<textarea class="form-control description" id="img_desc'+i+'" name="img_decs'+i+'" type="text" value="">').appendTo(div_box_right)
      $('<label class="label_login label_checkbox">Обложка альбома</label>').appendTo(div_box_right)
      $('<input class="set_crafter_album_logo checkbox" name="logo'+i+'" type="checkbox" value="1">').appendTo(div_box_right)

      div_box_right.appendTo(div_box)
      div_box.appendTo(images)


# событие на динамические создаваемые checbox'ы
  $('.modal-body').on 'change', '[type=checkbox]',->
    checked_name = @.name
    inputs = $('.set_crafter_album_logo')
    for input in inputs
      if input.name != checked_name
        input.checked = false
