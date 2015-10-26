using System;
using System.Configuration;
using System.Net;
using System.Web;
using System.Web.UI;

namespace KilnReviews
{
	public partial class Default : Page
	{
		protected override void OnLoad(EventArgs e)
		{
			base.OnLoad(e);

			if (Request.Cookies["kilnToken"] != null && Request.Cookies["kilnUser"] != null)
			{
				Response.Redirect("ReviewSummary.aspx");
			}
		}

		public string KilnUrlBase
		{
			get { return ConfigurationManager.AppSettings["kilnUrlBase"]; }
		}

		public string FogBugzUrlBase
		{
			get { return ConfigurationManager.AppSettings["fogBugzUrlBase"]; }
		}

		protected void submitButtonClick(object sender, EventArgs e)
		{
			using (var webClient = new WebClient())
			{
				var tokenEntered = Uri.EscapeDataString(token.Text);

				if (string.IsNullOrEmpty(tokenEntered)) {
					tokenEntered = webClient
						.DownloadString(string.Format("{0}Api/2.0/Auth/Login?sUser={1}&sPassword={2}", KilnUrlBase, Uri.EscapeDataString(Uri.EscapeDataString(userName.Text)), Uri.EscapeDataString(password.Text)))
						.Replace("\"", string.Empty);
				}

				// TODO: Handle failure to get token &/or kilnUrlBase

				var kilnTokenCookie = new HttpCookie("kilnToken")
				{
					Value = tokenEntered,
					Expires = DateTime.Today.AddMonths(1),
					HttpOnly = true,
					Secure = true
				};
				
				var userCookie = new HttpCookie("kilnUser")
				{
					Value = userName.Text,
					Expires = DateTime.Today.AddMonths(1),
					HttpOnly = true,
					Secure = true
				};

				Response.Cookies.Add(kilnTokenCookie);
				Response.Cookies.Add(userCookie);
				Response.Redirect("ReviewSummary.aspx");
			}
		}
	}
}