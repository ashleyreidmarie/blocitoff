$(document).ready(function(){
    $('.cancel').click(function(event){
        $('.new-item').hide();
        $('.add-item-link').show();
        event.preventDefault();
    })
    
    $('.add-item-link').click(function(event){
        $('.new-item').show();
        $('.add-item-link').hide();
        event.preventDefault();
    })
});
