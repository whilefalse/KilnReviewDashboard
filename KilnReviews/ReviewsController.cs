using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Http;
using Newtonsoft.Json;

namespace KilnReviews
{
	public class ReviewsController : ApiController
	{
	    private readonly ReviewsFetcher reviewsFetcher = new ReviewsFetcher();

	    // GET api/Reviews/Todo
		public Review[] GetReviewsTodo()
		{
		    return reviewsFetcher.GetOthersMatchingReviews(r => r.sStatus != "needswork");
        }

		// GET api/Reviews/Rejected
		public Review[] GetRejectedReviews()
		{
		    return reviewsFetcher.GetMyMatchingReviews(r => r.sStatus == "rejected" || r.sStatus == "needswork");
		}

	    // GET api/Reviews/Waiting
		public Review[] GetReviewsWaiting()
		{
            return reviewsFetcher.GetMyMatchingReviews(r => r.sStatus == "active");
        }
	}
}