

            /* DOM is ready
            ------------------------------------------------*/
            $(function(){

                // Change top navbar on scroll
                $(window).on("scroll", function() {
                    if($(window).scrollTop() > 100) {
                        $(".top-bar").addClass("active");
                        $(".sidebar").addClass("side-active-top");
                        
                    } else {                    
                        $(".top-bar").removeClass("active");
                        $(".sidebar").removeClass("side-active-top");
                    }
                });

                

                // Smooth scroll to search form
                $('.down-arrow-link').click(function(){
                    $.scrollTo('#section-search', 300, {easing:'linear'});
                });

                // Date Picker in Search form
/*                 var pickerCheckIn = datepicker('#inputCheckIn');
                var pickerCheckOut = datepicker('#inputCheckOut'); */
                

                // Update nav links on scroll
//                $('#top-bar').singlePageNav({
//                    currentClass:'active',
//                    offset: 60     
//                                    
//                });

                

                // Close navbar after clicked
                $('.nav-link').click(function(){
                    $('#mainNav').removeClass('show');
                });

                // Slick Carousel
                $('.slideshow').slick({
                    infinite: true,
                    arrows: true,
                    slidesToShow: 1,
                    slidesToScroll: 1
                });

                                
                $('.current-year').text(new Date().getFullYear());  // Update year in copyright           
            });


