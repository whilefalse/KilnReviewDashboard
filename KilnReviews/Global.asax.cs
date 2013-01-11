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
			RouteTable.Routes.MapHttpRoute(name: "Todos",
										   routeTemplate: "api/Reviews/Todo",
										   defaults: new { controller = "Reviews", action = "GetReviewsTodo" })
										   .RouteHandler = new SessionStateControllerRouteHandler();

			RouteTable.Routes.MapHttpRoute(name: "Rejected",
										   routeTemplate: "api/Reviews/Rejected",
										   defaults: new { controller = "Reviews", action = "GetRejectedReviews" })
										   .RouteHandler = new SessionStateControllerRouteHandler();

			RouteTable.Routes.MapHttpRoute(name: "Waiting",
										   routeTemplate: "api/Reviews/Waiting",
										   defaults: new { controller = "Reviews", action = "GetReviewsWaiting" })
										   .RouteHandler = new SessionStateControllerRouteHandler();
		}
	}
}