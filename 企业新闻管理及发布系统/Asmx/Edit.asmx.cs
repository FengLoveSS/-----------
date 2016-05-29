using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using 企业新闻管理及发布系统;

namespace 企业新闻管理及发布系统.Ashx
{
    /// <summary>
    /// Edit 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    // [System.Web.Script.Services.ScriptService]
    public class Edit : System.Web.Services.WebService
    {

        [WebMethod]
        public void Submit()//向数据库提交数据
        {
           string title= HttpContext.Current.Request["Title"];
            string date=HttpContext.Current.Request["Date"];
            string type = HttpContext.Current.Request["Type"].Trim();
            string detailContent = HttpContext.Current.Request["DetailContent"];
            string bigImage = HttpContext.Current.Request["BigImage"];
            int visible = int.Parse(HttpContext.Current.Request["Visible"]);
            int hot = int.Parse(HttpContext.Current.Request["Hot"]);
            detailContent = detailContent.Replace("-==--==-", "<");//替换危险的字符
            if (DTcms.DBUtility.DbHelperSQL.ExecuteSql("insert into News(Title,Date,Type,DetailContent,Num,BigImage,Visible,Hot) values('" + title + "','" + date + "','" + type + "','" + detailContent + "',0,'" + bigImage + "',"+visible+","+hot+")")>0)
            {
                HttpContext.Current.Response.Write("新建成功");
            }
            else
            {
                HttpContext.Current.Response.Write("新建失败");
            }
                
        }
        [WebMethod]
        public void GetData()//从数据库获得指定ID的数据
        {
            string id=HttpContext.Current.Request["ID"];

            DataSet ds=DTcms.DBUtility.DbHelperSQL.Query("select * from News where ID=" + id);
            if(ds.Tables[0].Rows.Count!=0)
            HttpContext.Current.Response.Write(ConvertJSON.ToJson(ds));
            else
                HttpContext.Current.Response.Write("不存在此新闻");
        }
        [WebMethod]
        public void Revise()//向数据库提交修改
        {
            string id = HttpContext.Current.Request["ID"];
            string title = HttpContext.Current.Request["Title"];
            string date = HttpContext.Current.Request["Date"];
            string type = HttpContext.Current.Request["Type"].Trim();
            string detailContent = HttpContext.Current.Request["DetailContent"];
            string bigImage = HttpContext.Current.Request["BigImage"];
            int visible = int.Parse(HttpContext.Current.Request["Visible"]);
            int hot = int.Parse(HttpContext.Current.Request["Hot"]);
            detailContent = detailContent.Replace("-==--==-", "<");//替换危险的字符
            if (DTcms.DBUtility.DbHelperSQL.ExecuteSql(String.Format("Update  News set Title='{0}',Date='{1}',Type='{2}',DetailContent='{3}',BigImage='{5}',Visible={6},Hot={7} where ID={4}", title, date, type, detailContent, id,bigImage,visible,hot)) >= 1)
            {
                HttpContext.Current.Response.Write("修改成功");
            }
            else
            {
                HttpContext.Current.Response.Write("修改失败");
            }
        }
        
    }
}
