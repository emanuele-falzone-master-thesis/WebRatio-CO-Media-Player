<!DOCTYPE html>
	<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
	<%@ taglib prefix="webratio" uri="http://www.webratio.com/2006/TagLib/JSP20" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<% response.setHeader("X-UA-Compatible", "IE=edge"); %>
<webratio:Page page="page2"/>
<html lang="${LanguageISOCtxParam}">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
	    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
		<title>Application</title>
		<c:set var="bootstrap-theme" value="default"/>
		<c:set var="wrAjaxDebugLevel" value="minimal"/>
			<c:if test="${(wrBoxed or wrAjaxCalling)}">
	<link href="<webratio:Resource path="WRResources/ajax/jquery-ui/themes/smoothness/jquery-ui.min.css"/>" type="text/css" rel="stylesheet" data-wr-resname="jquery-ui-style" data-wr-resver="1.9.2">
			</c:if>
			<c:if test="${(wrBoxed or wrAjaxCalling)}">
	<link href="<webratio:Resource path="WRResources/ajax/jquery-ui/themes/webratio/style.css"/>" type="text/css" rel="stylesheet" data-wr-resname="wr-ui-style" data-wr-resver="7.2.16">
			</c:if>
	<link href="<webratio:Resource path="builtin/960_Fluid_Nestable_12.css"/>" type="text/css" rel="stylesheet" data-wr-resname="wr-960gs-12">
	<link href="<webratio:Resource path="wrdefault/css/default.css"/>" type="text/css" rel="stylesheet" data-wr-resname="wrdefault-style">
			<c:if test="${not(empty webratio:expandLayoutResourceContent('BootstrapStyle/bootstrap-css', 'BootstrapStyle/dist/css/', pageContext))}">
	<link href="<webratio:Resource path="${webratio:expandLayoutResourceContent('BootstrapStyle/bootstrap-css', 'BootstrapStyle/dist/css/', pageContext)}"/>" type="text/css" rel="stylesheet" data-wr-resname="bootstrap-css">
			</c:if>
	<link href="<webratio:Resource path="builtin/grid_elements.css"/>" type="text/css" rel="stylesheet" data-wr-resname="wr-ui-gridsystem">
	<link href="<webratio:Resource path="BootstrapStyle/css/app.css"/>" type="text/css" rel="stylesheet" data-wr-resname="app-css">
<script>if (typeof wr !== "undefined") { wr.ui.html.resx.refreshLoaded(); }</script>
		<c:set var="wrAjaxDebugLevel" value="minimal"/>
	<script src="<webratio:Resource path="WRResources/ajax/jquery/jquery.min.js"/>" data-wr-resname="jquery" data-wr-resver="1.7.2"></script>
	<script src="<webratio:Resource path="WRResources/script.js"/>" data-wr-resname="wr-utils-supportscripts" data-wr-resver="7.2.16"></script>
			<c:if test="${(wrBoxed or wrAjaxCalling)}">
	<script src="<webratio:Resource path="WRResources/ajax/jquery-ui/jquery-ui.min.js"/>" data-wr-resname="jquery-ui" data-wr-resver="1.9.2"></script>
			</c:if>
			<c:if test="${(wrBoxed or wrAjaxCalling) and not(empty webratio:expandLayoutResourceContent('BUILTIN/wr-runtime', 'WRResources/ajax/webratio/', pageContext))}">
	<script src="<webratio:Resource path="${webratio:expandLayoutResourceContent('BUILTIN/wr-runtime', 'WRResources/ajax/webratio/', pageContext)}"/>" data-wr-resname="wr-runtime" data-wr-resver="7.2.16"></script>
