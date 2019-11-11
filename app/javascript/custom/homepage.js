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
		}, 2000);
	}

	function verbs() {
		return ['Laugh', 'Cry', 'Vent', 'Relax', 'Worry', 'Chat'];
	}

	function changeText(string) {
		const $changingText = $("section.hero .title.is-1 div");

		$changingText.fadeOut(function() {
			$changingText.fadeIn();
			$changingText.text(string);
		});
	}

	function random_item(items) {
		return items[Math.floor(Math.random()*items.length)];
	}
});
