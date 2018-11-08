//刷新页面
function f5() {
    location.reload();
}

function GotoUrl(url) {
    if (IsN(url)) {
        return false;
    }

    window.location.href = url;
}

function IsN(str) {
    return (str == "" || str == undefined || str == null) ? true : false;
}

function isArray(obj) {
    return Object.prototype.toString.call(obj) === '[object Array]';
}

//region toastr
function ToastrError(msg, title, times) {
    if (IsN(title)) {
        title = '错误';
    }

    if(IsN(times)){
        times = 3000;
    }

    $.toast({
        // Text that is to be shown in the toast
        text: msg,

        // Text that is to be shown in the toast
        heading: title,

        // Type of toast icon
        icon: 'error',

        // fade, slide or plain
        showHideTransition: 'fade',

        // Boolean value true or false
        allowToastClose: false,

        // false to make it sticky or number representing the miliseconds as time after which toast needs to be hidden
        hideAfter: times,

        // false if there should be only one toast at a time or a number representing the maximum number of toasts to be shown at a time
        stack: false,

        // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values
        position: 'top-center',

        // Text alignment i.e. left, right or center
        textAlign: 'left',

        // Whether to show loader or not. True by default
        loader: true,

        // Background color of the toast loader
        loaderBg: '#9ec600',

        // will be triggered before the toast is shown
        beforeShow: function () {},

        // will be triggered after the toat has been shown
        afterShown: function () {},

        // will be triggered before the toast gets hidden
        beforeHide: function () {},

        // will be triggered after the toast has been hidden
        afterHidden: function () {}
    });
}

function ToastrWarning(msg, title, times) {
    if (IsN(title)) {
        title = '警告';
    }

    if(IsN(times)){
        times = 3000;
    }

    $.toast({
        // Text that is to be shown in the toast
        text: msg,

        // Text that is to be shown in the toast
        heading: title,

        // Type of toast icon
        icon: 'warning',

        // fade, slide or plain
        showHideTransition: 'fade',

        // Boolean value true or false
        allowToastClose: false,

        // false to make it sticky or number representing the miliseconds as time after which toast needs to be hidden
        hideAfter: times,

        // false if there should be only one toast at a time or a number representing the maximum number of toasts to be shown at a time
        stack: false,

        // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values
        position: 'top-center',

        // Text alignment i.e. left, right or center
        textAlign: 'left',

        // Whether to show loader or not. True by default
        loader: true,

        // Background color of the toast loader
        loaderBg: '#9ec600',

        // will be triggered before the toast is shown
        beforeShow: function () {},

        // will be triggered after the toat has been shown
        afterShown: function () {},

        // will be triggered before the toast gets hidden
        beforeHide: function () {},

        // will be triggered after the toast has been hidden
        afterHidden: function () {}
    });
}

function ToastrSuccess(msg, title, times) {
    if (IsN(title)) {
        title = '成功';
    }

    if(IsN(times)){
        times = 3000;
    }

    $.toast({
        // Text that is to be shown in the toast
        text: msg,

        // Text that is to be shown in the toast
        heading: title,

        // Type of toast icon
        icon: 'success',

        // fade, slide or plain
        showHideTransition: 'fade',

        // Boolean value true or false
        allowToastClose: false,

        // false to make it sticky or number representing the miliseconds as time after which toast needs to be hidden
        hideAfter: times,

        // false if there should be only one toast at a time or a number representing the maximum number of toasts to be shown at a time
        stack: false,

        // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values
        position: 'top-center',

        // Text alignment i.e. left, right or center
        textAlign: 'left',

        // Whether to show loader or not. True by default
        loader: true,

        // Background color of the toast loader
        loaderBg: '#9ec600',

        // will be triggered before the toast is shown
        beforeShow: function () {},

        // will be triggered after the toat has been shown
        afterShown: function () {},

        // will be triggered before the toast gets hidden
        beforeHide: function () {},

        // will be triggered after the toast has been hidden
        afterHidden: function () {}
    });
}

