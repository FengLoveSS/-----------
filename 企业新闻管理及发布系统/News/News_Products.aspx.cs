using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 企业新闻管理及发布系统.News
{
    public partial class News_Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int recordNum = int.Parse(DTcms.DBUtility.DbHelperSQL.GetSingle(DTcms.Common.PagingHelper.CreateCountingSql("News", " where Visible=1 and  Type='新品资讯'")).ToString());
            DataSet ds = DTcms.DBUtility.DbHelperSQL.Query(DTcms.Common.PagingHelper.CreatePagingSql(recordNum, 10, int.Parse(HttpContext.Current.Request["Page"] == null ? "1" : HttpContext.Current.Request["Page"]), "News", "Date DESC,ID", " where Visible=1 and  Type='新品资讯'"));
            Label1.Text = getPageText(int.Parse(HttpContext.Current.Request["Page"] == null ? "1" : HttpContext.Current.Request["Page"]), recordNum, 10);
            Repeater1.DataSource = DTcms.DBUtility.DbHelperSQL.Query("select * from News where Type='新品资讯'");
            Repeater1.DataBind();
        }
        string getPageText(int nowPage, int recordNum, int num)
        {
            string pageText = "<nav><ul class='pagination'>";
            int pageNum = 0;
            if ((recordNum % num) == 0)
                pageNum = (recordNum) / num;
            else
                pageNum = (recordNum) / num + 1;
            if (nowPage > 1)
            {
                pageText += "<li ><a href='News_Products.aspx?Page=" + (nowPage - 1).ToString() + "'>上一页</a></li>  ";
            }
            else
            {
                pageText += "<li class='disabled'><a>上一页</a></li>  ";

            }
            for (int i = nowPage > 5 ? 5 : nowPage - 1; i > 0; i--)
            {
                pageText += "<li><a href='News_Products.aspx?Page=" + (nowPage - i).ToString() + "'>" + (nowPage - i) + "</a></li>  ";
            }
            pageText += "<li class='active'><a>" + nowPage + "</a></li>  ";
            for (int i = 0; i < ((pageNum - nowPage) > 5 ? 5 : (pageNum - nowPage)); i++)
            {
                pageText += "<li><a href='News_Products.aspx?Page=" + (nowPage + i + 1).ToString() + "'>" + (nowPage + i + 1) + "</a></li>  ";
            }
            if (pageNum - nowPage > 0)
            {
                pageText += "<li><a href='News_Products.aspx?Page=" + (nowPage + 1).ToString() + "'>下一页</a></li>";
            }
            else
            {
                pageText += "<li class='disabled'><a>下一页</a></li>";
            }
            pageText += "</ul></nav>  ";
            return pageText;
        }
    }
}