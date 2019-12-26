/*
    Created by IntelliJ IDEA.
    User: linjunli
    Date: 2019/6/24 0024
    Time: 9:21
    To change this template use File | Settings | File Templates.
*/
/**
 * 购买  books/add
 */
$("#btn2").click(function () {
    $.ajax({
        type:"POST",
        url:"books/buyBooks",
        // data:{
        //     article:"1"
        // },
        data:$("#form1").serialize(),
        dataType:"json",
        success:function (data) {
            if(data.msg=="success"){
                console.log(data.msg);
                layer.msg(data.msg,{
                    time:5000,
                    icon:1
                })
                setTimeout(function(){  //使用  setTimeout（）方法设定定时3000毫秒
                    window.location.reload();//页面刷新
                },3000);
            }
            else{
                layer.msg(data.msg,{
                    time:2000,
                    icon:5
                })
            }
        }
    })
})

/**
 * 收藏
 */
$("#btn1").click(function () {
    $.ajax({
        type:"POST",
        url:"books/addshopCart",
        data:$("#form1").serialize(),
        dataType:"json",
        success:function (data) {
            if(data.msg=="success"){
                console.log(data.msg);
                layer.msg(data.msg,{
                    time:2000,
                    icon:5
                })
            }
            else{
                layer.msg(data.msg,{
                    time:2000,
                    icon:5
                })
            }
        }
    })
})