function ToastrInfo(msg, title, times) {
    if (IsN(title)) {
        title = '消息';
    }

    if(IsN(times)){
        times = 3000;
    }

    $.toast({
        // Text that is to be shown in the toast
        text: msg,

        // Text that is to be shown in the toast
        heading: title,

        // Type of toast icon
        icon: 'info',

        // fade, slide or plain
        showHideTransition: 'fade',

        // Boolean value true or false
        allowToastClose: false,

        // false to make it sticky or number representing the miliseconds as time after which toast needs to be hidden
        hideAfter: times,

        // false if there should be only one toast at a time or a number representing the maximum number of toasts to be shown at a time
        stack: false,

        // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values
        position: 'top-center',

        // Text alignment i.e. left, right or center
        textAlign: 'left',

        // Whether to show loader or not. True by default
        loader: true,

        // Background color of the toast loader
        loaderBg: '#9ec600',

        // will be triggered before the toast is shown
        beforeShow: function () {},

        // will be triggered after the toat has been shown
        afterShown: function () {},

        // will be triggered before the toast gets hidden
        beforeHide: function () {},

        // will be triggered after the toast has been hidden
        afterHidden: function () {}
    });
}
//endregion toastr

//region Alert
function AlertTips(msg, times) {
    if(IsN(times)){
        times = 2000;
    }

    swal({
        position: 'top-right',
        type: 'info',
        title: msg,
        showConfirmButton: false,
        timer: times,
        allowOutsideClick: false
    })
}

//警告消息提示框
function AlertWarning(msg, title, btncolor) {
    if(IsN(title)){
        title = '';
    }

    if(IsN(btncolor)){
        btncolor = '#fad08c';
    }

    swal({
        title: title,
        text: msg,
        type: 'warning',
        confirmButtonText: "确定",
        confirmButtonColor: btncolor,
        allowOutsideClick: false
    });
}

//错误消息提示框
function AlertError(msg, title, btncolor) {
    if(IsN(title)){
        title = '';
    }

    if (IsN(btncolor)) {
        btncolor = '#f77477';
    }

    swal({
        title: title,
        text: msg,
        type: "error",
        confirmButtonColor: btncolor,
        confirmButtonText: "确定",
        allowOutsideClick: false
    });
}

//成功消息提示框
function AlertSuccess(msg, title, btncolor) {
    if(IsN(title)){
        title = '';
    }

    if (IsN(btncolor)) {
        btncolor = '#a0dd8b';
    }

    swal({
        title: title,
        text: msg,
        type: "success",
        confirmButtonColor: btncolor,
        confirmButtonText: "确定",
        allowOutsideClick: false
    });
}

//消息提示框
function AlertInfo(msg, title, btncolor) {
    if(IsN(title)){
        title = '';
    }

    if (IsN(btncolor)) {
        btncolor = '#29c2eb';
    }

    swal({
        title: title,
        text: msg,
        type: "info",
        confirmButtonColor: btncolor,
        confirmButtonText: "确定",
        allowOutsideClick: false
    });
}

//消息询问框
function AlertQuestion(msg, title, btncolor) {
    if(IsN(title)){
        title = '';
    }

    if (IsN(btncolor)) {
        btncolor = '#c8dae0';
    }

    swal({
        title: title,
        text: msg,
        type: "question",
        confirmButtonColor: btncolor,
        confirmButtonText: "确定",
        allowOutsideClick: false
    });
}

//endregion Alert

//region Modal Alert
function AlertModalError(title, msglist, btnlabel) {
    var sTitle = null;
    var sMsg = null;
    var sButtonLabel = "确定";

    if (IsN(title)) {
        sTitle = "错误提示";
    } else {
        sTitle = title;
    }

    if (!IsN(btnlabel)) {
        sButtonLabel = btnlabel;
    }

    if (!isArray(msglist)) {
        sMsg = '<ul><li class="text-danger">' + msglist + '</li></ul>';
    } else {
        var ErrorDom = [];
        var ErrorList = msglist;
        var nErrorCount = 0;

        if (!IsN(ErrorList)) {
            nErrorCount = ErrorList.length;
        }

        ErrorDom.push('<ul>');

        for (var i = 0; i < nErrorCount; i++) {
            ErrorDom.push('<li class="text-danger">' + ErrorList[i] + '</li>');
        }

        ErrorDom.push('</ul>');

        sMsg = ErrorDom.join('');
    }


    var options = {
        message: sMsg,
        title: '<span class="text-danger">' + sTitle + '</span>',
        size: 'sm',
        subtitle: '',
        useBin: false,
        buttons: [
            {text: sButtonLabel, style: 'danger', close: true}
        ]
    };

    eModal.alert(options);
}

//endregion Modal Alert

