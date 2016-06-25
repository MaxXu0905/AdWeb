var adcakehref = function(data,event,hrefpage,alertifytype)
{
	if(data&&data.errorCode != 0)  //不等于0代表是错误的
	{
		//alert(data.rspDesc);
		if(alertifytype)
		{
			if(alertifytype == "log")
				alertify.log(data.rspDesc?data.rspDesc:"未知错误");
			else if(alertifytype == "error")
				alertify.error(data.rspDesc?data.rspDesc:"未知错误");
			else if(alertifytype == "success")
				alertify.success(data.rspDesc?data.rspDesc:"未知错误");
		}
		else
		{
			reset();
			alertify.alert(data.rspDesc?data.rspDesc:"未知错误");
		}
			
		return;
	}
	else if(data&&data.errorCode == -1)
	{
		if(window.event)
			window.event.returnValue = false;
		else 
			e.preventDefault();
			window.location="login.jsp";
		return;
	}
	else
	{
		if(window.event)
			window.event.returnValue = false;
		else 
			e.preventDefault();
			window.location=hrefpage;
		return;
	}
	
};

var reset = function () {
	alertify.set({
		labels : {
			ok     : "OK",
			cancel : "Cancel"
		},
		delay : 5000,
		buttonReverse : false,
		buttonFocus   : "ok"
	});
};

String.prototype.trim= function(){  
    // 去掉左右空格
    return this.replace(/(^\s*)|(\s*$)/g, "");  
};