<c:if test="${not wrAjax and not webratio:isWindow(pageContext)}">
	<script type="text/javascript">
		<c:choose>
			<c:when test="${wrBoxed}">
				(wr._configs = (wr._configs || {}))["${wrClientAppName}"] = (function() {
					var app = new wr.app.App("${wrClientAppName}");
					app.configure({
			</c:when>
			<c:otherwise>
				(function() { 
					wr.getApp().mergeConfig({
			</c:otherwise>
		</c:choose>
			log: {
				implementation: "wr.log.LogPlugin",
				appenders: [
					"wr.log.HtmlAppender"
				],
				categories: {
					<c:choose>
						<c:when test="${wrAjaxDebugLevel eq 'full'}">
							"": wr.log.Level.DEBUG
						</c:when>
						<c:otherwise>
							"": wr.log.Level.WARN,
							"wr.logic.AjaxRequestActor._response": wr.log.Level.DEBUG,
							"wr.ui.html.ElementViewer._code": wr.log.Level.DEBUG,
							"wr.widgets": wr.log.Level.DEBUG
						</c:otherwise>
					</c:choose>
				}
			},
		ui: {
			implementation: "wr.ui.UIPlugin",
			factories: {
				"display": "wr.ui.DisplayControlFactory",
				"window": "wr.ui.WindowControlFactory",
				"default": "wr.ui.ViewerBasedControlFactory"
			},
			display: { 
				factory: "display", 
				viewer: "wr.ui.web.BrowserViewer",
				views: {
					"${wrCurrentWindowName}": {
						factory: "window",
						viewer: "${wrBoxed ? 'wr.ui.web.BoxViewer' : 'wr.ui.web.WindowViewer'}",
						viewerConfig: { <c:if test="${wrBoxed}">boxSelector: "#wr-${wrClientAppName}"</c:if> },
						views: {
							"${wrCurrentWindowName}_page": {
								viewer: "wr.ui.html.ContainerElementViewer",
								viewerConfig: { containersFilter: ".wr-ajaxDiv" }
							}
						}
					}
				}
			}
		},
		nav: {
			implementation: "wr.nav.NavPlugin",
			routers: [ {
				name: "wr.nav.PropagationRouter",
				priority: -50
			}, {
				name: "wr.nav.HttpWebRouter",
				priority: -100
			} ]
		},
		logic: {
			implementation: "wr.logic.LogicPlugin"
		},
		oldajax: {
			implementation: "wr.LegacyAjaxPlugin",
				containersFilter: ".wr-ajaxDiv"
			}
		<c:choose>
			<c:when test="${wrBoxed}">
					}).chain(function() {
						app.init();
					}).chain(function() {
						app.start();
					});
				});
			</c:when>
			<c:otherwise>
					});
				})();
			</c:otherwise>
		</c:choose>
	</script>
</c:if>
			</c:if>
			<!--[if lt IE 9]>
	<script src="<webratio:Resource path="BootstrapStyle/js/html5shiv.min.js"/>" data-wr-resname="html5shiv"></script>
			<![endif]-->
			<!--[if lt IE 9]>
	<script src="<webratio:Resource path="BootstrapStyle/js/respond.min.js"/>" data-wr-resname="respond"></script>
			<![endif]-->
	<script src="<webratio:Resource path="BootstrapStyle/dist/js/bootstrap.min.js"/>" data-wr-resname="bootstrap-js"></script>
	<script src="<webratio:Resource path="BootstrapStyle/js/app.min.js"/>" data-wr-resname="app-js"></script>
<script>if (typeof wr !== "undefined") { wr.ui.html.resx.refreshLoaded(); }</script>
	<script src="BootstrapStyle/js/howler.min.js"></script>
	<script>
		var sound = '${sound}';
		var playing = ${playing};
		var h;
		$(document).ready(function() {
			if (playing == true) {
				h = new Howl({
					src: [
							"http://emanuele.falzone.gitlab.io/almostjs-demo-game-data/sounds/" + sound
					],
					html5: true
				});
				h.play();
				h.on('end', function() {
					$('#ln7')[0].click();
				});
			}
		});
	</script>
	</head>
<body class="bootstrap-default">
<a href="#main-content" class="sr-only">Skip to main content</a>
	<c:if test="${wrBoxed}">
		<div <c:if test="${not wrAjax}">id="wr-${wrClientAppName}" data-wr-appid="${wrClientAppName}"</c:if> class="wr-appui wr-appui-${wrClientAppName}">
	</c:if>
	<webratio:CollectScripts var="inlineScripts" enabled="${wrBoxed}" eventHandlerWrapper="wr.keepScoped">
<div class="container container-fixed-top-padding">
	<div class="row">
		<div class="col-md-12">
			<div id="main-content" role="main">
<div class="container_12">
				<div class="grid_8 alpha agrd_16">
