
/* DOM is ready
------------------------------------------------*/
$(function() {

	// Change top navbar on scroll
	$(window).on("scroll", function() {
		if ($(window).scrollTop() > 100) {
			$(".top-bar").addClass("active");
			$(".sidebar").addClass("side-active-top");

		} else {
			$(".top-bar").removeClass("active");
			$(".sidebar").removeClass("side-active-top");
		}
	});

	// Smooth scroll to search form
	$('.down-arrow-link').click(function() {
		$.scrollTo('#section-search', 300, {
			easing : 'linear'
		});
	});

	

	// Close navbar after clicked
	$('.nav-link').click(function() {
		$('#mainNav').removeClass('show');
	});

	// Slick Carousel
	$('.slideshow').slick({
		infinite : true,
		arrows : true,
		slidesToShow : 1,
		slidesToScroll : 1
	});

	$('.current-year').text(new Date().getFullYear()); // Update year in
														// copyright

	
	
	$(".aside").on("click",function(evt){
		$("html,body").stop().animate({
			scrollTop : 0
		},400);

		evt.preventDefault();
	});

	
});


//Scroll-up
$(function(){
	$(window).on("scroll",function() {
	    if ($(this).scrollTop() > 100) {
	        $('.aside').fadeIn();
	    } else {
	        $('.aside').fadeOut();
	    }
	});
});




