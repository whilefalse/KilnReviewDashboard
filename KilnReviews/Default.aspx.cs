using System;
using System.Net;
using System.Web.UI;

namespace KilnReviews
{
	public partial class Default : Page
	{
		protected void submitButtonClick(object sender, EventArgs e)
		{
			using (var webClient = new WebClient())
			{
				var downloadString = webClient.DownloadString(string.Format("https://nonlinear.kilnhg.com/Api/2.0/Auth/Login?sUser={0}&sPassword={1}", Uri.EscapeDataString(userName.Text), Uri.EscapeDataString(password.Text)));

				// TODO: Handle failure to get token
				Session["kilnToken"] = downloadString.Replace("\"", string.Empty);
				Session["kilnUser"] = userName.Text;

				Response.Redirect("ReviewSummary.aspx");
			}
		}
	}
}