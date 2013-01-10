$(function () {
	var ReviewTodo = Spine.Model.sub();
	ReviewTodo.configure("Review", "sReview", "sStatus", "sTitle", "reviewers");
	ReviewTodo.extend(Spine.Model.Ajax);
	ReviewTodo.extend({ url: "api/Reviews/Todo" });

	var ReviewRejected = Spine.Model.sub();
	ReviewRejected.configure("Review", "sReview", "sStatus", "sTitle", "reviewers");
	ReviewRejected.extend(Spine.Model.Ajax);
	ReviewRejected.extend({ url: "api/Reviews/Rejected" });

	var ReviewWaiting = Spine.Model.sub();
	ReviewWaiting.configure("Review", "sReview", "sStatus", "sTitle", "reviewers");
	ReviewWaiting.extend(Spine.Model.Ajax);
	ReviewWaiting.extend({ url: "api/Reviews/Waiting" });

	var ReviewController = Spine.Controller.sub({
		init: function () {
			this.replace($("#reviewTemplate").tmpl(this.review));
		}
	});

	var ReviewsController = Spine.Controller.sub({
		elements: {
			"#reviewsTodo": "reviewsTodo",
			"#reviewsRejected": "reviewsRejected",
			"#reviewsWaiting": "reviewsWaiting"
		},

		init: function () {
			ReviewTodo.bind("refresh", this.proxy(this.addReviewsTodo));
			ReviewRejected.bind("refresh", this.proxy(this.addReviewsRejected));
			ReviewWaiting.bind("refresh", this.proxy(this.addReviewsWaiting));

			ReviewTodo.fetch();
			ReviewRejected.fetch();
			ReviewWaiting.fetch();
		},

		addReviewsTodo: function () {
			ReviewTodo.each(function(review) {
				var controller = new ReviewController({ review: review });
				$(this.reviewsTodo).append(controller.el);
			});
		},

		addReviewsRejected: function () {
			ReviewRejected.each(function (review) {
				var controller = new ReviewController({ review: review });
				$(this.reviewsRejected).append(controller.el);
			});
		},

		addReviewsWaiting: function () {
			ReviewWaiting.each(function (review) {
				var controller = new ReviewController({ review: review });
				$(this.reviewsWaiting).append(controller.el);
			});
		}
	});
	
	new ReviewsController({ el: $("body") });
});