<c:if test="${not(empty inu3) and (inu3.dataSize gt 0)}">
<div>
	<h3>Authors</h3>
	<hr/>
		<div class="plain ">
			<div class="plain IndexUnit">
				<div class="table-responsive">
				<table class="table table-bordered table-hover" id="inu3_0_sortable">
					<thead>
						<tr>
							<th scope="col" class="">Name</th>
						</tr>
					</thead>
				<tbody>
				<c:forEach var="current" varStatus="status" items="${inu3.data}">
					<c:set var="index" value="${status.index}"/>	
						<tr<c:if test="${inu3.currentIndex eq index}"> class="info"</c:if>>	
								<td class=" string">
											<a href="<webratio:Link escapeXml="true" link="ln2" position="index"/>" class="" onclick="">
										<c:out value="${current.name}"/>
											</a>
								</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				</div>
			</div>
		</div>
</div>
</c:if>
				</div>
				<div class="grid_4 omega container_4 agrd_8">
				<div class="grid_4 alpha omega agrd_8">
<c:if test="${not(empty dau1) and (dau1.dataSize gt 0)}">
<div>
	<h3>Now Playing</h3>
	<hr/>
		<div class="">
			<div class="row">
				<label class="header col-md-2">Title</label>
				<div class="value col-md-10"><c:out value="${dau1.data.title}"/></div>
			</div>
		</div>
</div>     
</c:if>
				</div>
					<div class="clear"></div>
				<div class="grid_4 alpha omega agrd_8">
	<c:if test="${webratio:evaluateCondition('cexpr_var3', null, pageContext)}">
  <div class="plain ">
    <div class="plain NoOpContentUnit">
      <table align="left">
        <tr>
           <td>
             <table>
                 <tr>
<c:if test="${webratio:evaluateCondition('cexpr1', null, pageContext)}">
                 <td nowrap="nowrap">
                    <c:if test="${webratio:evaluateCondition('cexpr1', 'index', pageContext)}"><a title="Play" id="ln6" class="btn  btn-success  link" href="<webratio:Link link="ln6" position="index"/>" >
			Play</a></c:if>
                 </td>
</c:if>
<c:if test="${webratio:evaluateCondition('cexpr2', null, pageContext)}">
                 <td nowrap="nowrap">
                    <c:if test="${webratio:evaluateCondition('cexpr2', 'index', pageContext)}"><a title="Stop" id="ln7" class="btn  btn-success  link" href="<webratio:Link link="ln7" position="index"/>" >
			Stop</a></c:if>
                 </td>
</c:if>
                 </tr>
             </table>
           </td>
        </tr>  
      </table> 
    </div>
  </div>
</c:if>
				</div>
					<div class="clear"></div>
				</div>
					<div class="clear"></div>
				<div class="grid_8 suffix_4 alpha omega agrd_16">
<c:if test="${not(empty inu1) and (inu1.dataSize gt 0)}">
<div>
	<h3>Songs</h3>
	<hr/>
		<div class="plain ">
			<div class="plain IndexUnit">
				<div class="table-responsive">
				<table class="table table-hover" id="inu1_0_sortable">
					<thead>
						<tr>
							<th scope="col" class="">Author</th>
							<th scope="col" class="">Title</th>
						</tr>
					</thead>
				<tbody>
				<c:forEach var="current" varStatus="status" items="${inu1.data}">
					<c:set var="index" value="${status.index}"/>	
						<tr<c:if test="${inu1.currentIndex eq index}"> class="info"</c:if> onclick="window.location='<webratio:Link escapeXml="true" link="ln5" position="index"/>'"> 	
								<td class=" string">
										<c:out value="${current.author}"/>
								</td>
								<td class=" string">
										<c:out value="${current.title}"/>
								</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				</div>
			</div>
		</div>
</div>
</c:if>
				</div>
					<div class="clear"></div>
</div>
			</div>
		</div>
	</div>
</div>
</webratio:CollectScripts>
<c:if test="${wrBoxed}">
		</div>
		<c:if test="${not wrAjax}">
			<script type="text/javascript">
				jQuery(function($) {
					wr.ui.html.addRemoveListener($("#wr-${wrClientAppName}")[0], $.proxy(wr.runScoped, this, "${wrClientAppName}", wr.LegacyAjaxPlugin.exit));
				});
				wr._configs["${wrClientAppName}"]();
			</script>
		</c:if>
		<c:if test="${not(empty inlineScripts)}">
			<script type="text/javascript">
				wr.runScoped("${wrClientAppName}", function(ajaxRequest, WRAjaxRequest, $H, WRAjax, WRAjaxRequestUtils, WRAjaxRequestQueue, WREvent, WREventUtils, Form) {
					${inlineScripts}
				});
			</script>
		</c:if>
</c:if>
</body>
</html>