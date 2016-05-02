using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 企业新闻管理及发布系统.Manager
{
    public partial class News_CompanyList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds=DTcms.DBUtility.DbHelperSQL.Query("select * from News");
            List.DataSource = ds;
            List.DataBind();
        }
    }
}