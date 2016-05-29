using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace 企业新闻管理及发布系统.Asmx
{
    /// <summary>
    /// List 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    // [System.Web.Script.Services.ScriptService]
    public class List : System.Web.Services.WebService
    {

        [WebMethod]
        public void Delete()
        {
           string id= HttpContext.Current.Request["ID"];
           string cmd = "delete from News where ID="+id;
           if (DTcms.DBUtility.DbHelperSQL.ExecuteSql(cmd) > 0)
           {
               HttpContext.Current.Response.Write("删除成功");
           }
           else
           {
               HttpContext.Current.Response.Write("删除失败");
           }
        }
    }
}
