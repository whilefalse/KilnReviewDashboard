
using System.Web;
using System.Web.Http.WebHost;
using System.Web.Routing;
using System.Web.SessionState;

namespace KilnReviews
{
	// Fiddle to be able to use the session in the api controller...
	// ...which isn't advisable because the api is supposed to be stateless.
	// TODO: Maybe I should be thinking about adding a database instead of using Session.
	// http://stackoverflow.com/questions/11478244/asp-net-web-api-session-or-something

	public class SessionStateControllerHandler : HttpControllerHandler, IRequiresSessionState
	{
		public SessionStateControllerHandler(RouteData routeData)
			: base(routeData)
		{
		}
	}

	public class SessionStateControllerRouteHandler : HttpControllerRouteHandler
	{
		protected override IHttpHandler GetHttpHandler(RequestContext requestContext)
		{
			return new SessionStateControllerHandler(requestContext.RouteData);
		}
	}
}