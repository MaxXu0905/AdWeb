<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>TT拾贝</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Le styles -->
<link rel="shortcut icon" href="images/icon/favicon.ico" />

<!-- 自定义css.css -->
<link type="text/css" href="css/sharecss.css" rel="stylesheet" />
<!--[if IE 7]>
            <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css">
            <![endif]-->
<!--[if lt IE 9]>
            <link rel="stylesheet" type="text/css" href="css/custom-theme/jquery.ui.1.10.0.ie.css"/>
            <![endif]-->

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
            <![endif]-->
<!-- Le fav and touch icons -->
<!--[if lt IE 9]>
     		<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js">
			</script> <![endif]-->
</head>

<body data-spy="scroll" data-target=".bs-docs-sidebar"
	data-twttr-rendered="true">
	<div
		style="margin-top:2%;margin-left:10%;margin-right:10%;padding-bottom:1%;border-bottom:1px solid #DCDCDC;"
		id="oHeader">
		<div><image id="oLogo" src="images/icon/icon.png"
			 />
		<span id="oLogoName" style="font-weight:bold;font-size:22px">TT拾贝</span></div>
		<div id="oLogoTitle" style="font-weight:bold;color:#f6851f">“让枯燥生活变得简单！”</div>
		<div id="oWebsite" style="font-size:12px;color:red;"><a href="http://localhost:8080/AdWeb" target="_blank">访问TT拾贝主页</a></div>
	</div>
	<div style="clear:both;"></div>

	<div
		style="display:inline;margin-top:10%;border-bottom:1px solid #DCDCDC">
		<div id="oLeft">
			<ul>
				<li><span style="color:#4a5265">在TT拾贝中，解锁、广告、活动以及推荐都能带来惊喜。</span></li>
				<li><span style="color:#4a5265">连续10天登录、视频数量30个、参加一个活动、推荐满5人即可获得一个海贝。
				3个海贝可升级为一个骨贝。3个骨贝可升级为一个铜贝。3个铜贝可升级为一个银贝。3个银贝可升级为一个金贝。一个铜贝等值于一个等级。
				一个等级可提升一个广告限制数量，时间间隔减少15分钟。最高限制数量上限为15个，时间间隔最短为半个小时。
				</span></li>
			</ul>
		</div>
		<div id="oRight" style="border:1px solid #DCDCDC;">
			<div
				style="border-bottom:1px solid #DCDCDC;height:40px;background:#fcfcfc">
				<span
					style="font-weight:bold;height:45px;line-height:45px;margin-left:5px">软件下载</span>
			</div>
			<div style="text-align:center;margin-top:5%">
				<image id="oAndroidDownloadImg"
					src="images/homepage/androiddownload.png" style="cursor:pointer" />
			</div>
			<div style="text-align:center;">
				<span style="font-size:12px;color:gray">
					版本：V1.0.0
					最后更新时间：2013年10月12日
				</span>
			</div>
		</div>
	</div>
	<div style="clear:both"></div>
<!-- 	<div id="oBottom"> -->
<!-- 		<div style="border-top:1px solid #DCDCDC;margin-left:5%;margin-right:5%;margin-top:20px;padding-top:20px"> -->
<!-- 			<div class="moduleDiv" id="oLocker"> -->
<!-- 				<div class="moduleTitleDiv"> -->
<!-- 					<span>TT拾贝锁屏</span> -->
<!-- 				</div> -->
<!-- 				<p> -->
<!-- 					<span class="moduleContentSpan">每次我不经意的解锁，都能看到不同的精彩,不同的惊喜！</span> -->
<!-- 				</p> -->
<!-- 				<div> -->
<!-- 				<image id="oLockerImg" src="images/homepage/locker.png" ></div> -->
<!-- 			</div> -->
<!-- 			<div class="moduleDiv" id="oRecomend"> -->
<!-- 				<div  class="moduleTitleDiv"> -->
<!-- 					<span>推荐有惊喜</span> -->
<!-- 				</div> -->
<!-- 				<p> -->
<!-- 					<span>分享给我的小伙伴们，我和我的小伙伴们都惊呆了！</span> -->
<!-- 				</p> -->
<!-- 				<image id="oRecommendImg" src="images/homepage/locker.png" > -->
<!-- 			</div> -->
<!-- 			<div class="moduleDiv" id="oAd"> -->
<!-- 				<div class="moduleTitleDiv"> -->
<!-- 					<span>TT拾贝视频</span> -->
<!-- 				</div> -->
<!-- 				<p> -->
<!-- 					<span>每当我在路上感到无聊时，我都会打开TT拾贝，看看各种广告。</span> -->
<!-- 				</p> -->
<!-- 				<image id="oAdImg" src="images/homepage/ad.png"/> -->
<!-- 			</div> -->
<!-- 			<div style="clear:both"></div> -->
<!-- 			<div class="moduleDiv" id="oActivity"> -->
<!-- 				<div class="moduleTitleDiv"> -->
<!-- 					<h4>TT拾贝活动</h4> -->
<!-- 				</div> -->
<!-- 				<p> -->
<!-- 					<span>当周末来临但又无所事事的时候，我都会打开TT拾贝，参加各种活动。</span> -->
<!-- 				</p> -->
<!-- 				<image id="oActivityImg"  src="images/homepage/activity.png" /> -->
<!-- 			</div> -->
<!-- 			<div class="moduleDiv" id="oWidthdraw"> -->
<!-- 				<div class="moduleTitleDiv"> -->
<!-- 					<h4>TT拾贝排行榜</h4> -->
<!-- 				</div> -->
<!-- 				<p> -->
<!-- 					<span>每当我获得了一份奖金，我都会看看排行榜，看看我离达人还有多远。</span> -->
<!-- 				</p> -->
<!-- 				<image id="oWithdrawImg" src="images/homepage/activity.png" /> -->
<!-- 			</div> -->
<!-- 			<div class="moduleDiv" id="oWidthdraw"> -->
<!-- 				<div class="moduleTitleDiv"> -->
<!-- 					<h4>TT拾贝提现</h4> -->
<!-- 				</div> -->
<!-- 				<p> -->
<!-- 					<span>每次当我提现成功后，我都会犒赏一下自己，吃个蛋糕、买杯咖啡，轻松一刻。</span> -->
<!-- 				</p> -->
<!-- 				<image id="oWithdrawImg" src="images/homepage/activity.png" /> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<div style="clear:both"></div>
	</div>
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="assets/js/jquery-1.9.0.min.js" type="text/javascript"></script>
	<script type="text/javascript">
        
       	 var baseurl = "<%="http://" + request.getServerName() + ":"
					+ request.getServerPort() + request.getContextPath() + "/"%>";
		$(document)
				.ready(
						function() {
							$("image#oAndroidDownloadImg")
									.mousedown(
											function() {
												$("image#oAndroidDownloadImg")
														.attr("src",
																"images/homepage/androiddownloadmd.png");
											});

							$("image#oAndroidDownloadImg")
									.mouseup(
											function() {
												$("image#oAndroidDownloadImg")
														.attr("src",
																"images/homepage/androiddownload.png");
											});

							$("image#oAndroidDownloadImg")
									.click(
											function() {
												window
														.open("http://adlooker.oss.aliyuncs.com/AdLooker.apk");
											});
						});
	</script>
</body>
</html>