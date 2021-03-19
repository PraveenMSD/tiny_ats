$( document ).on('turbolinks:load', function() {
    $("#new_user").validate({
      rules:  {
        "user[name]": {
          required: true
        },
        "user[email]": {
          required: true
        },
        "user[password]": {
          required: true
        },
        "user[password_confirmation]": {
          required: true,
          equalTo: "#user_password"
        }
      }
    });
  });