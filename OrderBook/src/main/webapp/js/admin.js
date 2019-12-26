/**
 * 删除用户
 * @param that
 * @param id
 */
function deleteUser(that,id) {
    $.ajax({
        type:"get",
        url:"admins/deleteuser?id="+id,
        datatype:"json",
        success:function (data) {
            if (data.msg=="success") {
                //直接在页面移除该用户
                $(that).parent().parent().remove();
            }
            else {
                layer.msg(data.msg,{
                    time:3000,
                    icon:5
                })
            }
        }
    })
}
/**
 * 删除管理员
 * @param that
 * @param id
 */
function deleteAd(that,id) {
    $.ajax({
        type:"get",
        url:"admins/deleteadmin?id="+id,
        datatype:"json",
        success:function (data) {
            if (data.msg=="success") {
                //直接在页面移除该用户
                $(that).parent().parent().remove();
            }
            else {
                layer.msg(data.msg,{
                    time:3000,
                    icon:1
                })
            }
        }
    })
}
$("#add_btn").click(function () {
    $.ajax({
        type:"post",
        url:"admins/add",
        data:$("#admin_form").serialize(),
        datatype:"json",
        success:function (data) {
            if(data.msg=="success") {
                layer.msg(data.msg,{
                    time:3000,
                    icon:1
                })
            }
            else {
                layer.msg(data.msg,{
                    time:3000,
                    icon:5
                })
            }
        }
    })
})
$("#book_btn").click(function () {
    $.ajax({
        type: "post",
        url: "admins/addbook",
        data: $("#book_form").serialize(),
        datatype: "json",
        success: function (data) {
            console.log(data.msg)
            if (data.msg == "success") {
                console.log(data.msg);
                layer.msg(data.msg, {
                    time: 5000,
                    icon: 1
                })
                setTimeout(function () {  //使用  setTimeout（）方法设定定时3000毫秒
                    window.location.reload();//页面刷新
                }, 3000);
            } else {
                layer.msg(data.msg, {
                    time: 3000,
                    icon: 5
                })
            }
        },
        error: function (a, b, c) {
            console.log(c)
        }
    })
})

/**
 * 删除教材
 * @param that
 * @param id
 */
function deleteBook(that,id) {
    $.ajax({
        type:"get",
        url:"admins/deletebook?id="+id,
        datatype:"json",
        success:function (data) {
            if (data.msg=="success") {
                //直接在页面移除
                $(that).parent().parent().remove();
            }
            else {
                layer.msg(data.msg,{
                    time:3000,
                    icon:1
                })
            }
        }
    })
}
$("#bi_btn").click(function () {
    $.ajax({
        type:"post",
        url:"admins/bookInfo",
        data:$("#bi_form").serialize(),
        datatype:"json",
        success:function (data) {
            if(data.msg=="success") {
                console.log(data.msg);
                layer.msg(data.msg, {
                    time: 3000,
                    icon: 1
                })
                setTimeout(function(){  //使用  setTimeout（）方法设定定时3000毫秒
                    window.location.reload();//页面刷新
                },3000);
            }
            else {
                layer.msg(data.msg,{
                    time:3000,
                    icon:5
                })
            }
        }
    })
})