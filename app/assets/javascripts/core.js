jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ajaxSend(function(e, xhr, options) {
  var token = $("meta[name='csrf-token']").attr("content");
  xhr.setRequestHeader("X-CSRF-Token", token);
});

function monitorComplete(){
  var upload_id = $(location).attr('href').replace(/.*\//, '');
  var monitor = setInterval(function() {
    $.getJSON("/uploads/" + upload_id + ".json", function (data) {
      console.log("data[total] = " + data["total"]);
      if(data["total"] != "undefined") {
        $('#upload_status').html("Complete.  Order total is $" + data["total"]); 
        clearInterval(monitor);
      }
    });
  }, 2000);
}

