class @EditEmailOrPasswordUser
  constructor:(button_class_name) ->
    @button_class_name = button_class_name
    @utils = new Utils()
    init_validation_for_edit_user()
    @utils.disable_button(@button_class_name)

  validate_edit_user_form: () ->
    if @utils.check_field('user[email]') &&  @utils.check_field('user[current_password]')&&  @utils.check_field('user[password]')&& @utils.check_field('user[password_confirmation]')
      @utils.visible_button(@button_class_name)
    else
      @utils.disable_button(@button_class_name)

  check_field: (field_name) ->
    @utils.check_field(field_name)



init_validation_for_edit_user = () ->
  $('.user_form').validate({
    rules:
      'user[email]':
        required: true,
      'user[current_password]':
        required: true,
      'user[password]':
        minlength: 8
      'user[password_confirmation]':
        equalTo: "#user_password"
    messages:
      'user[email]':
        required: 'Enter correct email!!!!!!!!!!!!!!'
  })
