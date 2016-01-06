jQuery ->
  registered_crafter = new UpCrafter('register-btn-crafter')
  login_crafter = new InCrafter('btn-login-crafter')
  edit_crafter = new EditCrafter('btn-edit-crafter')
  edit_email_or_password_crafter = new EditEmailOrPasswordCrafter('edit-email-or-password-crafter-btn')
  edit_email_or_password_user = new EditEmailOrPasswordUser('edit-email-or-password-user-btn')
  registered_user = new UpUser('register-btn-user')
  login_user = new InUser('btn-login-user')

  $('input.crafter_registration').on 'keyup', ->
    registered_crafter.check_field(@.name)
    registered_crafter.validate_registered_crafter_form()

  $('select[name="category[id]"]').on 'change', ->
    registered_crafter.validate_registered_crafter_form()

  $('input.user_registration').on 'keyup', ->
    registered_user.check_field(@.name)
    registered_user.validate_registered_user_form()

  $('input.login_crafter').on 'keyup', ->
    login_crafter.check_field(@.name)
    login_crafter.validate_login_crafter_form()

  $('input.login_user').on 'keyup', ->
    login_user.check_field(@.name)
    login_user.validate_login_user_form()

  $('input.edit_crafter').on 'keyup', ->
    edit_crafter.check_field(@.name)
    edit_crafter.validate_edit_crafter_form()

  $('input.edit_email_or_password_crafter').on 'keyup', ->
    edit_email_or_password_crafter.check_field(@.name)
    edit_email_or_password_crafter.validate_edit_crafter_form()

  $('input.edit_email_or_password_user').on 'keyup', ->
    edit_email_or_password_user.check_field(@.name)
    edit_email_or_password_user.validate_edit_user_form()

