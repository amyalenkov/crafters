class @UpUser
  constructor: (button_class_name) ->
    @button_class_name = button_class_name
    @utils = new Utils()
    init_validation_for_registered_user()
    @utils.disable_button(@button_class_name)

  validate_registered_user_form: () ->
    if @utils.check_field('user[email]') && @utils.check_field('user[name]') &&  @utils.check_field('user[password]') && @utils.check_field('user[password_confirmation]')
      @utils.visible_button(@button_class_name)
    else
      @utils.disable_button(@button_class_name)

  check_field: (field_name) ->
    @utils.check_field(field_name)

init_validation_for_registered_user = () ->
  $('.new_user').validate({
    rules:
      'user[email]':
        required: true
      'user[name]':
        required: true
      'user[password]':
        required: true,
        minlength: 8
      'user[password_confirmation]':
        required: true,
        equalTo: "#user_password"
    messages:
      'user[name]':
        required: 'Enter your fucking name!!!!!!!!!!!!!!'
  })