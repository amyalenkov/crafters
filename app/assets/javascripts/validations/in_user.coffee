class @InUser
  constructor: (button_class_name) ->
    @button_class_name = button_class_name
    @utils = new Utils()
    init_validation_for_login_user()
    @utils.disable_button(@button_class_name)

  validate_login_user_form: () ->
    if @utils.check_field('user[email]') && @utils.check_field('user[password]')
      @utils.visible_button(@button_class_name)
    else
      @utils.disable_button(@button_class_name)

  check_field: (field_name) ->
    @utils.check_field(field_name)

init_validation_for_login_user = () ->
  $('.login_user').validate({
    rules:
      'user[email]':
        required: true
      'user[password]':
        required: true,
    messages:
      'user[email]':
        required: 'Enter your fucking email!!!!!!!!!!!!!!'
  })