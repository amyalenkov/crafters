///**
// * Created by sushi on 7/20/17.
// */
function login(){
    var email = document.getElementById('sign_in_email');
    var password = document.getElementById('sign_in_password');
    var BreakException = {};
    var error_text = document.getElementById('error_text');

    $.ajax({
        type:'GET',
        url:'/get_all_crafters_and_users',
        success: function(response){

            try {
                response.crafters.forEach(function(item, i) {
                    if(item.email == email.value){
                        post_request_for_login(email.value, password.value, 'crafters', 'crafter', error_text);
                        throw BreakException;
                    }
                });
                response.users.forEach(function(item, i) {
                    if(item.email == email.value){
                        post_request_for_login(email.value, password.value, 'users', 'user', error_text);
                        throw BreakException;
                    }
                });
                fadeIn(error_text, 'inline-block');
                setTimeout(function() {
                    fadeOut(error_text);
                }, 4500);
            } catch (e) {
                if (e !== BreakException) throw e;
            }
        },
        error: function() {
            alert('Что-то пошло не так... Приносим свои извинения');
        }
    });
};

// fade out
function fadeOut(el){
    el.style.opacity = 1;

    (function fade(){
        if ((el.style.opacity -= .1) < 0){
            el.style.display = 'none';
        } else {
            requestAnimationFrame(fade);
        }

    })();
}

//fade in
function fadeIn(el, display){
    el.style.opacity = 0;
    el.style.opacity = display || 'block';

    (function fade(){
        var val = parseFloat(el.style.opacity);
        if(!((val +=.1) > 1)) {
            el.style.opacity = val;
            el.style.display = 'block';
            requestAnimationFrame(fade);
        }
    })();
}


$(document).on("click", "#login_form", login);
//$(document).keydown(function(event){
//    if(event.keyCode == 13){
//        login;
//        return false;
//    }
//});

var post_request_for_login = function(email, password, role_url, role, error_text){
    $.ajax({
        type: 'POST',
        url: '/'+role_url+'/sign_in',
        data: role+'[email]=' + email + '&' + role + '[password]=' + password,
        success: function(response){
            var id = response.match(/"link link_email" href="(\/\w+\/\d+)/);
            window.location.href = id[1];
        },
        error: function(){
            fadeIn(error_text, 'inline-block');
            setTimeout(function() {
                fadeOut(error_text);
            }, 4500);
        }
    });
};