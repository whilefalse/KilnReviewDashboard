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

		template: function (title, items, reviewing) {
			return $('#reviewsTemplate').tmpl({
				title: title,
				reviews: items,
				reviewing: reviewing
			});
		},
		
		refreshList: function(element, title, items, reviewing) {
		    element.html(this.template(title, items, reviewing));
			element.removeClass("fetching");
		},
		
		addReviewsTodo: function () {
			this.refreshList($(this.reviewsTodo), "Reviews to do:", ReviewTodo.all(), true);
		},

		addReviewsRejected: function () {
			this.refreshList($(this.reviewsRejected), "Reviews to fix:", ReviewRejected.all(), false);
		},

		addReviewsWaiting: function () {
			this.refreshList($(this.reviewsWaiting), "Your code under review:", ReviewWaiting.all(), false);
		}
	});
	
	new ReviewsController({ el: $("body") });
});