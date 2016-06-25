<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
        <html lang="en">
        <head>
            <meta charset="utf-8">
            <title>TT拾贝等级计算表</title>
            
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
			<!-- 鑷畾涔塩ss.css -->
			<link type="text/css" href="css/css.css" rel="stylesheet" />
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
            <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
            <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
            <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
            <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
        </head>

		<style tyle="text/css">
			td
			{
				border-right:1px solid ;
				border-bottom:1px solid ;
			}
			
		</style>

        <body data-spy="scroll" data-target=".bs-docs-sidebar" data-twttr-rendered="true" style="font-size:12px">
<!--         	<span>【求观赏】限额观看，【趣味锁屏】以及【求参与】无上限。升级后可增加每天【求观赏】个数以及奖励。</span> -->
        	<span style="font-size；14px;font-weight:bold">等级规则：</span>
        	<br/>
        	<span>TT拾贝等级由5个标识图展示。从低到高为海贝、骨贝、铜贝、银贝、金贝。</span>
        	<br/>
        	<span>其中，4海贝=1骨贝，4骨贝=1铜贝，4铜贝=1银贝，4银贝=1金贝。1骨贝=1级。</span>
        	<br/>
        	<span style="color:red">注：表格中只计算等级与【求观赏】对应的奖励。【趣味锁屏】以及【求参与】奖励无上限哦！</span>
        	<table cellspacing="0" style="border-top:1px solid ;border-left:1px solid ;text-align:center">
        		<thead>
        			<tr>
        				<td>级数</td>
        				<td>图标</td>
        				<td>模式</td>
        				<td>视频(个)</td>
        				<td>天赚(元)</td>
        				<td>月赚(元)</td>
        			</tr>
        		</thead>
        		<tbody>
        			<tr>
        				<td>1级</td>
        				<td>1个骨贝</td>
        				<td>9+6+3</td>
        				<td>6</td>
						<td>1.08</td>
						<td>32.4</td>
        			</tr>
        			<tr>
        				<td>4级</td>
        				<td>1个铜贝</td>
        				<td>10+7+4</td>
        				<td>7</td>
						<td>1.47</td>
						<td>44.1</td>
        			</tr>
        			<tr>
        				<td>8级</td>
        				<td>2个铜贝</td>
        				<td>11+8+5</td>
        				<td>8</td>
						<td>1.92</td>
						<td>57.6</td>
        			</tr>
        			<tr>
        				<td>12级</td>
        				<td>3个铜贝</td>
        				<td>12+9+6</td>
        				<td>9</td>
						<td>2.43</td>
						<td>72.9</td>
        			</tr>
        			<tr>
        				<td>16级</td>
        				<td>1个银贝</td>
        				<td>13+10+7</td>
        				<td>10</td>
						<td>3</td>
						<td>90</td>
        			</tr>
        			<tr>
        				<td>32级</td>
        				<td>2个银贝</td>
        				<td>14+11+8</td>
        				<td>11</td>
						<td>3.63</td>
						<td>108.9</td>
        			</tr>
        			<tr>
        				<td>48级</td>
        				<td>3个银贝</td>
        				<td>15+12+9</td>
        				<td>12</td>
						<td>4.32</td>
						<td>129.6</td>
        			</tr>
        			<tr>
        				<td>64级</td>
        				<td>1个金贝</td>
        				<td>16+13+10</td>
        				<td>13</td>
						<td>5.07</td>
						<td>152.1</td>
        			</tr>
        			<tr>
        				<td>128级</td>
        				<td>2个金贝</td>
        				<td>17+14+11</td>
        				<td>14</td>
						<td>5.88</td>
						<td>176.4</td>
        			</tr>
        			<tr>
        				<td>192级</td>
        				<td>3个金贝</td>
        				<td>18+15+12</td>
        				<td>15</td>
						<td>6.75</td>
						<td>202.5</td>
        			</tr>
        		</tbody>
        	</table>
        	<br/>
        	<div>
        	<span style="color:red">模式：</span><span>9+6+3。为视频在当天第一次看可获得9分，第二次看可获得6分，第三次看可获得3分；</span>
        	<br/>
        	<span style="color:red">可看视频：</span><span>每天可看视频广告个数；</span>
        	<br/>
        	<span style="color:red">每天赚：</span><span>（第一次+第二次+第三次）*可看视频；</span>
        	<br/>
        	<span style="color:red">每月赚：</span><span>每天赚乘以30天；【以上仅统计观看<br/>视频广告，趣味锁屏、趣味活动也能获得很多奖励！】</span>
        	</div>
        	<br/>
        	<br/>
        	<span style="font-size；14px;font-weight:bold">一个海贝的计算规则：</span>
        	<div style="border:1px solid #DCDCDC">
        		<span>注册成功奖励一个海贝</span>
        		<br/>
        		<span>每连续10天签到可兑换一个海贝</span>
        		<br/>
        		<span>每30个视频可兑换一个海贝</span>
        		<br/>
        		<span>每审核通过一个活动可兑换一个海贝，推荐以及调查问卷除外</span>
        		<br/>
        		<span>每查看50次不同广告的详情（不论是锁屏左滑、视频查看详情或者是活动查看详情）可兑换一个海贝</span>
        		<br/>
        		<span>每参加意见反馈，经采纳后奖励一个海贝</span>
        	</div>
	</body>
</html>