using System;
using System.Web;
using System.Web.UI;

namespace KilnReviews
{
	public partial class ReviewSummary : Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			var userCookie = HttpContext.Current.Request.Cookies["kilnUser"];
			if (userCookie != null)
			{
				UserName = userCookie.Value;
			}
		}

		protected string UserName { get; set; }
	}
}