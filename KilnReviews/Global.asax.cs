using System;
using System.Web;
using System.Web.Routing;
using System.Web.Http;

namespace KilnReviews
{
	public class Global : HttpApplication
	{
		protected void Application_Start(object sender, EventArgs e)
		{
			RouteTable.Routes.MapHttpRoute(name: "API Default",
										   routeTemplate: "api/{controller}/{id}",
										   defaults: new { id = RouteParameter.Optional });
		}
	}
}