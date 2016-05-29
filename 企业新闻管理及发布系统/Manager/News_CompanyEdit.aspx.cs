using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 企业新闻管理及发布系统.Manager
{
    public partial class News_CompanyEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (DTcms.Common.Utils.GetCookie("State") != "1")
            {
                Response.Redirect("Login.aspx");
            }
        }


        protected void 上传_Click(object sender, EventArgs e)
        {

        }
    }
}