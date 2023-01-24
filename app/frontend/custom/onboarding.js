$(function() {
	$(".onboarding-next-btn").on("click", function(e) {
		e.preventDefault();
		$section = $(this).parents("section");
		$section.addClass("d-none");
		$section.next().removeClass("d-none");
		$section.next().hide().fadeIn();
	});
});
