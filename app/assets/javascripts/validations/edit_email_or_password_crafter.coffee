class @EditEmailOrPasswordCrafter
  constructor:(button_class_name) ->
    @button_class_name = button_class_name
    @utils = new Utils()
    init_validation_for_edit_crafter()
    @utils.disable_button(@button_class_name)

  validate_edit_crafter_form: () ->
    if @utils.check_field('crafter[email]') &&  @utils.check_field('crafter[current_password]')&&  @utils.check_field('crafter[password]')&& @utils.check_field('crafter[password_confirmation]')
      @utils.visible_button(@button_class_name)
    else
      @utils.disable_button(@button_class_name)

  check_field: (field_name) ->
    @utils.check_field(field_name)



init_validation_for_edit_crafter = () ->
  $('.crafter_form').validate({
    rules:
      'crafter[email]':
        required: true,
      'crafter[current_password]':
        required: true,
      'crafter[password]':
        minlength: 8
      'crafter[password_confirmation]':
        equalTo: "#crafter_password"
    messages:
      'crafter[email]':
        required: 'Enter correct email!!!!!!!!!!!!!!'
  })
