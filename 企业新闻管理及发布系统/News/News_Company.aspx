<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="News_Company.aspx.cs" Inherits="企业新闻管理及发布系统.News.News_Company" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="../Js/jquery-2.2.3.min.js"></script>
    <script src="../Js/bootstrap.js"></script>
    <link href="../Css/bootstrap.css" rel="stylesheet" />
    <link href="../Css/Main.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <Main:Header2 runat="server"/>
    </div>
        
            <Main:Side1 runat="server" />
         <Main:MainView runat="server"/>
    </form>
</body>
</html>
