var input = $("input:text");
input.focus(function() {
    value=$(this).val();
    $(this).val("");
});
input.blur(function() {
    if($(this).val()=="") {
        $(this).val(value);
    }
});

var pass = $("input:password");
pass.focus(function() {
    pass_value=$(this).val();    
    $(this).val("");
});
pass.blur(function() {
    if($(this).val()=="") {
        $(this).val(pass_value);
    }
});

$("form").submit(function() {
    if(!(($("input:text").val()=="admin") && ($("input:password").val()=="12345"))){
        $("form").vibrate('x', 10, 5, 40);
    }
    else
    {
        $("span").hide();
        $("form").css("margin","auto");    
        $("input:submit").animate({left: '-=150'}, 700 , function(){
            $("input:submit").animate({left: '-=150'},700);
            $("form").animate({width: '0px'}, 700 , function(){
                $("input:submit").hide();
                $("form").hide();
                $("form").before('<p></p>');
                $("p").animate({
                    width: '200px',
                    padding: '10px'
                },700,function(){
                    $("p").text("Login succesfull");
                    $("p").animate({color: '#d2dfe0'}, 700);
                });
            });
        });
    }    
    return false;
});


jQuery.fn.vibrate = function(axis, distance, repetition, duration) { var i = 0; var o = distance / distance; switch(axis) { case 'x': while(i < repetition) { $(this).animate({marginLeft:'-'+distance+'px'}, duration); $(this).animate({marginLeft:distance}, duration); i++; if(i == repetition) { $(this).animate({marginLeft:o}, duration);
} } break; case 'y': while(i < repetition) { $(this).animate({marginTop:'-'+distance+'px'}, duration); $(this).animate({marginTop:distance}, duration); i++; } break; } };
(function( $ ){ $.fn.initialValue = function(value) { if (value) { return this.attr('initial-value', value); } else { return this.attr('initial-value'); } };$.fn.clearInput = function() { return this .focus(function(){ if (this.value == $(this).initialValue()) { this.value = ''; } }) .blur(function(){ if (this.value == '') { this.value = $(this).initialValue(); } })
.each(function(index, elt) { $(this).initialValue(this.value); }); }; })( jQuery );
