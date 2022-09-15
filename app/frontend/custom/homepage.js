$(document).ready(function(){
	loopText();

	function loopText() {
		var index = 0;

		setInterval(function() {
			changeText(verbs()[index]);
			index += 1;

			if (index == verbs().length) {
				index = 0;
			}
		}, 2100);
	}

	function verbs() {
		return ['laugh', 'cry', 'vent', 'relax', 'worry', 'escape', 'chat'];
	}

	function changeText(string) {
		const $changingText = $(".space-for-daddies-text em");

		$changingText.fadeOut("slow", function() {
			$changingText.fadeIn("slow");
			$changingText.text(string);
		});
	}

	function random_item(items) {
		return items[Math.floor(Math.random()*items.length)];
	}
});
