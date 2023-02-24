$(function() {
	$(".onboarding-next-btn").on("click", function(e) {
		e.preventDefault();
		$section = $(this).parents("section");
		$section.addClass("d-none");
		$section.next().removeClass("d-none");

		updateProgress();
	});

	function updateProgress() {
		var currentValue = parseInt($("#onboarding-container .progress").attr("aria-valuenow"));
		var newValue = currentValue + 16;

		$("#onboarding-container .progress").attr("aria-valuenow", newValue)
		$("#onboarding-container .progress-bar").css("width", newValue + "%");
	}
});
