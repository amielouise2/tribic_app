function set_carousel(){
    
    $(document).ready(function(){
        $('.carousel').carousel({
            interval: 1000
        });
    });

}

  
$(document).on('turbolinks:reload', set_carousel());

