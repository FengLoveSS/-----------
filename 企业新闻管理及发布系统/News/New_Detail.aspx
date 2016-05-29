<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="New_Detail.aspx.cs" Inherits="企业新闻管理及发布系统.News.NewDetail" %>

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
        
            <Main:Side4 runat="server" />
        <div class="col-md-9">
            <div class="row">
                <ol class="breadcrumb">
                
                <li><a href="News_Company.aspx">新闻中心</a></li>
                <li id="daohang" runat="server" class="active">公司新闻</li>
                </ol>
            </div>
            <div class="row">
                
            <h1><asp:Label ID="Label1" runat="server" Text=""></asp:Label></h1>
            </div>
            <div class="row"> 
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            </div>
            <div class="row"> 
            <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
