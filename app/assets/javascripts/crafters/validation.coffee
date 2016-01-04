jQuery ->
  $('.new_crafter').validate({
    rules:
      'crafter[email]':
        required: true
      'crafter[company_name]':
        required: true
      'crafter[password]':
        required: true,
        minlength: 8
      'crafter[password_confirmation]':
        required: true,
        equalTo: "#crafter_password"
    messages:
      'crafter[company_name]':
        required: 'Enter company_name!!!!!!!!!!!!!!'
  })

  $('.register-btn').prop('disabled', true);

  $('input').on 'keyup', ->
    check_field(@.name)
    disabled_register_btn()

  $('select').on 'change', ->
    disabled_register_btn()


check_field = (field_name) ->
  $('input[name="'+field_name+'"]').valid();

disabled_register_btn = () ->
  if check_field('crafter[company_name]') && check_field('crafter[email]') && check_field('crafter[password]') && check_field('crafter[password_confirmation]')
    if $('#category_id').val() != ''
      $('.register-btn').prop('disabled', false);
    else
      $('.register-btn').prop('disabled', true);
  else
    $('.register-btn').prop('disabled', true);
