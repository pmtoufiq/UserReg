using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(UserRegSample.Startup))]
namespace UserRegSample
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
