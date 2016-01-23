# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#user_avatar').on 'change', ->
    $('#user_img_view_upload').attr('src', URL.createObjectURL(@.files[0]));
