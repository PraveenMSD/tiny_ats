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
});