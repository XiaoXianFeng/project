<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${empty param.view}">
<script>
	$.fn.editable.defaults.mode = 'popup';

	$(document).ready(function() {
		$('.editable').editable();
	});
</script>
<style>
			th {
			font-weight:normal;}
		</style>
</c:if>
<h3 align="center">杭州涂鸦信息技术有限公司<br>生产工单</h3>
<table class="oms_table" style="margin-left: auto; margin-right: auto; border: 0px">
	<tr>
		<td>订单编号:</td>
		<td>
			<a href="#" class="editable" id="orderNo" data-type="text" data-pk="orderNo" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入订单编号">
				<c:out value="${plan.planItems['orderNo'].itemValue}"/>
			</a>
		</td>
		<td>工    厂：</td>
		<td>
			<a href="#" class="editable" id="factory" data-type="text" data-pk="factory" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入工厂">
				<c:out value="${plan.planItems['factory'].itemValue}"/>
			</a>
		</td>
	</tr>
	<tr>
		<td>工单编号:</td>
		<td>
			<a href="#" class="editable" id="gongdanNo" data-type="text" data-pk="gongdanNo" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入工单编号">
				<c:out value="${plan.planItems['gongdanNo'].itemValue}"/>
			</a>
		</td>
		<td>日    期：</td>
		<td>
			<a href="#" id="orderDate" data-type="date" data-pk="orderDate" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入日期">
				<c:out value="${plan.planItems['orderDate'].itemValue}"/>
			</a>
			<c:if test="${empty param.view}">
			<script>
			$('#orderDate').editable({
				placement: 'bottom'
			});
			</script>
			</c:if>
		</td>
	</tr>
	<tr>
		<td>SO:</td>
		<td>
			<a href="#" class="editable" id="so_No" data-type="text" data-pk="so_No" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入SO">
				<c:out value="${plan.planItems['so_No'].itemValue}"/>
			</a>
		</td>
	</tr>
