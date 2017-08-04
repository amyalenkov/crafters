class @EditCrafter
  constructor:(button_class_name) ->
    @button_class_name = button_class_name
    @utils = new Utils()
#    init_validation_for_edit_crafter()
    @utils.disable_button(@button_class_name)

  validate_edit_crafter_form: () ->
    if @utils.check_field('crafter[company_name]') && @utils.check_field('crafter[description]') && @utils.check_field('crafter[city]') && @utils.check_field('crafter[address]') && @utils.check_field('crafter[phone_number]') && @utils.check_field('crafter[site]') && @utils.check_field('crafter[work_time]')
      @utils.visible_button(@button_class_name)
    else
      @utils.disable_button(@button_class_name)

  check_field: (field_name) ->
    if field_name == 'crafter[description]'
      @utils.check_textarea_field(field_name)
    else
      @utils.check_field(field_name)

#init_validation_for_edit_crafter = () ->
#  $('.edit_crafter').validate({
#    rules:
#      'crafter[company_name]':
#        required: true,
#      'crafter[description]':
#        required: true,
#        minlength: 8
#      'crafter[city]':
#        required: true
#      'crafter[address]':
#        required: true
#      'crafter[phone_number]':
#        required: true
#      'crafter[contact_person]':
#        required: true
#      'crafter[site]':
#        required: true
#      'crafter[work_time]':
#        required: true
#    messages:
#      'crafter[email]':
#        required: 'Enter correct email!!!!!!!!!!!!!!'
#  })
