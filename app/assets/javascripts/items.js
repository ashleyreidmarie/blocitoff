$(document).ready(function(){
    $('.cancel').click(function(event){
        $('.new-item').hide();
        $('.add-item-link').show();
        event.preventDefault();
    })
});
