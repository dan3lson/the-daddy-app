$(function() {
	$("#registration-daddy a").on("click", function(e) {
		e.preventDefault();
		showStepTwo();
	});

	$("#registration-child-back").on("click", function(e) {
		e.preventDefault();
		showStepOne();
	});

	$(".registration-child-add-link").on("click", function(e) {
		e.preventDefault();
		if (!$("#child-wrapper-number-one-display").length) {
			$(".registration-child-wrapper").first().prepend(childNumberOneWrapperDisplay());
		}
		$(".registration-added-children")
			.append(
				childWrapper()
					.append($("<hr>"))
					.append(
						childWrapperNumberDisplay(childWrapperIndex() + 1)
					)
					.append(
						formFloatingDiv()
							.append(
								childInput("first_name", "text", "Child First Name"), label("First Name")
							)
						)
					.append(
						formFloatingDiv()
							.append(
								childGenderSelector()
							)
							.append(
								label("Gender")
							)
						)
					.append(
						formFloatingDiv()
							.append(
								childInput("birthdate", "date", "Child Birthdate"), label("Birthdate")
							)
						)
					.append(
						removeChildLink()
					)
			);
		updateStepTwoTitle();
	});

	$(".registration-added-children").on("click", ".registration-child-remove-link", function(e) {
    e.preventDefault();
		$(this).parent().remove();
		updateStepTwoTitle();
		updateChildWrapperNumberDisplays();
		removeFirstChildContainerNumberDisplay();
	});

	function formFloatingDiv() {
		return $('<div/>').addClass("form-floating mb-3");
	}

	function childWrapper() {
		return $('<div/>')
		  .addClass("registration-child-wrapper mb-4")
			.attr("id", "registration_child_wrapper_" + childWrapperIndex());
	}

	function childNumberOneWrapperDisplay() {
		return $('<h6/>')
			.addClass("text-muted mb-3 child-wrapper-number-display")
			.attr("id", "child-wrapper-number-one-display")
			.text("Child #1");
	}

	function childWrapperNumberDisplay(index) {
		return $('<h6/>')
		  .addClass("text-muted mb-3 child-wrapper-number-display")
			.text("Child #" + index);
	}

	function updateChildWrapperNumberDisplays() {
		var $displays = $(".child-wrapper-number-display");
		$displays.each(function(index) {
			$(this).text("Child #" + (index + 1));
		});
	}

	function removeFirstChildContainerNumberDisplay() {
		if(isAddingOneChild()) {
			$("#child-wrapper-number-one-display").remove();
		}
	}

	function childInput(inputName, inputType, placeholder) {
		return $("<input/>")
			.attr("id", "registration_children_" + childWrapperIndex() + "_" + inputName)
			.attr("name", "registration[children][" + childWrapperIndex() + "][" + inputName + "]")
			.attr("value", "")
			.attr("type", inputType)
			.attr("placeholder", placeholder)
			.attr("required", "required")
			.addClass("form-control")
	}

	function childGenderSelector() {
		var selector = $("<select/>")
			.attr("id", "registration_children_" + childWrapperIndex() + "_gender")
			.attr("aria-label", "Select gender dropdown")
			.attr("name", "registration[children][" + childWrapperIndex() + "][gender]")
			.attr("value", "")
			.attr("required", "required")
			.addClass("form-select mb-3 form-control");

		selector
		  .append($("<option/>").attr("value", "").text("Choose..."))
		  .append($("<option/>").attr("value", "male").text("male"))
		  .append($("<option/>").attr("value", "female").text("female"));

		return selector;
	}

	function childWrapperIndex() {
		return $(".registration-child-wrapper").length;
	}

	function label(string) {
		return $("<label/>")
		  .attr("for", "floatingInput")
			.text(string)
	}

	function removeChildLink() {
		return $("<a/>")
		  .addClass("registration-child-remove-link link-danger")
			.attr("href", "#")
			.text("➖ Remove child");
	}

	function showStepTwo() {
		$("#registration-children").removeClass("d-none");
		$("#registration-daddy").hide();
	}

	function showStepOne() {
		$("#registration-children").addClass("d-none");
		$("#registration-daddy").show();
	}

	function updateStepTwoTitle() {
		var $pluralizedElement = $("#registration-children h3 span");

		if (isAddingMultipleChildren()) {
			$pluralizedElement.text("children");
		} else {
			$pluralizedElement.text("child");
		}
	}

	function isAddingMultipleChildren() {
		return childWrapperIndex() > 1;
	}

	function isAddingOneChild() {
		return childWrapperIndex() == 1;
	}
});
