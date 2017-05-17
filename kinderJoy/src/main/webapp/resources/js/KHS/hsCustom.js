var setSidenavActive = function(index){
	$('.sidebar-wrapper').find('li').removeAttr('class','active');
    $('.sidebar-wrapper').find('li').eq(index).attr('class','active');
}