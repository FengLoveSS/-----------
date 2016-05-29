<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="News_Products.aspx.cs" Inherits="企业新闻管理及发布系统.News.News_Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="../Js/jquery-2.2.3.min.js"></script>
    <script src="../Js/bootstrap.js"></script>
    <script src="../Js/messenger.min.js"></script>
    <link href="../Css/messenger.css" rel="stylesheet" />
    
    <link href="../Css/messenger-theme-future.css" rel="stylesheet" />
    <link href="../Css/bootstrap.css" rel="stylesheet" />
    <link href="../Css/Main.css" rel="stylesheet" />
    <title></title>
    <script>
        $(document).ready(function(){
            $._messengerDefaults = {
                extraClasses: 'messenger-fixed messenger-theme-future messenger-on-bottom messenger-on-right'
            }
            $.globalMessenger().post("欢迎进入新品资讯板块");
        
        });
        
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <Main:Header2 runat="server"></Main:Header2>
    </div>
       
            <Main:Side3 runat="server" />
        <div class="col-md-10">
            <div class="row">
                <ol class="breadcrumb">
                
                <li>新闻中心</li>
                <li id="daohang" runat="server" class="active">新品资讯</li>
                </ol>
            </div>
        <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
<table class="table">
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                <td><a width="80%" href="New_Detail.aspx?ID=<%#Eval("ID")%>"><%#Eval("Title") %></a></td>
                    <td width="20%"><%#Eval("Date") %></td>
            </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </div>
    </form>
</body>
</html>
