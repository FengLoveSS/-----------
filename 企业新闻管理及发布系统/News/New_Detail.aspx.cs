using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 企业新闻管理及发布系统.News
{
    public partial class NewDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = DTcms.DBUtility.DbHelperSQL.Query("select * from News where ID=" + HttpContext.Current.Request["ID"]);
            DTcms.DBUtility.DbHelperSQL.ExecuteSql("update News set Num = Num+1 where id =" + HttpContext.Current.Request["ID"] + ";");//使浏览数增1
            Label1.Text = ds.Tables[0].Rows[0]["Title"].ToString();
            Label2.Text = ds.Tables[0].Rows[0]["DetailContent"].ToString();
            Label3.Text = "时间：" + ds.Tables[0].Rows[0]["Date"].ToString();
            daohang.InnerText= ds.Tables[0].Rows[0]["Type"].ToString();
        }
    }
}