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
      div = $('<div class="div_for_one_image"><div/>')
      $('<input name="Лого альбома" type="checkbox" value="1">').appendTo(div)
      $('<input class="form-control" id="img_name'+i+'" name="img_name'+i+'" type="text" value="">').appendTo(div)
      $('<input class="form-control" id="img_desc'+i+'" name="img_decs'+i+'" type="text" value="">').appendTo(div)
      $('<img/>', {
        "src": URL.createObjectURL(@.files[i-1]),
        "height": 100,
        "width": 100
      }).appendTo(div)
      div.appendTo(images)