$(function () {
	var ReviewsController = Spine.Controller.sub({
		elements: {},
		events: {},

		init: function () {
			$.getJSON("/api/Reviews", function(data) {
				var reviews = $.parseJSON(data);
				console.log(reviews);
			});
		}
	});
	
	new ReviewsController({ el: $("body") });
});