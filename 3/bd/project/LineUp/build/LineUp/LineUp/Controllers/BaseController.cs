using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.Controllers;

namespace LineUp.Controllers
{
    public class BaseController : Controller
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            // Respect [AllowAnonymous]
            var actionDescriptor = context.ActionDescriptor;
            var isAnonymous = ((ControllerActionDescriptor)actionDescriptor).MethodInfo
                              .GetCustomAttributes(typeof(AllowAnonymousAttribute), true).Any();

            if (isAnonymous)
            {
                base.OnActionExecuting(context);
                return;
            }

            if (!HttpContext.User.Identity.IsAuthenticated)
            {
                context.Result = RedirectToAction("Index", "Home");
                return;
            }

            base.OnActionExecuting(context);
        }
    }

}
