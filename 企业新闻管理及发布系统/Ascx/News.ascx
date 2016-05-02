<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainView.ascx.cs" Inherits="企业新闻管理及发布系统.Ascx.MainView" %>
<div class="col-md-10">
    <div class="col-md-1">
        <a href="../Manager/News_CompanyEdit.aspx?Type=New">添加</a>
    </div>
    <asp:Repeater id="List" runat="server">
        <HeaderTemplate>
            <tr>
                <td>新闻标题</td>
                <td>类别</td>
                <td>添加日期</td>
                <td>操作</td>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%Eval("Title"); %></td>
                <td><%Eval("Type"); %></td>
                <td><%Eval("Date"); %></td>
                <td><a href="../Manager/News_CompanyEdit.aspx?ID=<%Eval("ID"); %>,Type=Edit">编辑</a></td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
</div>