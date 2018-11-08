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
</c:if>
<h4 align="center">杭州中科微电子有限公司<br>生产计划通知书</h4>
<table class="oms_table" style="margin-left: auto; margin-right: auto; border: 0px">
	<tr>
		<td>文件编号:</td>
		<td>
			<a href="#" class="editable" id="file_No" data-type="text" data-pk="file_No" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入文件编号">
				<c:out value="${plan.planItems['file_No'].itemValue}"/>
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
		<td style="width:100px">收件部门:</td>
		<td>
			<a href="#" class="editable" id="shoujian_part" data-type="text" data-pk="shoujian_part" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入收件部门">
				<c:out value="${plan.planItems['shoujian_part'].itemValue}"/>
			</a>
		</td>
	</tr>
</table>
<table class="oms_table" border="1" style="margin-left: auto;margin-right: auto; width:80%">
    <tbody>
		<tr>
			<td rowspan = "8" width=10%px>生产资料</td>
			<td width=15%px>产品名称 </td>
			<td width=25%px>产品型号 </td>
			<td width=25%px>PCB 版本号 </td>
			<td colspan="2" width=25%px>客户</td>
		</tr>
		<tr>
			<td><a href="#" class="editable" id="productName" data-type="text" data-pk="productName" 
				data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品名称">
				<c:out value="${plan.planItems['productName'].itemValue}"/>
			</a></td>
			<td>
				<a href="#" class="editable" id="productModel" data-type="text" data-pk="productModel" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品型号">
					<c:out value="${plan.planItems['productModel'].itemValue}"/>
				</a>
			</td>
			<td>
				<a href="#" class="editable" id="pcbVer" data-type="text" data-pk="pcbVer" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入PCB版本号 ">
					<c:out value="${plan.planItems['pcbVer'].itemValue}"/>
				</a>
			</td>
			<td colspan="2">
				<a href="#" class="editable" id="client" data-type="text" data-pk="client" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入客户">
					<c:out value="${plan.planItems['client'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td>BOM编号</td>
			<td colspan="2">
				<a href="#" id="bom" data-type="textarea" data-pk="bom" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入BOM编号"><c:out value="${plan.planItems['bom'].itemValue}"/></a>
			<script>
				$(function(){
				    $('#bom').editable({
				        url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: 'BOM编号',
				        rows: 2
				    });
				});
				</script>
			</td>
			<td rowspan ="3" width=10%px>项目经理</td>
			<td rowspan ="3" width=15%px>
				<a href="#" id="custel" data-type="textarea" data-pk="custel" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入信息"><c:out value="${plan.planItems['custel'].itemValue}"/></a>
			<script>
				$(function(){
				    $('#custel').editable({
				        url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '信息',
				        rows: 2
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>SMT资料包</td>
			<td colspan="2"><a href="#" id="smtDocPackage" data-type="textarea" data-pk="smtDocPackage" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品P/N"><c:out value="${plan.planItems['smtDocPackage'].itemValue}"/></a>
			<script>
				$(function(){
				    $('#smtDocPackage').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: 'SMT资料包',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>生产软件</td>
			<td colspan="2"><a href="#" id="softwareVer" data-type="textarea" data-pk="softwareVer" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入生产软件"><c:out value="${plan.planItems['softwareVer'].itemValue}"/></a>
			<script>
				$(function(){
				    $('#softwareVer').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '生产软件',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>测试要求</td>
			<td colspan="2"><a href="#" id="test_request" data-type="textarea" data-pk="test_request" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入测试要求"><c:out value="${plan.planItems['test_request'].itemValue }"/></a>
			<script>
				$(function(){
				    $('#test_request').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '测试要求',
				        rows: 5
				    });
				});
				</script>
			</td>
			<td>测试比率烧录要求</td>
			<td><a href="#" id="testrate_request" data-type="textarea" data-pk="testrate_request" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入测试比率烧录要求"><c:out value="${plan.planItems['testrate_request'].itemValue }"/></a>
			<script>
				$(function(){
				    $('#testrate_request').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '测试比率烧录要求',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>插件要求</td>
			<td colspan="2"><a href="#" id="chajian_request" data-type="textarea" data-pk="chajian_request" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入插件要求"><c:out value="${plan.planItems['chajian_request'].itemValue }"/></a>
			<script>
				$(function(){
				    $('#chajian_request').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '插件要求',
				        rows: 5
				    });
				});
				</script>
			</td>
			<td>波峰焊夹具到位时间</td>
			<td>
				<a href="#" class="editable" id="bofeng_time" data-type="date" data-pk="bofeng_time" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入波峰焊夹具到位时间">
					<c:out value="${plan.planItems['bofeng_time'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td>焊接要求</td>
			<td colspan="2"><a href="#" id="hanjie_request" data-type="textarea" data-pk="hanjie_request" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入焊接要求"><c:out value="${plan.planItems['hanjie_request'].itemValue }"/></a>
			<script>
				$(function(){
				    $('#hanjie_request').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '焊接要求',
				        rows: 5
				    });
				});
				</script>
			</td>
			<td>托盘夹具到位时间</td>
			<td>
				<a href="#" class="editable" id="jiaju_time" data-type="date" data-pk="jiaju_time" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入托盘夹具到位时间">
					<c:out value="${plan.planItems['jiaju_time'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td>生产性质（必选）</td>
			<td colspan = "5">
				<label><input id="manufacture-shichan" class="ajaxCheckbox-manufacture" type="checkbox"  ${plan.planItems['manufacture-shichan'].itemValue}><span> 试产</span></label>
				<label><input id="manufacture-lianchan" class="ajaxCheckbox-manufacture" type="checkbox"  ${plan.planItems['manufacture-lianchan'].itemValue}><span> 量产</span></label>
				<label><input id="manufacture-updata" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-updata'].itemValue}><span> 软件升级</span></label>
				<label><input id="manufacture-fangong" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-fangong'].itemValue}><span> 返工</span></label>
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
				<th rowspan = "2">
					<label><input id="manufacture1-change" class="ajaxCheckbox-manufacture1" type="checkbox"  ${plan.planItems['manufacture1-change'].itemValue}><span> 变更</span></label>
					<c:if test="${empty param.view}">
					<script>
					$('.ajaxCheckbox-manufacture1').change(function() {
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
				</th>
				<th>原计划编号</th>
				<td>
					<a href="#" class="editable" id="plan_code" data-type="text" data-pk="plan_code" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入原计划编号">
						<c:out value="${plan.planItems['plan_code'].itemValue}"/>
					</a>
				</td>
				<th rowspan = "2">销售</th>
				<td colspan= "2" rowspan = "2" style="width:200px" align="left">
					<label><input ${param.view} id="sale-domestic" class="ajaxCheckbox" type="checkbox" name="sale-domestic" ${plan.planItems['sale-domestic'].itemValue}><span> 内销</span></label>
					<label><input ${param.view} id="sale-export" class="ajaxCheckbox" type="checkbox" name="sale-export" ${plan.planItems['sale-export'].itemValue}><span> 外销</span></label>
					<c:if test="${empty param.view}">
					<script>
					$('.ajaxCheckbox').change(function() {
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
				<th>变更内容</th>
				<td>
					<a href="#" class="editable" id="change_message" data-type="text" data-pk="change_message" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入变更内容">
						<c:out value="${plan.planItems['change_message'].itemValue}"/>
					</a>
				</td>
			</tr>
		<tr>
			<td>委托加工方</td>
			<td>订单批量</td>
			<td>分批投产数量</td>
			<td>预计生产日期</td>
			<td colspan = "2">预计交货日期</td>
		</tr>
		<tr>
			<td>
				<a href="#" class="editable" id="producer" data-type="text" data-pk="producter" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入委托加工方">
					<c:out value="${plan.planItems['producer'].itemValue}"/>
				</a>
			</td>
			<td>
				<a href="#" class="editable" id="dingdan_total" data-type="text" data-pk="dingdan_total" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入订单批量">
					<c:out value="${plan.planItems['dingdan_total'].itemValue}"/>
				</a>
			</td>
			<td>
				<a href="#" class="editable" id="fenpi_total" data-type="text" data-pk="fenpi_total" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入分批投产数量">
					<c:out value="${plan.planItems['fenpi_total'].itemValue}"/>
				</a>
			</td>
			<td>
				<a href="#" class="editable" id="manufactureDate" data-type="date" data-pk="manufactureDate" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入预计生产日期">
					<c:out value="${plan.planItems['manufactureDate'].itemValue}"/>
				</a>
			</td>
			<td colspan = "2">
				<a href="#" class="editable" id="completeDate" data-type="date" data-pk="completeDate" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入预计交货日期">
					<c:out value="${plan.planItems['completeDate'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
				<td>出货方式（或要求）</td>
				<td colspan = "5" >
					<div id="chuhuo_request" data-type="wysihtml5" data-pk="chuhuo_request">
						<c:out value="${plan.planItems['chuhuo_request'].itemValue}" escapeXml="false"/>
					</div>
					<script>
					$('#chuhuo_request').editable({
				        url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '出货方式（或要求）',
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
		<tr>
				<td>备注</td>
				<td colspan = "5" >
					<div id="comments" data-type="wysihtml5" data-pk="comments">
						<c:out value="${plan.planItems['comments'].itemValue}" escapeXml="false"/>
					</div>
					<script>
					$('#comments').editable({
				        url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '备注',
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
		<tr>
				<th rowspan = "7">确认</th>
				<th rowspan = "2">标记</th>
				<th>S/N编码要求</th>
				<td>
					<a href="#" class="editable" id="request_sn" data-type="text" data-pk="request_sn" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入S/N编码要求">
						<c:out value="${plan.planItems['request_sn'].itemValue}"/>
					</a>
				</td>
				<th>生产部</th>
				<td>
					<a href="#" class="editable" id="product_part" data-type="text" data-pk="product_part" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入生产部信息">
						<c:out value="${plan.planItems['product_part'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th>BI标签</th>
				<td>
					<a href="#" class="editable" id="bi_sn" data-type="text" data-pk="bi_sn" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入BI标签">
						<c:out value="${plan.planItems['bi_sn'].itemValue}"/>
					</a>
				</td>
				<th>质量部</th>
				<td>
					<a href="#" class="editable" id="zhiliang_part" data-type="text" data-pk="zhiliang_part" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入质量部信息">
						<c:out value="${plan.planItems['zhiliang_part'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th colspan = "2">销售订单编号</th>
				<td>
					<a href="#" class="editable" id="sale_code" data-type="text" data-pk="sale_code" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入销售订单编号">
						<c:out value="${plan.planItems['sale_code'].itemValue}"/>
					</a>
				</td>
				<th rowspan = "2">产品经理</th>
				<td rowspan = "2">
					<a href="#" class="editable" id="manage_name" data-type="text" data-pk="manage_name" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品经理信息">
						<c:out value="${plan.planItems['manage_name'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th colspan = "2">客户名称</th>
				<td>
					<a href="#" class="editable" id="client_name" data-type="text" data-pk="client_name" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入客户名称">
						<c:out value="${plan.planItems['client_name'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th rowspan = "3">委托加工方</th>
				<th>生产日期</th>
				<td>
					<a href="#" class="editable" id="product_Date" data-type="date" data-pk="product_Date" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入生产日期">
						<c:out value="${plan.planItems['product_Date'].itemValue}"/>
					</a>
				</td>
				<th rowspan = "3">签名</th>
				<td rowspan = "3">
					<a href="#" class="editable" id="qianming" data-type="date" data-pk="qianming" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入签名">
						<c:out value="${plan.planItems['qianming'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th>交货日期</th>
				<td>
					<a href="#" class="editable" id="commit_Date" data-type="date" data-pk="commit_Date" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入交货日期">
						<c:out value="${plan.planItems['commit_Date'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th>资料签收</th>
				<td>
					<a href="#" class="editable" id="file_qianming" data-type="date" data-pk="file_qianming" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入资料签收信息">
						<c:out value="${plan.planItems['file_qianming'].itemValue}"/>
					</a>
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
