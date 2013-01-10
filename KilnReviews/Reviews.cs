namespace KilnReviews
{
	public class Reviews
	{
		public Review[] reviewsApproved { get; set; }
		public Review[] reviewsAuthor { get; set; }
		public Review[] reviewsAwaitingReview { get; set; }
		public Review[] reviewsRejected { get; set; }
		public Review[] reviewsStarred { get; set; }
	}
}