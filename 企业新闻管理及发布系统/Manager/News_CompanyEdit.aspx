<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="News_CompanyEdit.aspx.cs" Inherits="企业新闻管理及发布系统.Manager.News_CompanyEdit" %>
<%@ Register TagPrefix="ftb" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="../Js/jquery-2.2.3.min.js"></script>
    <script src="../Js/bootstrap.js"></script>
    <script src="../Js/bootstrap-datetimepicker.min.js"></script>
    <script src="../Js/Edit.js"></script>
    <script src="../kindeditor/lang/zh-CN.js"></script>
    <script src="../kindeditor/kindeditor-all.js"></script>
    <script src="../Js/jquery.shCircleLoader-min.js"></script>
    <script src="../Js/jquery.ui.widget.js"></script>
    <script src="../Js/jquery.fileupload.js"></script>
    <script src="../Js/jquery.iframe-transport.js"></script>
    <link href="../Css/jquery.shCircleLoader.css" rel="stylesheet" />
    <link href="../Css/Main.css" rel="stylesheet" />
    <link href="../Css/Buttons.css" rel="stylesheet" />
    <link href="../Css/bootstrap.css" rel="stylesheet" />
    <link href="../Css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <script>
        $('.dropdown-toggle').dropdown();
        KindEditor.ready(function(K) {
            window.editor = K.create('#editor_id', {
                uploadJson: '../kindeditor/asp.net/upload_json.ashx',
                fileManagerJson: '../kindeditor/asp.net/file_manager_json.ashx',
                allowFileManager: true,
                width: "100%",
                height:"400px"
            });
        });
        var options = {
            cssPath: '/css/index.css',
            filterMode: true,
            width:"200px"
        };
        //var editor = K.create('textarea[name="content"]', options);
        
</script>
    <script>
        $(function () {
            $("#weixin_image").fileupload({
                url: '../Asmx/FileUploadHandler.ashx',
                sequentialUploads: true
            }).bind('fileuploadprogress', function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $("#weixin_progress").css('width', progress + '%');
                $("#weixin_progress").html(progress + '%');
            }).bind('fileuploaddone', function (e, data) {
                if (data.result == "文件过大") {
                    alert("文件过大");
                } else {
                    $("#weixin_show").attr("src", data.result);
                    // $("#weixin_upload").css({ display: "none" });
                    //$("#weixin_cancle").css({ display: "" });
                    bigImage = data.result;
                }
            });

        });
</script>
    <style>
        .bar {
    height: 18px;
    background: green;
}
    </style>
    <title></title>
</head>
<body>
    <div class="mask"></div>
    <div id="load"></div>
    <form id="form1" runat="server">
        <h1 style="text-align:center">   </h1>
    <div class="row">
        <div class="col-md-2">
            <main:Manager_Side1 runat="server" />
        </div>
        <div class="col-md-10">

        
        <div class="row">
            <a class="button button-glow button-rounded button-royal" href="../Manager/News_CompanyList.aspx"><span class="glyphicon glyphicon-arrow-left"></span>后退</a>
        </div>
            <div class="row" style="text-align:center">
                <h2 id="a">新建新闻</h2>
            </div>
            <div class="row">
        <div class="col-md-2">
            
                    
                
        </div>
        <div class="col-md-8">
            
            <div class="row">
                <div class="form-group">
                    <label>标题</label>
                    <input id="Title" class="form-control" type="text" />

                <div class="form-group" >
                    <label>热门新闻显示的照片</label>
                   <div class="row fileupload-buttonbar" style="padding-left:15px;">  
<div class="thumbnail col-sm-6">  
<img id="weixin_show" style="height:180px;margin-top:10px;margin-bottom:8px;"  src="" data-holder-rendered="true">  
<div class="progress progress-striped active" role="progressbar" aria-valuemin="10" aria-valuemax="100" aria-valuenow="0"><div id="weixin_progress" class="progress-bar progress-bar-success" style="width:0%;"></div></div>  
<div class="caption" align="center">  
<span id="weixin_upload" class="btn btn-primary fileinput-button">  
<span>上传</span>  
<input type="file" id="weixin_image" name="weixin_image" accept="image/*">  
</span>  
<a id="weixin_cancle" href="javascript:void(0)" class="btn btn-warning" role="button" onclick="cancleUpload('weixin')" style="display:none">删除</a>  
</div>  
</div>  
</div>  
                    
                </div>
                    
                <div class="form-group">
                    <label>日期</label>
                    <input id="datetimepicker" class="form-control" type="text" />

                </div>
                <div class="form-group">
                    <select id="Type">
                    <option>公司新闻</option>
                    <option>媒体关注</option>
                    <option>新品资讯</option>
                </select>
                </div>
                <div id="edit" class="form-group">
                   <textarea id="editor_id" name="content" style="width:700px;height:300px;"></textarea>
                </div>
                    <div class="form-group">
                        <label>是否可见</label>
                        <input id="Visible" type="checkbox" />
                    </div>
                    <div class="form-group">
                        <label>是否热点</label>
                        <input id="Hot" type="checkbox" />
                    </div>
                <div class="row" style="text-align:center">
                    <input id="Submit" class="button button-glow button-rounded button-royal" type="button" value="button" />
                    
                </div>
            </div>
        </div>
        <div class="col-md-2">
        </div>
                </div>
       </div>




    </div>
    </form>
</body>
</html>
