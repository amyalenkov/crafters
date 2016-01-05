class @Utils

  check_field: (field_name) ->
    $('input[name="'+field_name+'"]').valid();

  disable_button: (button_class_name) ->
    $('.'+button_class_name).prop('disabled', true);

  visible_button: (button_class_name) ->
    $('.'+button_class_name).prop('disabled', false);
