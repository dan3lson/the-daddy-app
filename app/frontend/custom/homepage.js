$(function() {
	loopText();

	function loopText() {
		var index = 0;

		setInterval(function() {
			changeText(verbs()[index]);
			index += 1;

			if (index == verbs().length) {
				index = 0;
			}
		}, 1500);
	}

	function verbs() {
		return ['laugh', 'vent', 'relax', 'cry', 'worry', 'escape', 'dream', 'chat'];
	}

	function changeText(string) {
		const $changingText = $(".space-for-daddies-text mark");

		$changingText.fadeOut(1500, function() {
			$changingText.fadeIn(1500);
			$changingText.text(string + ".");
		});
	}
});
