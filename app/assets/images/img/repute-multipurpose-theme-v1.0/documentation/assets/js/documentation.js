$(document).ready(function(){

	var headerHeight = $('.doc-header').outerHeight(true);

	$(document.body).scrollspy({
		target: '.doc-sidebar',
		//offset: headerHeight
	});

	$(window).on('load', function () {
		$(document.body).scrollspy('refresh');
	});

	$(window).on('scroll', function() {
		if( $(document).scrollTop() > headerHeight ) {
			$('.doc-sidebar').addClass('affix');
		}else {
			$('.doc-sidebar').removeClass('affix');
		}
	});

	SyntaxHighlighter.all();

});