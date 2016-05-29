(function ($) {//获取地址栏的参数
    $.getUrl = function (name) {
        var reg= new RegExp("(^|&)" +name + "=([^&]*)(&|$)");
       // var reg = new RegExp("(^|&)ID=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null)
            return unescape(r[2]);
        else
            return null;
    }



})(jQuery);
$(document).ready(function () {
    $('#datetimepicker').datetimepicker({//设置日期控件
        format: 'yyyy-mm-dd hh:ii'
    });

    if ($.getUrl("Type") == "Edit") {
        var id = $.getUrl("ID");
        //GetData(id);//获取数据
        $("#Submit").val("修改");
        $("#a").html("修改新闻");
        MaskShow();
        setTimeout('GetData('+id+')', 1000);//延迟获取数据
        $("#Submit").click(function () {
            
            
            editor.sync();
            
            if ($("#Title").val() == "") {//检测标题是否为空
                alert("标题不能为空");
                return;
            }
            if ($("#datetimepicker").val() == "") {//检测时间是否为空
                alert("时间不能为空");
                return;
            }

            if ($("#editor_id").val() == "") {//检测内容是否为空
                alert("内容不能为空");
                return;
            }
            MaskShow();//显示遮蔽层
            setTimeout('Revise(' + id + ')', 1000);



        });
    }
    else if ($.getUrl("Type") == "New") {
        
        $("#Submit").val("新建");
        $("#Submit").click(function () {
            



            editor.sync();
            if ($("#Title").val() == "") {//检测标题是否为空
                alert("标题不能为空");
                return;
            }
            if ($("#datetimepicker").val() == "") {//检测时间是否为空
                alert("时间不能为空");
                return;
            }
            
            if ($("#editor_id").val() == "") {//检测内容是否为空
                alert("内容不能为空");
                return;
            }
            MaskShow();//显示遮蔽层
            setTimeout('New()', 1000);



        });
    }

    
    
});
function GetData(id){//从数据库中获取数据
    
    $.post("../Asmx/Edit.asmx/GetData", {
        ID:id




    }, function (data) {
        MaskHide();
        
        var result = eval("("+data+")");
        $("#Title").val(result.ds[0].Title) ;
        $("#datetimepicker").val(result.ds[0].Date);
        
        $('#Type').get(0).selectedIndex = 0;
        $("#Type option").each(function (i, n) {//设置select控件的默认选中的对象
            if ($(n).val() == result.ds[0].Type.trim()) {
                $(n).attr("selected", true);
            }
        })
        if (result.ds[0].Visible == 1)
            $("#Visible").attr('checked', 'True');
        if (result.ds[0].Hot == 1)
            $("#Hot").attr('checked', 'True');
        $("#weixin_show").attr("src", result.ds[0].BigImage);
        bigImage = result.ds[0].BigImage;
        editor.html(result.ds[0].DetailContent);
        


    });
}
var bigImage;
function New() {//新建ajax操作
    
    var title = $("#Title").val();
    
    var date = $("#datetimepicker").val();
    var type = $("#Type").val();
    var detailContent = $("#editor_id").val();
    var visible;
    var hot;
    if ($("#Visible").is(':checked') == true)
        visible = 1;
    else
        visible = 0;
    if ($("#Hot").is(':checked') == true)
        hot = 1;
    else
        hot = 0;
    
    detailContent = detailContent.replace(new RegExp("<", "g"), '-==--==-');//替换危险字符
    detailContent = detailContent.replace(new RegExp("'", "g"), "''");
    $.post("../Asmx/Edit.asmx/Submit", {//ajax
        Title: title,
        Date: date,
        Type: type,
        DetailContent: detailContent,
        BigImage: bigImage,
        Visible: visible,
        Hot:hot
    }, function (data) {
        alert(data);
        if (data == "新建成功")
            location.href = "News_CompanyList.aspx?Page=1";

    });
    
}
function Revise(id) {//修改ajax操作

    var title = $("#Title").val();
    var date = $("#datetimepicker").val();
    var type = $("#Type").val();
    var detailContent = $("#editor_id").val();
    var visible;
    var hot;
    if ($("#Visible").is(':checked') == true)
        visible = 1;
    else
        visible = 0;
    if ($("#Hot").is(':checked') == true)
        hot = 1;
    else
        hot = 0;
    
    detailContent = detailContent.replace(new RegExp("<", "g"), '-==--==-');//替换危险字符
    detailContent = detailContent.replace(new RegExp("'", "g"), "''");
    $.post("../Asmx/Edit.asmx/Revise", {//ajax
        Title: title,
        Date: date,
        Type: type,
        DetailContent: detailContent,
        ID:id,
        BigImage: bigImage,
        Visible: visible,
        Hot:hot
    }, function (data) {
        alert(data);
        if (data == "修改成功")
            location.href = "News_CompanyList.aspx?Page=1";

    });

}
function MaskShow() {//显示等待动画效果
    $(".mask").css("height", $(document).height());//设置遮蔽层
    $(".mask").css("width", $(document).width());
    $(".mask").show();
    $("#load").shCircleLoader({
        namespace: 'myns',
        color: 'transparent',
        dotsRadius: 100
    });
    $("#load").css("height", 100);
    $("#load").css("width", 100);
    $("#load").show();
}
function MaskHide() {
    $(".mask").hide();
    $("#load").hide();
}