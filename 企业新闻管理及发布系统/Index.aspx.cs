using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 企业新闻管理及发布系统
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = DTcms.DBUtility.DbHelperSQL.Query("select top 5 *  from News where Hot=1 and Visible=1 order by ID DESC");
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
        }
    }
}