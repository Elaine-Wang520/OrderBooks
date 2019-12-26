/**
 * 删除购物车的某一条记录
 * @param del
 * @param cId
 */
function deletecm(del,cId) {
    console.log(cId);
    $.ajax({
        type:"GET",
        url:"users/delBuyCart?id="+cId,
        dataType:"json",
        success:function (data) {
            if(data.msg=="success"){
                //直接在页面移除掉删除的标签
                console.log($(del));
                console.log($(del).parent());
                //jQuery不能直接调用js里面的原生函数
                //$("")[0] 伪数组的形式存在
                $(del).parent().remove();
                window.location.reload();
            }else{
                layer.msg(data.msg,{
                    time:3000,
                    icon:5
                })
            }
        }
    })
}

/**
 * 购买某一本书籍
 * @param del
 * @param cId
 */
function buyOneBook(del,cId) {
    console.log(cId);
    $.ajax({
        type:"GET",
        url:"users/buyOneBook?id="+cId,
        dataType:"json",
        success:function (data) {
            if(data.msg=="success"){
                //直接在页面移除掉删除的标签
                layer.msg("购买成功",{
                    time:3000,
                    icon:1
                })
                $(del).parent().remove();
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
}

/**
 * 购买书籍后所有清空
 */
function buyallbooks() {
    $.ajax({
        type:"GET",
        url:"users/buyCartBooks",
        dataType:"json",
        success:function (data) {
            if(data.msg=="success"){
                //直接在页面移除掉删除的标签
                layer.msg("购买成功",{
                    time:3000,
                    icon:1
                })
                $().parent().parent().parent().remove();
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
}
