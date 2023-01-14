$(function() {
	$("#registration-daddy a").on("click", function(e) {
		e.preventDefault();
		showStepTwo();
	});

	$("#registration-baby-back").on("click", function(e) {
		e.preventDefault();
		showStepOne();
	});

	$(".registration-baby-add-link").on("click", function(e) {
		e.preventDefault();
		if (!$("#baby-container-number-one-display").length) {
			$(".registration-baby-container").first().prepend(babyContainerNumberOneDisplay());
		}
		$(".registration-added-babies")
			.append(
				babyContainer()
					.append($("<hr>"))
					.append(
						babyContainerNumberDisplay(babyContainerIndex() + 1)
					)
					.append(
						formFloatingDiv()
							.append(
								babyInput("first_name", "text", "Baby First Name"), label("First Name")
							)
						)
					.append(
						formFloatingDiv()
							.append(
								babyInput("gender", "text", "Baby Gender"), label("Gender")
							)
						)
					.append(
						formFloatingDiv()
							.append(
								babyInput("birthdate", "date", "Baby Birthdate"), label("Birthdate")
							)
						)
					.append(
						removeBabyLink()
					)
			);
		updateStepTwoTitle();
	});

	$(".registration-added-babies").on("click", ".registration-baby-remove-link", function(e) {
    e.preventDefault();
		$(this).parent().remove();
		updateStepTwoTitle();
		updateBabyContainerNumberDisplays();
		removeFirstBabyContainerNumberDisplay();
	});

	function formFloatingDiv() {
		return $('<div/>').addClass("form-floating mb-3");
	}

	function babyContainer() {
		return $('<div/>')
		  .addClass("registration-baby-container mb-4")
			.attr("id", "registration_baby_container_" + babyContainerIndex());
	}

	function babyContainerNumberOneDisplay() {
		return $('<h6/>')
			.addClass("text-muted mb-3 baby-container-number-display")
			.attr("id", "baby-container-number-one-display")
			.text("Baby #1");
	}

	function babyContainerNumberDisplay(index) {
		return $('<h6/>')
		  .addClass("text-muted mb-3 baby-container-number-display")
			.text("Baby #" + index);
	}

	function updateBabyContainerNumberDisplays() {
		var $displays = $(".baby-container-number-display");
		$displays.each(function(index) {
			$(this).text("Baby #" + (index + 1));
		});
	}

	function removeFirstBabyContainerNumberDisplay() {
		if(isAddingOneBaby()) {
			$("#baby-container-number-one-display").remove();
		}
	}

	function babyInput(inputName, inputType, placeholder) {
		return $('<input/>')
			.attr("id", "registration_babies_" + babyContainerIndex() + "_" + inputName)
			.attr("name", "registration[babies][" + babyContainerIndex() + "][" + inputName + "]")
			.attr("value", "")
			.attr("type", inputType)
			.attr("placeholder", placeholder)
			.attr("required", "required")
			.addClass("form-control")
	}

	function babyContainerIndex() {
		return $(".registration-baby-container").length;
	}

	function label(string) {
		return $("<label/>")
		  .attr("for", "floatingInput")
			.text(string)
	}

	function removeBabyLink() {
		return $("<a/>")
		  .addClass("registration-baby-remove-link link-danger")
			.attr("href", "#")
			.text("➖ Remove baby");
	}

	function showStepTwo() {
		$("#registration-babies").removeClass("d-none");
		$("#registration-daddy").hide();
	}

	function showStepOne() {
		$("#registration-babies").addClass("d-none");
		$("#registration-daddy").show();
	}

	function updateStepTwoTitle() {
		var $pluralizedElement = $("#registration-babies h3 span");

		if (isAddingMultipleBabies()) {
			$pluralizedElement.text("babies");
		} else {
			$pluralizedElement.text("baby");
		}
	}

	function isAddingMultipleBabies() {
		return babyContainerIndex() > 1;
	}

	function isAddingOneBaby() {
		return babyContainerIndex() == 1;
	}
});