//点击列表主checkbox，设置子checkbox的选中状态
//主、子checkbox的name必须是固定的
function ListMainCheckBoxClick(obj) {
    var MainCheckBoxStatus = $(obj).prop("checked");

    $('input[name="list_chk_sub"]').each(function () {
        $(this).prop("checked", MainCheckBoxStatus);
    });

    $('input[name="list_chk_all"]').each(function () {
        $(this).prop("checked", MainCheckBoxStatus);
    });
}

//点击列表子checkbox，设置主checkbox的选中状态
//主、子checkbox的name必须是固定的
function ListSubCheckBoxClick(obj) {
    //获取当前点击的checkbox的选中状态
    var blSubCheckBoxStatus = $(obj).prop("checked");

    if (blSubCheckBoxStatus === false) {
        //如果当前checkbox是取消选中状态，则设置上级全选checkbox为取消选中状态
        $('input[name="list_chk_all"]').each(function () {
            $(this).prop("checked", false);
        });
    } else {
        //初始化lv2级栏目的状态
        var blAllStatus = blSubCheckBoxStatus;

        $('input[name="list_chk_sub"]').each(function () {
            //如果有一个状态，与初始化的不匹配，则退出循环
            if ($(this).prop("checked") != blAllStatus) {
                blAllStatus = !blAllStatus;
                return false;
            }
        });

        //赋值lv1级栏目全选checkbox状态
        $('input[name="list_chk_all"]').each(function () {
            $(this).prop("checked", blAllStatus);
        });
    }
}

//获取列表中选中的checkbox的值，返回逗号分割的字符串
function GetListCheckBoxSelectValue(checkbox_name) {
    var ValueList = [];
    var blSubCheckBoxStatus = false;

    if (IsN(checkbox_name)) {
        checkbox_name = "list_chk_sub";
    }

    $('input[name="' + checkbox_name + '"]').each(function () {
        blSubCheckBoxStatus = $(this).prop("checked");

        if (blSubCheckBoxStatus === true) {
            ValueList.push($(this).val());
        }
    });

    return ValueList.join(",");
}

function DeleteData(fields, val, url) {
    AlertError(fields + '|' + val + '|' + url);
}

function SetSubmitButtonDisable(obj) {
    var sFormID = $(obj).attr('data-form-id');
    $(obj).attr('disabled', true).html('<i class="fa fa-spin fa-spinner"></i>&nbsp;正在保存数据');

    $('#' + sFormID).submit();
}

function LockUI(obj, msg, spinner) {
    if(IsN(msg)){
        msg = '';
    }

    if (IsN(spinner)) {
        spinner = 'accordion';
    }

    obj.busyLoad("show", {
        spinner: spinner,
        text: msg,
        textPosition: "left",
        background: "rgba(0, 0, 0, 0.6)",
        animation: "fade",
        color: "rgba(255, 255, 255, 1)",
        fontSize: "16px"
    });
}

function UnLockUI(obj) {
    obj.busyLoad("hide", {
        animation: "fade"
    });
}

function strTrim(str)
{
    if(!str){
        return '';
    }
    return str.replace(/(^\s*)|(\s*$)/g, "");
}

function isPhone(str) {
    var mobileRegex = /^(((1[3456789][0-9]{1})|(15[0-9]{1}))+\d{8})$/;
    if(!mobileRegex.test(str)){
        return false;
    }
    return true;

}

function isIdcard(ID) {
    //系数
    var coefficient = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
    //校验码
    var checkDigit = ["1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2"];
    var sum = 0;
    coefficient.forEach(function (ele,index) {
        sum += ele*ID[index];
    });
    //余数
    var remainder = sum%11;
    if(checkDigit[remainder]==ID[ID.length-1]){
        return true;
    }else {
        return false;
    }

}

function formatDate(timeInt) {
    if(timeInt){
        var thisTime = new Date(timeInt);
        var Y = thisTime.getFullYear() + '-';
        var M = (thisTime.getMonth()+1 < 10 ? '0'+(thisTime.getMonth()+1) : thisTime.getMonth()+1) + '-';
        var D = (thisTime.getDate() < 10 ? '0'+thisTime.getDate() : thisTime.getDate()) + ' ';
        var h = (thisTime.getHours() < 10 ? '0'+thisTime.getHours() : thisTime.getHours()) + ':';
        var m = (thisTime.getMinutes() < 10 ? '0'+thisTime.getMinutes() : thisTime.getMinutes()) + ':';
        var s = (thisTime.getSeconds() < 10 ? '0'+thisTime.getSeconds() : thisTime.getSeconds());
        return Y+M+D+h+m+s;
    }else{
        return ''
    }
}