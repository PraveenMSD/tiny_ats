$(document).on("turbolinks:load", function () {
  $("#new_user").validate({
    rules: {
      "user[name]": {
        required: true,
        minlength: 3,
      },
      "user[email]": {
        required: true,
      },
      "user[password]": {
        required: true,
        minlength: 6,
      },
      "user[password_confirmation]": {
        required: true,
        minlength: 6,
        equalTo: "#user_password",
      },
    },
    messages: {
      "user[name]": "Name is required",
      "user[email]": "Email is required",
      "user[password]": "Password is required",
      "user[password_confirmation]": "Confirm password is required",
    }
  });

  $("#new_job").validate({
    rules: {
      "job[title]": {
        required: true,
        minlength: 2,
      },
      "job[openings]": {
        required: true,
        minlength: 1,
      },
      "job[experience]": {
        required: true,
        minlength: 5,
      },
      "job[joining_type]": {
        required: true,
        minlength: 5,
      }
    },
    messages: {
      "job[title]": "Title is required",
      "job[openings]": "Openings is required",
      "job[experience]": "Experience is required",
    }
  });

  // $('#selectvalidate').on('keyup', function(){
  //   var isValid = true;
  //   if ($('#employment_type_select').val() || $('#priority_type_select').val() == "-- Please select --") {
  //     console.log('Alert working')
  //     $('#jobsubmit').attr('disabled', 'disabled')
  //     isValid = false
  //   } else {
  //     $('#jobsubmit').removeAttr('enabled')
  //   }
  // })

  $("#new_candidate").validate({
    rules: {
      "candidate[name]": {
        required: true,
        minlength: 3,
      },
      "candidate[phone]": {
        required: true,
        minlength: 10,
      },
      "candidate[email]": {
        required: true,
        type: 'email',
      },
      "candidate[skill]": {
        required: true,
        minlength: 2,
      },
      "candidate[work_experience]": {
        required: true,
        minlength: 1,
      },
      "candidate[ctc]": {
        required: true,
        minlength: 2,
      },
      "candidate[notice_period]": {
        required: true,
        minlength: 2,
      }
    },
    messages: {
      "candidate[name]": "Name is required",
      "candidate[phone]": "Phone is required",
      "candidate[email]": "Email is required",
      "candidate[skill]": "Skill is required",
      "candidate[work_experience]": "Work experience is required",
      "candidate[ctc]": "CTC is required",
      "candidate[notice_period]": "Notice period is required",
    }
  })
});
