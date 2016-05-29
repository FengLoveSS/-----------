<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="企业新闻管理及发布系统.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="Js/jquery-2.2.3.min.js"></script>
    <script src="Js/bootstrap.js"></script>
    <script src="Js/jquery.nivo.slider.js"></script>
    <script src="../Js/messenger.min.js"></script>
    <link href="../Css/messenger.css" rel="stylesheet" />
    
    <link href="../Css/messenger-theme-future.css" rel="stylesheet" />
    <link rel="stylesheet" href="themes/default/default.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="themes/light/light.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="themes/dark/dark.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="themes/bar/bar.css" type="text/css" media="screen" />
    <link href="Css/Main.css" rel="stylesheet" />
    <link href="Css/bootstrap.css" rel="stylesheet" />
    <link href="Css/style.css" rel="stylesheet" />
    <link href="Css/nivo-slider.css" rel="stylesheet" />
    <!-- 写点样式，让轮播好看点 -->
<style>
#slider{width:780px; height:350px; margin:40px auto;background:url(images/loading.gif) 
 no-repeat 50% 50%;} 


</style>
    
   <!-- 最后用js控制 -->
<script>
    $(window).load(function () {
        $('#slider').nivoSlider();
    });

</script>
    <script>//实现Message
        $(document).ready(function () {
            $._messengerDefaults = {
                extraClasses: 'messenger-fixed messenger-theme-future messenger-on-bottom messenger-on-right'
            }
            $.globalMessenger().post("欢迎进入热点新闻板块");

        });

    </script>

    <title></title>
</head>
<body>
    
    
    <div id="main" >
    <form id="form1" runat="server">
        
        <Main:Top runat="server"></Main:Top>
        <Main:Header1 runat="server"></Main:Header1>
         <div id="wrapper">
        <div class="slider-wrapper theme-default">
            <div id="slider" class="nivoSlider">
               <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <a href="News/New_Detail.aspx?ID=<%#Eval("ID") %>"><img src="<%#Eval("BigImage") %>" data-thumb="<%#Eval("BigImage") %>" alt="" title="<%#Eval("Title") %>" /></a>
                    </ItemTemplate>
                </asp:Repeater>
                
            </div>
            
        </div>
        <div class="footer-banner" style="width:728px; margin:0 auto"></div>
    </div>
    
   
            
    </form>
        </div>
    
</body>
</html>
