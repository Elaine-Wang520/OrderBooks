/**
 * 修改用户信息
 */
$("#btn").click(function () {
    $.ajax({
        type:"POST",
        url:"users/alter",
        data:$("form").serialize(),
        dataType:"json",
        success:function (data) {
            if(data.msg=="success"){
                layer.msg("修改成功",{
                    time:3000,
                    icon:1
                })
                setTimeout(function(){  //使用  setTimeout（）方法设定定时3000毫秒
                    window.location.reload();//页面刷新
                },3000);
            }else{
                layer.msg(data.msg,{
                    time:3000,
                    icon:5
                })
            }
        }
    })
})
