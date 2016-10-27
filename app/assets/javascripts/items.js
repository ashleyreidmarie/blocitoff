$(document).ready(function(){
    $('.cancel').click(function(event){
        document.getElementById("new_item").reset();
        $('.new-item').hide();
        $('.add-item-link').show();
        event.preventDefault();
    })
    
    $('.add-item-link').click(function(event){
        document.getElementById("new_item").reset();
        $('.new-item').show();
        $('.add-item-link').hide();
        event.preventDefault();
    })
});
