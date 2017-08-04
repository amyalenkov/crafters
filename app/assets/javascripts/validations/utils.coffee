#ready = ->
class @Utils
  check_field: (field_name) ->
    if field_name == 'crafter[description]'
      validate_field(field_name, $('textarea[name="'+field_name+'"]')[0].value);
    else
      validate_field(field_name, $('input[name="'+field_name+'"]')[0].value);

  check_textarea_field: (field_name) ->
    $('textarea[name="'+field_name+'"]').valid();

  disable_button: (button_class_name) ->
    $('.'+button_class_name).prop('disabled', true);

  visible_button: (button_class_name) ->
    $('.'+button_class_name).prop('disabled', false);


validate_field = (field_name, value) ->
  if /\[name\]$/.test(field_name)
    parent = document.getElementById(field_name.replace('[', '_').replace(']', ''));
    if value.length > 1
      removeErrorText(parent);
      return true
    else
      addErrorText(parent, 'Минимальная длина Имени - 2 символа')
      return false

  else if /\[email\]$/.test(field_name)
    parent = document.getElementById(field_name.replace('[', '_').replace(']', ''));
    if /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) and validate_unique(field_name, value)
      removeErrorText(parent);
      return true
    else
      addErrorText(parent, 'Введите корректный email (пример: email@email.com)')
      return false

  else if /\[password\]$/.test(field_name)
    parent = document.getElementById(field_name.replace('[', '_').replace(']', ''));
    if value.length > 7
      removeErrorText(parent);
      return true
    else
      addErrorText(parent, 'Минимальная длина Пароля - 8 символов')
      return false

  else if /\[password_confirmation\]$/.test(field_name)
    parent = document.getElementById(field_name.replace('[', '_').replace(']', ''));
    if value == $('input[name="user[password]"]')[0].value && /user/.test(field_name)
      removeErrorText(parent);
      return true
    else if value == $('input[name="crafter[password]"]')[0].value && /crafter/.test(field_name)
      removeErrorText(parent);
      return true
    else
      addErrorText(parent, 'Пароли не совпадают')
      return false

  else if /\[company_name\]$/.test(field_name) and validate_unique(field_name, value)
    parent = document.getElementById(field_name.replace('[', '_').replace(']', ''));
    if value.length > 2
      removeErrorText(parent);
      return true
    else
      addErrorText(parent, 'Минимальная длина Имени компании - 3 символа')
      return false

  else if /\[city\]$/.test(field_name)
    parent = document.getElementById(field_name.replace('[', '_').replace(']', ''));
    if value.length > 2
      removeErrorText(parent);
      return true
    else
      addErrorText(parent, 'Минимальная длина поля Город - 3 символа')
      return false

  else if /\[address\]$/.test(field_name)
    parent = document.getElementById(field_name.replace('[', '_').replace(']', ''));
    if value.length > 4
      removeErrorText(parent);
      return true
    else
      addErrorText(parent, 'Минимальная длина поля Адрес - 5 символа')
      return false

  else if /\[phone_number\]$/.test(field_name)
    parent = document.getElementById(field_name.replace('[', '_').replace(']', ''));
    if value.length > 10 && /\d+/.test(value)
      removeErrorText(parent);
      return true
    else
      addErrorText(parent, 'Минимальная длина номера телефона - 11 цифр')
      return false

  else if /\[site\]$/.test(field_name)
    parent = document.getElementById(field_name.replace('[', '_').replace(']', ''));
    if value.length > 2
      removeErrorText(parent);
      return true
    else
      addErrorText(parent, 'Минимальная длина поля - 3 символа')
      return false

  else if /\[work_time\]$/.test(field_name)
    parent = document.getElementById(field_name.replace('[', '_').replace(']', ''));
    if value.length > 2
      removeErrorText(parent);
      return true
    else
      addErrorText(parent, 'Минимальная длина поля - 3 символа')
      return false

  else if /\[description\]$/.test(field_name)
    parent = document.getElementById(field_name.replace('[', '_').replace(']', ''));
    if value.length > 50
      removeErrorText(parent);
      return true
    else
      addErrorText(parent, 'Минимальная длина поля - 50 символ')
      return false

  else
    return false


