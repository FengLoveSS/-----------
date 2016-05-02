<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="News_CompanyList.aspx.cs" Inherits="企业新闻管理及发布系统.Manager.News_CompanyList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="../Js/jquery-2.2.3.min.js"></script>
    <script src="../Js/bootstrap.js"></script>
    <link href="../Css/bootstrap.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="row">
        <div class="col-md-2">
    <main:Manager_Side1 runat="server" />
            </div>
        <div class="col-md-10">
            <div class="row">
    <div class="col-md-1">
        <a href="../Manager/News_CompanyEdit.aspx?Type=New">添加</a>
    </div>
            <div class="col-md-11"></div>
                </div>
            <div class="row">
    <asp:Repeater id="List" runat="server">
        <HeaderTemplate>
            <table class="table">
            <tr>
                <th>新闻标题</th>
                <th>类别</th>
                <th>添加日期</th>
                <th>操作</th>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%#Eval("Title")%></td>
                <td><%#Eval("Type") %></td>
                <td><%#Eval("Date") %></td>
                <td><a href="../Manager/News_CompanyEdit.aspx?ID=<%#Eval("ID") %>,Type=Edit">编辑</a></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
                </div>
</div>






    </div>
    </form>
</body>
</html>
