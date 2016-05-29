using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace 企业新闻管理及发布系统.Asmx
{
    /// <summary>
    /// FileUploadHandler 的摘要说明
    /// </summary>
    public class FileUploadHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                string a = context.Request.Files[0].FileName;
                string houxu = a.Substring(a.IndexOf('.'), a.Length - a.IndexOf('.'));
                string str = DateTime.Now.ToFileTime() + houxu;
                FileStream fs = new FileStream(context.Server.MapPath("") + "/../images/Test/" + str, FileMode.Create);
                byte[] b = new byte[int.Parse(context.Request.Files[0].InputStream.Length.ToString())];
                context.Request.Files[0].InputStream.Read(b, 0, int.Parse(context.Request.Files[0].InputStream.Length.ToString()));
                fs.Write(b, 0, int.Parse(context.Request.Files[0].InputStream.Length.ToString()));

                context.Response.Write("../images/Test/" + str + "");
            }
            catch (Exception e)
            {
                context.Response.Write("文件过大");
                return;
            }
           
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}