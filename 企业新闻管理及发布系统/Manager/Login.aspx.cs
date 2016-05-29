using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 企业新闻管理及发布系统.Manager
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "admin")
            {
                DTcms.Common.Utils.WriteCookie("State", "1", 60);
                Response.Redirect("News_CompanyList.aspx");
            }
            
            Response.Write("<script>alert('密码错误');</script>");
        }
    }
}