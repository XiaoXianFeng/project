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
<h3 align="center">生产任务-加工说明</h3>
<table class="oms_table" style="margin-left: auto; margin-right: auto; border: 0px">
		<tr>
			<td>(ver:
				<a href="#" class="editable" id="file_ver" data-type="text" data-pk="file_ver" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入文件版本">
					<c:out value="${plan.planItems['file_ver'].itemValue}"/>
				</a>)</td>
		</tr>
</table>
<table class="oms_table" border="1" style="margin-left: auto;margin-right: auto; width:80%">
    <tbody>
		<tr>
			<td >加工单位:</td>
			<td style="width:200px" align="left"><div style="width:200px; text-align:left;  word-break: break-all;"><a href="#" id="customer" data-type="text" data-pk="customer" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入客户名称">
				<c:out value="${plan.customer}"/>
				</a>
				</div>
				<script>
				$('#customer').editable({
						placement: 'bottom'
				});
				</script>
			</td>
			<td>文件编号:</td>
			<td colspan = "2">
				<a href="#" class="editable" id="file_No" data-type="text" data-pk="file_No" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入文件编号">
					<c:out value="${plan.planItems['file_No'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td>生产性质（必选）</td>
			<td colspan = "4">
				<label><input id="manufacture-lianchan" class="ajaxCheckbox-manufacture" type="checkbox"  ${plan.planItems['manufacture-lianchan'].itemValue}><span> 量产</span></label>
				<label><input id="manufacture-shichan" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-shichan'].itemValue}><span> 试产（小批量设计验证）</span></label>
				<label><input id="manufacture-updata" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-updata'].itemValue}><span> 软件升级</span></label>
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
			<td rowspan = "13" width=10%px>生产资料</td>
			<td width=15%px>工单号</td>
			<td width=25%px>产品型号 </td>
			<td width=25%px>PCB 版本号 </td>
			<td width=25%px>订单数量</td>
		</tr>
		<tr>
			<td><a href="#" class="editable" id="list_number" data-type="text" data-pk="list_number" 
				data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入工单号">
				<c:out value="${plan.planItems['list_number'].itemValue}"/>
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
			<td>
				<a href="#" class="editable" id="product_num" data-type="text" data-pk="product_num" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入订单数量">
					<c:out value="${plan.planItems['product_num'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td>类别</td>
			<td colspan="3">
				<label><input id="cat-zhengji" class="ajaxCheckbox-cat" type="checkbox" name="cat-zhengji" ${plan.planItems['cat-zhengji'].itemValue}><span> 整机</span></label>
				<label><input id="cat-pcba" class="ajaxCheckbox-cat" type="checkbox" name="cat-pcba" ${plan.planItems['cat-pcba'].itemValue}><span> PCBA</span></label>
				<label><input id="cat-jitou" class="ajaxCheckbox-cat" type="checkbox" name="cat-jitou" ${plan.planItems['cat-jitou'].itemValue}><span> 机头</span></label>
				<label><input id="cat-other" class="ajaxCheckbox-cat" type="checkbox" name="cat-other" ${plan.planItems['cat-other'].itemValue}><span> 其他</span></label>
				<label><input id="cat-mokuai" class="ajaxCheckbox-cat" type="checkbox" name="cat-mokuai" ${plan.planItems['cat-mokuai'].itemValue}><span> 模块</span></label>
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
			<td>SMT资料包</td>
			<td colspan="3"><a href="#" id="smtDocPackage" data-type="textarea" data-pk="smtDocPackage" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品P/N"><c:out value="${plan.planItems['smtDocPackage'].itemValue}"/></a>
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
			<td>贴片BOM</td>
			<td colspan="3">
				<a href="#" id="bom" data-type="textarea" data-pk="bom" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品P/N"><c:out value="${plan.planItems['bom'].itemValue}"/></a>
			<script>
				$(function(){
				    $('#bom').editable({
				        url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '贴片BOM',
				        rows: 2
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>组装包装BOM</td>
			<td colspan="3">
				<a href="#" id="zuzbaoz_bom" data-type="textarea" data-pk="zuzbaoz_bom" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入组装包装BOM"><c:out value="${plan.planItems['zuzbaoz_bom'].itemValue}"/></a>
			<script>
				$(function(){
				    $('#zuzbaoz_bom').editable({
				        url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '组装包装BOM',
				        rows: 2
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>生产程序</td>
			<td colspan="3">
				<a href="#" id="product_program" data-type="textarea" data-pk="product_program" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入生产程序"><c:out value="${plan.planItems['product_program'].itemValue}"/></a>
			<script>
				$(function(){
				    $('#product_program').editable({
				        url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '生产程序',
				        rows: 2
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>软件版本号</td>
			<td colspan="3"><a href="#" id="softwareVer" data-type="textarea" data-pk="softwareVer" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入软件版本号"><c:out value="${plan.planItems['softwareVer'].itemValue}"/></a>
			<script>
				$(function(){
				    $('#softwareVer').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '软件版本号',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>MAC地址范围</td>
			<td colspan="3"><a href="#" id="mac_address" data-type="textarea" data-pk="mac_address" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入MAC地址范围"><c:out value="${plan.planItems['mac_address'].itemValue }"/></a>
			<script>
				$(function(){
				    $('#mac_address').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: 'MAC地址范围',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>BOMPID烧写</td>
			<td colspan="3"><a href="#" id="bompid_debug" data-type="textarea" data-pk="bompid_debug" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入BOMPID烧写"><c:out value="${plan.planItems['bompid_debug'].itemValue }"/></a>
			<script>
				$(function(){
				    $('#bompid_debug').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: 'BOMPID烧写',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>HWID</td>
			<td colspan="3"><a href="#" id="hwid_message" data-type="textarea" data-pk="hwid_message" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入HWID"><c:out value="${plan.planItems['hwid_message'].itemValue }"/></a>
			<script>
				$(function(){
				    $('#hwid_message').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: 'HWID',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>需求工装，文件</td>
			<td colspan="3"><a href="#" id="gongzhuang_file" data-type="textarea" data-pk="gongzhuang_file" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入需求工装，文件"><c:out value="${plan.planItems['gongzhuang_file'].itemValue }"/></a>
			<script>
				$(function(){
				    $('#gongzhuang_file').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '需求工装，文件',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>需求工具</td>
			<td colspan="3"><a href="#" id="test_tool" data-type="textarea" data-pk="test_tool" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入需求工具"><c:out value="${plan.planItems['test_tool'].itemValue }"/></a>
			<script>
				$(function(){
				    $('#test_tool').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '需求工具',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td style="width:140px; word-break:break-all;" rowspan = "2">绿色产品<br/>生产要求(必选)</td>
			<td colspan = "4">工艺要求：
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
			<td colspan = "4">有害物质标准要求:
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
				<td>特殊加工要求说明:</td>
				<td colspan = "4" >
					<div id="comments" data-type="wysihtml5" data-pk="comments">
						<c:out value="${plan.planItems['comments'].itemValue}" escapeXml="false"/>
					</div>
					<script>
					$('#comments').editable({
				        url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '特殊加工要求说明',
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