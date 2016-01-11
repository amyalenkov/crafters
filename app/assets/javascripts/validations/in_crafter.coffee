class @InCrafter
  constructor:(button_class_name) ->
    @button_class_name = button_class_name
    @utils = new Utils()
    init_validation_for_login_crafter()
    @utils.disable_button(@button_class_name)

  validate_login_crafter_form: () ->
    if @utils.check_field('crafter[email]') && @utils.check_field('crafter[password]')
      @utils.visible_button(@button_class_name)
    else
      @utils.disable_button(@button_class_name)

  check_field: (field_name) ->
    @utils.check_field(field_name)

init_validation_for_login_crafter = () ->
  $('.login_crafter').validate({
    rules:
      'crafter[email]':
        required: true
      'crafter[password]':
        required: true,
    messages:
      'crafter[email]':
        required: 'Enter correct email!!!!!!!!!!!!!!'
  })