validate_unique = (field_name, value) ->
  parent = document.getElementById(field_name.replace('[', '_').replace(']', ''));
  buttonRegCrafter = document.getElementById('button_reg_crafter');
  buttonEditCrafter = document.getElementById('button_edit_crafter');

  if /\[company_name\]$/.test(field_name) && buttonRegCrafter
    removeErrorText(parent);
    BreakException = {};
    crafterCompnyName = document.getElementById('crafter_company_name');

    $.ajax
      type:'GET',
      url:'/get_all_crafters_and_users',
      success: (response) ->
        try
          for crafter in response.crafters
            if crafter.company_name == crafterCompnyName.value
              removeErrorText(parent);

              if buttonRegCrafter
                buttonRegCrafter.disabled = true;

              error_text = createElement(crafterCompnyName, 'Данное Имя компании уже зарегистрирован');
              fadeIn(error_text, 'inline-block');
              setTimeout(fadeOut(error_text), 10000);
              return false;
              throw BreakException;
          return true;

        catch e
          if (e != BreakException)
            throw e

      error: () ->
        alert('Что-то пошло не так... Приносим свои извинения');

  else if /\[email\]$/.test(field_name) && buttonRegCrafter
    removeErrorText(parent);
    BreakException = {};
    crafterEmail = document.getElementById('crafter_email');
    userEmail = document.getElementById('user_email');
    buttonRegCrafter = document.getElementById('button_reg_crafter');
    buttonRegUser = document.getElementById('button_reg_user');

    $.ajax
      type:'GET',
      url:'/get_all_crafters_and_users',
      success: (response) ->
        try
          for crafter in response.crafters
            if crafter.email == crafterEmail.value
              removeErrorText(parent);
              buttonRegCrafter.disabled = true;
              error_text = createElement(crafterEmail, 'Данный email уже зарегистрирован');
              fadeIn(error_text, 'inline-block');
              setTimeout(fadeOut(error_text), 10000);
              return false;
              throw BreakException;

          for user in response.users
            if user.email == userEmail.value
              removeErrorText(parent);
              buttonRegUser.disabled = true;
              error_text = createElement(userEmail, 'Данный email уже зарегистрирован');
              fadeIn(error_text, 'inline-block');
              setTimeout(fadeOut(error_text), 10000);
              return false;
              throw BreakException;

          return true;

        catch e
          if (e != BreakException)
            throw e

      error: () ->
        alert('Что-то пошло не так... Приносим свои извинения');

  else if /\[company_name\]$/.test(field_name) && buttonEditCrafter
    return true;

  else if buttonEditCrafter
    buttonEditCrafter.disabled = false;


# fade out
fadeOut = (el) ->
  el.style.opacity = 1;

  fade = () ->
    if (el.style.opacity -= .1) < 0
      el.style.display = 'none'
    else
      requestAnimationFrame(fade);
    el.remove();

# fade in
fadeIn = (el, display) ->
  el.style.opacity = 0;
  el.style.opacity = display || 'block';

  (fade = () ->
    val = parseFloat(el.style.opacity);
    if (!((val +=.1) > 1))
      el.style.opacity = val;
      el.style.display = 'block';
      requestAnimationFrame(fade))();

hideShowDiv = (error_text) ->
  fadeIn(error_text, 'inline-block');
  setTimeout(fadeOut(error_text), 500000);

# add
addErrorText = (parent, text) ->
  removeErrorText(parent);

  errorTxt = document.createElement('div');
  errorTxt.className = 'error_text';
  errorTxt.id = 'error_text';
  errorTxt.innerHTML = text;

  parent.parentNode.insertBefore(errorTxt, parent.nextSibling);
  hideShowDiv(errorTxt);


removeErrorText = (parent) ->
  if parent.nextSibling && (parent.nextSibling.className == 'error_text' || parent.nextSibling.className == 'error_text_sign_up')
    parent.nextSibling.remove();

createElement = (parent, text) ->
  error_text = document.createElement('div');
  error_text.className = 'error_text_sign_up';
  error_text.innerHTML = text;
  parent.parentNode.insertBefore(error_text, parent.nextSibling);
  return error_text;



#$(document).ready(ready);
#$(document).on('page:load', ready);
#$(document).on('turbolinks:load', ready);