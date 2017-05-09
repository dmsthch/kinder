$(function(){

$('.form-group.-animated .form-control, .form-group.-overlayed .form-control').keyup(function(event) {
  if ($(this).val() != '') {
    $(this).parent('.form-group').addClass('-active');
  } else {
    $(this).parent('.form-group').removeClass('-active');
  }
});

$('.form-group.-animated .form-control, .form-group.-overlayed .form-control').focusin(function(event) {
  $(this).parent('.form-group').addClass('-focus');
});

$('.form-group.-animated .form-control, .form-group.-overlayed .form-control').focusout(function(event) {
  $(this).parent('.form-group').removeClass('-focus');
});

})