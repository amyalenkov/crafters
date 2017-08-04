class @UpCrafter
  constructor:(button_class_name) ->
    @button_class_name = button_class_name
    @utils = new Utils()
#    init_validation_for_registered_crafter()
    @utils.disable_button(@button_class_name)

  validate_registered_crafter_form: () ->
    if @utils.check_field('crafter[company_name]') && @utils.check_field('crafter[email]') && @utils.check_field('crafter[city]')  && @utils.check_field('crafter[address]') && @utils.check_field('crafter[phone_number]') && @utils.check_field('crafter[password]') && @utils.check_field('crafter[password_confirmation]')
      @utils.visible_button(@button_class_name)
    else
      @utils.disable_button(@button_class_name)

  check_field: (field_name) ->
    @utils.check_field(field_name)

#init_validation_for_registered_crafter = () ->
#  $('.new_crafter').validate({
#    rules:
#      'crafter[email]':
#        required: true
#      'crafter[company_name]':
#        required: true
#      'crafter[password]':
#        required: true,
#        minlength: 8
#      'crafter[password_confirmation]':
#        required: true,
#        equalTo: "#crafter_password"
#    messages:
#      'crafter[company_name]':
#        required: 'Enter company_name!!!!!!!!!!!!!!'
#  })