</table>
<table class="oms_table" border="1" style="margin-left: auto;margin-right: auto; width:80%">
    <tbody>
		<tr>
				<th rowspan = "10" style=text-align:left width=9%px>生产资料</th>
				<th style=text-align:left width=9%px>产品名称</th>
				<th style=text-align:left width=20%px>物料编码</th>
				<th style=text-align:left width=21%px>客户模组编码</th>
				<th style=text-align:left width=10%px>产品型号</th>
				<th style=text-align:left width=10%px>信息描述</th>
				<th style=text-align:left width=21%px>订单批量(pcs)</th>
			</tr>
			<tr>
				<td>
					<a href="#" class="editable" id="productName" data-type="text" data-pk="productName" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品名称">
						<c:out value="${plan.planItems['productName'].itemValue}"/>
					</a>
				</td>
				<td>
					<a href="#" class="editable" id="materialNo" data-type="text" data-pk="materialNo" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入物料编码">
						<c:out value="${plan.planItems['materialNo'].itemValue}"/>
					</a>
				</td>
				<td>
					<a href="#" class="editable" id="custModelNo" data-type="text" data-pk="custModelNo" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入客户模组编码">
						<c:out value="${plan.planItems['custModelNo'].itemValue}"/>
					</a>
				</td>
				<td>
					<a href="#" class="editable" id="model" data-type="text" data-pk="model" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品型号">
						<c:out value="${plan.planItems['model'].itemValue}"/>
					</a>
				</td>
				<td>
					<a href="#" class="editable" id="desc" data-type="text" data-pk="desc" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入信息描述">
						<c:out value="${plan.planItems['desc'].itemValue}"/>
					</a>
				</td>
				<td>
					<a href="#" class="editable" id="orderQuantity" data-type="text" data-pk="orderQuantity" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入订单批量(pcs)">
						<c:out value="${plan.planItems['orderQuantity'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<td>类别</td>
				<td colspan="5">
					<label><input id="cat-biaozhun" class="ajaxCheckbox-cat" type="checkbox" name="cat-biaozhun" ${plan.planItems['cat-biaozhun'].itemValue}><span> 标准模块</span></label>
					<label><input id="cat-zhuanjieban" class="ajaxCheckbox-cat" type="checkbox" name="cat-zhuanjieban" ${plan.planItems['cat-zhuanjieban'].itemValue}><span> 转接板模块</span></label>
					<c:if test="${empty param.view}">
					<script>
					$('.ajaxCheckbox-cat').change(function() {
				        $.ajax({
				        	  method: "POST",
				        	  url: "<%=request.getContextPath()%>/do/plan/save.html",
				        	  data: { name: this.name, pk: this.name, value: this.checked ? 'checked' : ''}
				        	})
				        	  .done(function( msg ) {
				        	  })
				        	  .error(function( msg ) {
				        		  alert('保存失败');
				        	  });
				    });
					</script>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>生产BOM</th>
				<td colspan = "3">
					<a href="#" class="editable" id="bom" data-type="text" data-pk="bom" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入生产BOM">
						<c:out value="${plan.planItems['bom'].itemValue}"/>
					</a>
				</td>
				<th>BOM版本</th>
				<td>
					<a href="#" class="editable" id="bomVer" data-type="text" data-pk="bomVer" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入BOM版本">
						<c:out value="${plan.planItems['bomVer'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th>固件KEY</th>
				<td colspan = "3">
					<a href="#" class="editable" id="firwareKey" data-type="text" data-pk="firwareKey" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入固件KEY">
						<c:out value="${plan.planItems['firwareKey'].itemValue}"/>
					</a>
				</td>
				<th>固件版本</th>
				<td>
					<a href="#" class="editable" id="firwareVer" data-type="text" data-pk="firwareVer" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入固件版本">
						<c:out value="${plan.planItems['firwareVer'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th>固件名称</th>
				<td colspan = "3">
					<a href="#" class="editable" id="firwareName" data-type="text" data-pk="firwareName" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入固件名称">
						<c:out value="${plan.planItems['firwareName'].itemValue}"/>
					</a>
				</td>
				<th>热点名称</th>
				<td >
					<a href="#" class="editable" id="hotspotName" data-type="text" data-pk="hotspotName" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入热点名称">
						<c:out value="${plan.planItems['hotspotName'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th>STM资料包</th>
				<td colspan = "3">
					<a href="#" class="editable" id="stmPackage" data-type="text" data-pk="stmPackage" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入STM资料包">
						<c:out value="${plan.planItems['stmPackage'].itemValue}"/>
					</a>
				</td>
				<th>FLASH烧录软件</th>
				<td >
					<a href="#" class="editable" id="flashSoft" data-type="text" data-pk="flashSoft" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入FLASH烧录软件">
						<c:out value="${plan.planItems['flashSoft'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th>硬件测试工具</th>
				<td colspan = "3">
					<a href="#" class="editable" id="hardwareTestTool" data-type="text" data-pk="hardwareTestTool" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入硬件测试工具">
						<c:out value="${plan.planItems['hardwareTestTool'].itemValue}"/>
					</a>
				</td>
				<th>check软件名称</th>
				<td >
					<a href="#" class="editable" id="checkSoftName" data-type="text" data-pk="checkSoftName" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入check软件名称">
						<c:out value="${plan.planItems['checkSoftName'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th>授权激活码</th>
				<td colspan = "4">
					<a href="#" class="editable" id="authKey" data-type="text" data-pk="authKey" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入授权激活码">
						<c:out value="${plan.planItems['authKey'].itemValue}"/>
					</a>
				</td>
				<td></td>
			</tr
			><tr>
				<th>激活测试软件名称</th>
				<td colspan = "5">
					<a href="#" class="editable" id="authSoftName" data-type="text" data-pk="authSoftName" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入激活测试软件名称">
						<c:out value="${plan.planItems['authSoftName'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<td style="width:140px; word-break:break-all;" rowspan = "2" colspan="2">绿色产品<br/>生产要求(必选)</td>
				<td colspan = "5">工艺要求：
					<label><input id="fabrication-wuqian" class="ajaxCheckbox-fabrication" type="checkbox"  ${plan.planItems['fabrication-wuqian'].itemValue}><span> 无铅工艺</span></label>
					<label><input id="fabrication-youqian" class="ajaxCheckbox-fabrication" type="checkbox" ${plan.planItems['fabrication-youqian'].itemValue}><span> 有铅工艺</span></label>
					<c:if test="${empty param.view}">
					<script>
					$('.ajaxCheckbox-fabrication').change(function() {
				        $.ajax({
				        	  method: "POST",
				        	  url: "<%=request.getContextPath()%>/do/plan/save.html",
				        	  data: { name: this.id, pk: this.id, value: this.checked ? 'checked' : ''}
				        	})
				        	  .done(function( msg ) {
				        	  })
				        	  .error(function( msg ) {
				        		  alert('保存失败');
				        	  });
				    });
					</script>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan = "5">有害物质标准要求:
					<label><input id="youhaiwuzhi-rohs" class="ajaxCheckbox-youhaiwuzhi" type="checkbox"  ${plan.planItems['youhaiwuzhi-rohs'].itemValue}><span> 要求符合《有害物质限用管理标准》; (若为ROHS工艺请选项)</span></label>
					<label><input id="youhaiwuzhi-qita" class="ajaxCheckbox-youhaiwuzhi" type="checkbox" ${plan.planItems['youhaiwuzhi-qita'].itemValue}><span> 其他要求</span></label>
					<c:if test="${empty param.view}">
					<script>
					$('.ajaxCheckbox-youhaiwuzhi').change(function() {
				        $.ajax({
				        	  method: "POST",
				        	  url: "<%=request.getContextPath()%>/do/plan/save.html",
				        	  data: { name: this.id, pk: this.id, value: this.checked ? 'checked' : ''}
				        	})
				        	  .done(function( msg ) {
				        	  })
				        	  .error(function( msg ) {
				        		  alert('保存失败');
				        	  });
				    });
					</script>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2">生产性质（必选）</td>
				<td colspan = "5">
					<label><input id="manufacture-lianchan" class="ajaxCheckbox-manufacture" type="checkbox"  ${plan.planItems['manufacture-lianchan'].itemValue}><span> 量产</span></label>
					<label><input id="manufacture-shichan" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-shichan'].itemValue}><span> 试产（小批量设计验证）</span></label>
					<label><input id="manufacture-softupdate" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-softupdate'].itemValue}><span> 软件升级</span></label>
					<c:if test="${empty param.view}">
					<script>
					$('.ajaxCheckbox-manufacture').change(function() {
				        $.ajax({
				        	  method: "POST",
				        	  url: "<%=request.getContextPath()%>/do/plan/save.html",
				        	  data: { name: this.id, pk: this.id, value: this.checked ? 'checked' : ''}
				        	})
				        	  .done(function( msg ) {
				        	  })
				        	  .error(function( msg ) {
				        		  alert('保存失败');
				        	  });
				    });
					</script>
					</c:if>
				</td>
			</tr>
			<tr>
				<th height=10%>预计生产日期</th>
				<td colspan = "3">
					<a href="#" class="editable" id="manufactureDate" data-type="date" data-pk="manufactureDate" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入预计生产日期">
						<c:out value="${plan.planItems['manufactureDate'].itemValue}"/>
					</a>
				</td>
				<th>预计交货日期</th>
				<td colspan = "2">
					<a href="#" class="editable" id="completeDate" data-type="date" data-pk="completeDate" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入预计交货日期">
						<c:out value="${plan.planItems['completeDate'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th rowspan = "2" height=10%>客户要求</th>
				<th>客户订单号</th>
				<th>物料编码</th>
				<th>物料型号</th>
				<th>model号</th>
				<th colspan = "2">批次号</th>
			</tr>
			<tr>
				<td>
					<a href="#" class="editable" id="custOrderNo" data-type="text" data-pk="custOrderNo" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入客户订单号">
						<c:out value="${plan.planItems['custOrderNo'].itemValue}"/>
					</a>
				</td>
				<td>
					<a href="#" class="editable" id="custMaterialNo" data-type="text" data-pk="custMaterialNo" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入物料编码">
						<c:out value="${plan.planItems['custMaterialNo'].itemValue}"/>
					</a>
				</td>
				<td>
					<a href="#" class="editable" id="materialModel" data-type="text" data-pk="materialModel" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入物料型号">
						<c:out value="${plan.planItems['materialModel'].itemValue}"/>
					</a>
				</td>
				<td>
					<a href="#" class="editable" id="modelNo" data-type="text" data-pk="modelNo" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入model号">
						<c:out value="${plan.planItems['modelNo'].itemValue}"/>
					</a>
				</td>
				<td colspan = "2">
					<a href="#" class="editable" id="sequenceNo" data-type="text" data-pk="sequenceNo" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入批次号">
						<c:out value="${plan.planItems['sequenceNo'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th height=5%>标签</th>
				<td colspan = "6"></td>
			</tr>
			<tr>
				<th height=10%>其他备注</th>
				<td colspan = "6" >
					<div id="comments" data-type="wysihtml5" data-pk="comments">
						<c:out value="${plan.planItems['comments'].itemValue}" escapeXml="false"/>
					</div>
					<script>
					$('#comments').editable({
				        url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '其他备注',
				        wysihtml5:{
				        	"font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
				        	"emphasis": true, //Italics, bold, etc. Default true
				        	"lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
				        	"html": false, //Button which allows you to edit the generated HTML. Default false
				        	"link": false, //Button to insert a link. Default true
				        	"image": false, //Button to insert an image. Default true,
				        	"color": true //Button to change color of font 
				        }
				    });
					</script>
				</td>
			</tr>
	</tbody>
</table>

<center>
	<table style="border:0;">
		<tr>
			<th style="width:80px">制表</th>
			<td style="width:160px">${plan.creator.userDispName}</td>
			<th style="width:80px">审核</th>
			<td style="width:160px">
				<c:if test="${plan.reviewStatus == 'REJECTED'  or plan.reviewStatus == 'APPROVED'}">
				<div class="stamp stamp-${plan.reviewStatus}">
					<span><fmt:formatDate value="${plan.reviewDate}" pattern="yyyy-MM-dd" /></span>
					<span><c:out value="${plan.reviewer.userDispName}"></c:out></span>
				</div>
				</c:if>
			</td>
			<th style="width:80px">承认</th>
			<td style="width:160px">
				<c:if test="${plan.approveStatus == 'REJECTED'  or plan.approveStatus == 'APPROVED'}">
				<div class="stamp stamp-${plan.approveStatus}">
					<span><fmt:formatDate value="${plan.reviewDate}" pattern="yyyy-MM-dd" /></span>
					<span><c:out value="${plan.approver.userDispName}"></c:out></span>
				</div>
				</c:if>
			</td>
			<td></td>
		</tr>
	</table>
</center>
