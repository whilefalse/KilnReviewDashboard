using System;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace KilnReviews
{
	public partial class ReviewSummary : Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			var token = HttpContext.Current.Request.Cookies["kilnToken"];
			var kilnUrlBase = ConfigurationManager.AppSettings["kilnUrlBase"];

			if (!TokenIsValid(kilnUrlBase, token))
			{
				ExpireKilnTokenCookie();
				Response.Redirect("Default.aspx");
			}

			var userCookie = HttpContext.Current.Request.Cookies["kilnUser"];
			if (userCookie != null)
			{
				UserName = userCookie.Value;
			}
		}

		private void ExpireKilnTokenCookie()
		{
			if (Response.Cookies["kilnToken"] != null)
			{
				Response.Cookies["kilnToken"].Expires = DateTime.Now.AddDays(-1);
			}
		}

		private static bool TokenIsValid(string kilnUrlBase, HttpCookie token)
		{
			if (token == null || string.IsNullOrEmpty(token.Value))
			{
				return false;
			}

			using (var webClient = new WebClient())
			{
				var response = webClient.DownloadString(string.Format("{0}Api/2.0/Person?token={1}", kilnUrlBase, token.Value));
				if (IsErrorResponse(response))
				{
					return false;
				}
			}

			return true;
		}

		private static bool IsErrorResponse(string response)
		{
			return response.StartsWith("{\"errors\":[");
		}

		protected string UserName { get; set; }
	}
}