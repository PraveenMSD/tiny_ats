$(document).on("turbolinks:load", function () {
  $("#new_job").validate({
    rules: {
      "job[title]": {
        required: true,
      },
      "job[openings]": {
        required: true,
      },
      "job[experience]": {
        required: true,
      },
    },
  });
});
