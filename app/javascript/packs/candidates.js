$(document).on("turbolinks:load", function () {
    $("#rounds").on('change', function(){
        var state = $(this).val();
        var id = $(this).data("cid");
        
        $.ajax({
        url: '/candidates/status',
        type: 'POST',
        data: {id: id, value: state}
        })
        .done(function( data ) {
            $("#statusspan").text(data.status);
        });
    });

    $("#priority").on('change', function(){
        var state = $(this).val();
        var id = $(this).data("jid");
        
        $.ajax({
        url: '/jobs/priority',
        type: 'POST',
        data: {id: id, value: state}
        })
        .done(function( data ) {
            $("#statusspan").text(data.priority);
        });
    });

    $("#title_select").on('change', function(){
        var titleValue = $('#title_select option:selected').text()
        $('#jobtitlefield').val(titleValue)

        console.log(titleValue)
    })

    $('.jobid').on('click', function(){
        var id = $(this).data("jjid")
        console.log(id)
        $.ajax({
            url: '/candidates/get_candidates',
            type: 'POST',
            data: {id: id}
        })
        .done(function( data ){

            if ($.fn.DataTable.isDataTable("#example")) {
                $('#example').DataTable().clear().destroy();
              }

          $('#example').DataTable({
            "data": data,
            "columns": [
               { "data": "name" },
               { "data": "email" },
               { "data": "phone" },
               { "data": "skill" },
               { "data": "work_experience" },
               { "data": "job_title" },
               { "data": "ctc" },
               { "data": "notice_period" },
               { "data": "status" }
            ]
          });

        console.log(data);
        })
    })

});