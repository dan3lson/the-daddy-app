$(function() {
	$("#registration-daddy a").on("click", function() {
		$("#registration-babies").removeClass("d-none");
		$("#registration-daddy").hide();
	});

	$("#registration-baby-back").on("click", function() {
		$("#registration-babies").addClass("d-none");
		$("#registration-daddy").show();
	});
});
