using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PostalTerminal.Startup))]
namespace PostalTerminal
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
