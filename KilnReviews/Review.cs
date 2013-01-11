namespace KilnReviews
{
	public class Review
	{
		public Reviewer[] reviewers { get; set; }
		public string sReview { get; set; }
		public string sStatus { get; set; }
		public string sTitle { get; set; }

		public int DaysOld { get; set; }
	}
}