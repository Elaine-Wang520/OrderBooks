/*
* 添加公告
*
* */
$("#btn").click(function () {

    //前后端分离后，不能用request传输数据 ajax传输数据
    $.ajax({
        type:"POST",
        url:"messages/add",
        data:$("form").serialize(),//对form表单的所有数据序列化 可以直接传输到后台
        dataType:"json",
        success:function (data) {
            if(data.msg=="success"){
                layer.msg(data.msg,{
                    time:3000,
                    icon:1
                }),
                window.location.reload();
            }
            else{
                layer.msg(data.msg,{
                    time:3000,
                    icon:5
                })
            }
        }
    })
})

/*
* 删除公告
* */
function deletecm(del, cId) {
    $.ajax({
        type:"GET",
        url:"messages/del?id="+cId,
        dataType:"json",
        success:function (data) {
            //console.log(del);

            if (data.msg == "success") {
                $(del).parent().parent().remove();
            }else{
                layer.msg(data.msg,{
                    time:3000,
                    icon:5
                })
            }
        }
    })
}