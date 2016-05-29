<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="企业新闻管理及发布系统.Manager.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="../Js/bootstrap.js"></script>
    <link href="../Css/bootstrap.css" rel="stylesheet" />
    <title></title>
    <style>
        #main{
            
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="col-md-4"></div>
    <div id="main" class="col-md-4 form-group">
        <h1>请输入管理员密码</h1>
        <asp:TextBox ID="TextBox1" TextMode="Password"   runat="server"></asp:TextBox>
        <asp:Button ID="Button1" class="btn btn-default" runat="server" Text="进入" OnClick="Button1_Click" />
    </div>
        <div class="col-md-4"></div>
    </form>
</body>
</html>
