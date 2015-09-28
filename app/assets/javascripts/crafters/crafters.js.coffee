# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#category_id').on 'change', ->
    $.ajax
      url: '/get_services'
      type: 'POST'
      dataType: 'html'
      data:
        category_id: @.options[@.selectedIndex].value
      error: () ->
        console.log('error')
      success: (data) ->
        console.log('success ' +data)
        result = JSON.parse data
        $('#service_id').attr 'disabled', false
        $('#service_id').empty()
        for id, name of result
          console.log "#{id} - #{name}"
          option = $ '<option>'
          option.attr 'value', id
          option.text name
          $('#service_id').append option

