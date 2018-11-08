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
<h3 align="center">上海盛本智能科技有限公司</h3>
<br>
<table class="oms_table" border="1" style="margin-left: auto;margin-right: auto; width:80%">
    <tbody>
		<tr>
				<th colspan = "8" rowspan = "3">
					<a href="#" id="product_book" data-type="textarea" data-pk="product_book" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入通知书信息"><c:out value="${plan.planItems['product_book'].itemValue}"/></a>
					<script>
					$(function(){
					    $('#product_book').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '通知书',
					        rows: 2
					    });
					});
					</script>
				</th>
				<td colspan = "2">表单编号:
					<a href="#" id="list_number" data-type="textarea" data-pk="list_number" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入表单编号"><c:out value="${plan.planItems['list_number'].itemValue}"/></a>
					<script>
					$(function(){
					    $('#list_number').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '表单编号',
					        rows: 2
					    });
					});
					</script>
				</td>
			</tr>
			<tr>
				<td colspan = "2">版本号:
					<a href="#" class="editable" id="version_number" data-type="text" data-pk="version_number" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入版本号">
						<c:out value="${plan.planItems['version_number'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<td colspan = "2">编号:
					<a href="#" class="editable" id="edit_number" data-type="text" data-pk="edit_number" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入编号">
						<c:out value="${plan.planItems['edit_number'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th rowspan = "2" width=10%px>订单信息</th>
				<th width=10%px>客户</th>
				<td colspan = "4" width=40%px>
					<a href="#" class="editable" id="cus_name" data-type="text" data-pk="cus_name" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入客户">
						<c:out value="${plan.planItems['cus_name'].itemValue}"/>
					</a>				
				</td>
				<th width=10%px>产品型号</th>
				<td colspan = "3" width=30%px>
					<a href="#" class="editable" id="productModel" data-type="text" data-pk="productModel" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品型号">
						<c:out value="${plan.planItems['productModel'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th>生产性质</th>
				<td colspan = "4">
					<label><input id="manufacture-shichan" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-shichan'].itemValue}><span> 试产</span></label>
				<label><input id="manufacture-xiaopi" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-xiaopi'].itemValue}><span> 小批</span></label>
					<label><input id="manufacture-lianchan" class="ajaxCheckbox-manufacture" type="checkbox"  ${plan.planItems['manufacture-lianchan'].itemValue}><span> 量产</span></label>
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
				<th>订单数量</th>
				<td colspan = "3">
					<a href="#" class="editable" id="dingdan_total" data-type="text" data-pk="dingdan_total" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入订单批量">
						<c:out value="${plan.planItems['dingdan_total'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th rowspan = "3">工单信息</th>
				<th>产品信息</th>
				<th>生产单号</th>
				<td colspan = "2"><a href="#" id="product_list_number" data-type="textarea" data-pk="product_list_number" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入生产单号"><c:out value="${plan.planItems['product_list_number'].itemValue}"/></a>
					<script>
					$(function(){
					    $('#product_list_number').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '生产单号',
					        rows: 2
					    });
					});
					</script>
				</td>
				<th>成品料号</th>
				<td colspan = "2"><a href="#" id="chengpin_number" data-type="textarea" data-pk="chengpin_number" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入成品料号"><c:out value="${plan.planItems['chengpin_number'].itemValue}"/></a>
					<script>
					$(function(){
					    $('#chengpin_number').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '成品料号',
					        rows: 2
					    });
					});
					</script>
				</td>
				<th>整机颜色</th>
				<td>
					<a href="#" class="editable" id="" data-type="text" data-pk="machine_colour" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入整机颜色">
						<c:out value="${plan.planItems['machine_colour'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th>生产类别</th>
				<td colspan="8">
				<label><input id="cat-pcba" class="ajaxCheckbox-cat" type="checkbox" name="cat-pcba" ${plan.planItems['cat-pcba'].itemValue}><span> 核心板PCBA</span></label>
				<label><input id="cat-zupcba" class="ajaxCheckbox-cat" type="checkbox" name="cat-zupcba" ${plan.planItems['cat-zupcba'].itemValue}><span> 主板PCBA</span></label>
				<label><input id="cat-fu" class="ajaxCheckbox-cat" type="checkbox" name="cat-fu" ${plan.planItems['cat-fu'].itemValue}><span> 副板</span></label>
				<label><input id="cat-jitou" class="ajaxCheckbox-cat" type="checkbox" name="cat-jitou" ${plan.planItems['cat-jitou'].itemValue}><span> 机头</span></label>
				<label><input id="cat-dizuo" class="ajaxCheckbox-cat" type="checkbox" name="cat-dizuo" ${plan.planItems['cat-dizuo'].itemValue}><span> 底座</span></label>
				<label><input id="cat-baozhuang" class="ajaxCheckbox-cat" type="checkbox" name="cat-baozhuang" ${plan.planItems['cat-baozhuang'].itemValue}><span> 包装</span></label>
				<label><input id="manufacture-fangong" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-fangong'].itemValue}><span> 返工</span></label>
				<label><input id="manufacture-updata" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-updata'].itemValue}><span> 升级出货</span></label>
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
				<th>是否走系统</th>
				<td colspan="3">
				<label><input id="cat-yesA" class="ajaxCheckbox-cat" type="checkbox" name="cat-yesA" ${plan.planItems['cat-yesA'].itemValue}><span> 是</span></label>
				<label><input id="cat-noA" class="ajaxCheckbox-cat" type="checkbox" name="cat-noA" ${plan.planItems['cat-noA'].itemValue}><span> 否</span></label>
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
				<th>即时出货</th>
				<td colspan="4">
					<label><input id="cat-yes" class="ajaxCheckbox-cat" type="checkbox" name="cat-yes" ${plan.planItems['cat-yes'].itemValue}><span> 是</span></label>
					<label><input id="cat-no" class="ajaxCheckbox-cat" type="checkbox" name="cat-no" ${plan.planItems['cat-no'].itemValue}><span> 否</span></label>
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
				<th rowspan = "15">生产资料信息</th>
				<th>核心板bom</th>
				<td colspan = "8">
					<a href="#" id="hexin_bom" data-type="textarea" data-pk="hexin_bom" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入核心板bom"><c:out value="${plan.planItems['hexin_bom'].itemValue}"/></a>
				<script>
					$(function(){
					    $('#hexin_bom').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '核心板BOM',
					        rows: 2
					    });
					});
					</script>
				</td>
			</tr>
			<tr>
				<td>主板BOM</td>
				<td colspan = "8">
					<a href="#" id="zhuban_bom" data-type="textarea" data-pk="zhuban_bom" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入主板bom"><c:out value="${plan.planItems['zhuban_bom'].itemValue}"/></a>
				<script>
					$(function(){
					    $('#zhuban_bom').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '主板BOM',
					        rows: 2
					    });
					});
					</script>
				</td>
			</tr>
			<tr>
				<td>副板BOM</td>
				<td colspan = "8">
					<a href="#" id="fuban_bom" data-type="textarea" data-pk="fuban_bom" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入副板bom"><c:out value="${plan.planItems['fuban_bom'].itemValue}"/></a>
				<script>
					$(function(){
					    $('#fuban_bom').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '副板BOM',
					        rows: 2
					    });
					});
					</script>
				</td>
			</tr>
			<tr>
				<td>SMT资料包</td>
				<td colspan = "8"><a href="#" id="smtDocPackage" data-type="textarea" data-pk="smtDocPackage" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品P/N"><c:out value="${plan.planItems['smtDocPackage'].itemValue}"/></a>
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
				<td>组装BOM</td>
				<td colspan = "8">
					<a href="#" id="zuzhuang_bom" data-type="textarea" data-pk="zuzhuang_bom" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入组装bom"><c:out value="${plan.planItems['zuzhuang_bom'].itemValue}"/></a>
				<script>
					$(function(){
					    $('#zuzhuang_bom').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '组装BOM',
					        rows: 2
					    });
					});
					</script>
				</td>
			</tr>
			<tr>
				<th>配置BOM</th>
				<td colspan = "8">
					<a href="#" id="config_bom" data-type="textarea" data-pk="config_bom" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入配置bom"><c:out value="${plan.planItems['config_bom'].itemValue}"/></a>
				<script>
					$(function(){
					    $('#config_bom').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '配置BOM',
					        rows: 2
					    });
					});
					</script>
				</td>
			</tr>
			<tr>
				<td>包装BOM</td>
				<td colspan = "8">
					<a href="#" id="baozhuang_bom" data-type="textarea" data-pk="baozhuang_bom" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入包装bom"><c:out value="${plan.planItems['baozhuang_bom'].itemValue}"/></a>
				<script>
					$(function(){
					    $('#baozhuang_bom').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '包装BOM',
					        rows: 2
					    });
					});
					</script>
				</td>
			</tr>
			<tr>
				<th>工艺文件</th>
				<td colspan = "8">
					<a href="#" id="art_file" data-type="textarea" data-pk="art_file" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入工艺文件"><c:out value="${plan.planItems['art_file'].itemValue}"/></a>
				<script>
					$(function(){
					    $('#art_file').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '工艺文件',
					        rows: 2
					    });
					});
					</script>
				</td>
			</tr>
			<tr>
				<th>组包装SOP</th>
				<td colspan = "8">
					<a href="#" id="zubaozhuang_sop" data-type="textarea" data-pk="zubaozhuang_sop" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入组包装SOP"><c:out value="${plan.planItems['zubaozhuang_sop'].itemValue}"/></a>
				<script>
					$(function(){
					    $('#zubaozhuang_sop').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '组包装SOP',
					        rows: 2
					    });
					});
					</script>
				</td>
			</tr>
			<tr>
				<th>标签打印包</th>
				<td colspan = "8">
					<a href="#" id="biaoqianprts_package" data-type="textarea" data-pk="biaoqianprts_package" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入标签打印包"><c:out value="${plan.planItems['biaoqianprts_package'].itemValue}"/></a>
				<script>
					$(function(){
					    $('#biaoqianprts_package').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '标签打印包',
					        rows: 2
					    });
					});
					</script>
				</td>
			</tr>
			<tr>
				<th rowspan = "5">软件版本</th>
				<th>平台版本</th>
				<td colspan = "7">
					<a href="#" class="editable" id="pingtai_Ver" data-type="text" data-pk="pingtai_Ver" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入平台版本 ">
						<c:out value="${plan.planItems['pingtai_Ver'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th>AP版本</th>
				<td colspan = "7">
					<a href="#" class="editable" id="ap_Ver" data-type="text" data-pk="ap_Ver" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入AP版本 ">
						<c:out value="${plan.planItems['ap_Ver'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th>模块版本</th>
				<td colspan = "7">
					<a href="#" class="editable" id="module_Ver" data-type="text" data-pk="module_Ver" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入模块版本 ">
						<c:out value="${plan.planItems['module_Ver'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th>读取版本号</th>
				<td colspan = "7">
					<a href="#" class="editable" id="rw_Ver" data-type="text" data-pk="rw_Ver" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入读取版本号 ">
						<c:out value="${plan.planItems['rw_Ver'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th>QCN/PRI</th>
				<td colspan = "7">
					<a href="#" class="editable" id="qcn_pri_Ver" data-type="text" data-pk="qcn_pri_Ver" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入QCN/PRI ">
						<c:out value="${plan.planItems['qcn_pri_Ver'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th>注意事项(返工流程)</th>
				<td colspan = "9" >
					<div id="comments_2" data-type="wysihtml5" data-pk="comments_2">
						<c:out value="${plan.planItems['comments_2'].itemValue}" escapeXml="false"/>
					</div>
					<script>
					$('#comments_2').editable({
				        url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '注意事项',
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
				<th rowspan = "7">配置信息</th>
				<th rowspan = "5">频段</th>
				<td colspan="8">
					<label><input id="cat-A1" class="ajaxCheckbox-cat" type="checkbox" name="cat-A1" ${plan.planItems['cat-A1'].itemValue}><span> GSM</span></label>
					<label><input id="cat-A2" class="ajaxCheckbox-cat" type="checkbox" name="cat-A2" ${plan.planItems['cat-A2'].itemValue}><span> 850</span></label>
					<label><input id="cat-A3" class="ajaxCheckbox-cat" type="checkbox" name="cat-A3" ${plan.planItems['cat-A3'].itemValue}><span> 900</span></label>
					<label><input id="cat-A4" class="ajaxCheckbox-cat" type="checkbox" name="cat-A4" ${plan.planItems['cat-A4'].itemValue}><span> 1800</span></label>
					<label><input id="cat-A5" class="ajaxCheckbox-cat" type="checkbox" name="cat-A5" ${plan.planItems['cat-A5'].itemValue}><span> 1900</span></label>
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
				<td colspan="8">
					<label><input id="cat-B1" class="ajaxCheckbox-cat" type="checkbox" name="cat-B1" ${plan.planItems['cat-B1'].itemValue}><span> CDMA</span></label>
					<label><input id="cat-B2" class="ajaxCheckbox-cat" type="checkbox" name="cat-B2" ${plan.planItems['cat-B2'].itemValue}><span> 800</span></label>
					<label><input id="cat-B3" class="ajaxCheckbox-cat" type="checkbox" name="cat-B3" ${plan.planItems['cat-B3'].itemValue}><span> 1900</span></label>
					<label><input id="cat-B4" class="ajaxCheckbox-cat" type="checkbox" name="cat-B4" ${plan.planItems['cat-B4'].itemValue}><span> AWS</span></label>
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
				<td colspan="8">
					<label><input id="cat-C1" class="ajaxCheckbox-cat" type="checkbox" name="cat-C1" ${plan.planItems['cat-C1'].itemValue}><span> WCDMA</span></label>
					<label><input id="cat-C2" class="ajaxCheckbox-cat" type="checkbox" name="cat-C2" ${plan.planItems['cat-C2'].itemValue}><span> 850</span></label>
					<label><input id="cat-C3" class="ajaxCheckbox-cat" type="checkbox" name="cat-C3" ${plan.planItems['cat-C3'].itemValue}><span> 900</span></label>
					<label><input id="cat-C4" class="ajaxCheckbox-cat" type="checkbox" name="cat-C4" ${plan.planItems['cat-C4'].itemValue}><span> 1900</span></label>
					<label><input id="cat-C5" class="ajaxCheckbox-cat" type="checkbox" name="cat-C5" ${plan.planItems['cat-C5'].itemValue}><span> 2100</span></label>
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
				<td colspan="8">
					<label><input id="cat-D1" class="ajaxCheckbox-cat" type="checkbox" name="cat-D1" ${plan.planItems['cat-D1'].itemValue}><span> TD-SCDMA</span></label>
					<label><input id="cat-D2" class="ajaxCheckbox-cat" type="checkbox" name="cat-D2" ${plan.planItems['cat-D2'].itemValue}><span> B34</span></label>
					<label><input id="cat-D3" class="ajaxCheckbox-cat" type="checkbox" name="cat-D3" ${plan.planItems['cat-D3'].itemValue}><span> B39</span></label>
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
				<td>
					<label><input id="cat-aa" class="ajaxCheckbox-cat" type="checkbox" name="cat-aa" ${plan.planItems['cat-aa'].itemValue}><span> LTE-FDD</span></label>
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
				<td colspan = "7">
					<label><input id="cat-q1" class="ajaxCheckbox-cat" type="checkbox" name="cat-q1" ${plan.planItems['cat-q1'].itemValue}><span> B38</span></label>
					<label><input id="cat-q2" class="ajaxCheckbox-cat" type="checkbox" name="cat-q2" ${plan.planItems['cat-q2'].itemValue}><span> B39</span></label>
					<label><input id="cat-q3" class="ajaxCheckbox-cat" type="checkbox" name="cat-q3" ${plan.planItems['cat-q3'].itemValue}><span> B40</span></label>
					<label><input id="cat-q4" class="ajaxCheckbox-cat" type="checkbox" name="cat-q4" ${plan.planItems['cat-q4'].itemValue}><span> B41</span></label>
					<hr>
					<label><input id="cat-w1" class="ajaxCheckbox-cat" type="checkbox" name="cat-w1" ${plan.planItems['cat-w1'].itemValue}><span> B1</span></label>
					<label><input id="cat-w2" class="ajaxCheckbox-cat" type="checkbox" name="cat-w2" ${plan.planItems['cat-w2'].itemValue}><span> B2</span></label>
					<label><input id="cat-w3" class="ajaxCheckbox-cat" type="checkbox" name="cat-w3" ${plan.planItems['cat-w3'].itemValue}><span> B3</span></label>
					<label><input id="cat-w4" class="ajaxCheckbox-cat" type="checkbox" name="cat-w4" ${plan.planItems['cat-w4'].itemValue}><span> B5</span></label>
					<label><input id="cat-w5" class="ajaxCheckbox-cat" type="checkbox" name="cat-w5" ${plan.planItems['cat-w5'].itemValue}><span> B7</span></label>
					<label><input id="cat-w6" class="ajaxCheckbox-cat" type="checkbox" name="cat-w6" ${plan.planItems['cat-w6'].itemValue}><span> B8</span></label>
					<label><input id="cat-w7" class="ajaxCheckbox-cat" type="checkbox" name="cat-w7" ${plan.planItems['cat-w7'].itemValue}><span> B9</span></label>
					
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
				<th>主板配置码</th>
				<td colspan = "4">
					<a href="#" class="editable" id="zhuban_configcode" data-type="text" data-pk="zhuban_configcode" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入主板配置码">
						<c:out value="${plan.planItems['zhuban_configcode'].itemValue}"/>
					</a>
				</td>
				<th>成品配置</th>
				<td colspan = "3">
					<a href="#" class="editable" id="producted_config" data-type="text" data-pk="producted_config" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入成品配置">
						<c:out value="${plan.planItems['producted_config'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th>灌装SN密匙</th>
				<td colspan="4">
					<label><input id="cat-yesSN" class="ajaxCheckbox-cat" type="checkbox" name="cat-yesSN" ${plan.planItems['cat-yesSN'].itemValue}><span> 是</span></label>
					<label><input id="cat-noSN" class="ajaxCheckbox-cat" type="checkbox" name="cat-noSN" ${plan.planItems['cat-noSN'].itemValue}><span> 否</span></label>
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
				<th>灌装客户密匙</th>
				<td colspan="3">
					<label><input id="cat-yesCE" class="ajaxCheckbox-cat" type="checkbox" name="cat-yesCE" ${plan.planItems['cat-yesCE'].itemValue}><span> 是</span></label>
					<label><input id="cat-noCE" class="ajaxCheckbox-cat" type="checkbox" name="cat-noCE" ${plan.planItems['cat-noCE'].itemValue}><span> 否</span></label>
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
				<th rowspan = "3">号段信息</th>
				<td>BT号段</td>
				<td colspan = "3">
					<a href="#" class="editable" id="bt_num" data-type="text" data-pk="bt_num" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入BT号段">
						<c:out value="${plan.planItems['bt_num'].itemValue}"/>
					</a>
				</td>
				<td>WIFI号段</td>
				<td colspan = "4">
					<a href="#" class="editable" id="wifi_num" data-type="text" data-pk="wifi_num" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入WIFI号段">
						<c:out value="${plan.planItems['wifi_num'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<td>MEID号段</td>
				<td colspan = "3">
					<a href="#" class="editable" id="meid_num" data-type="text" data-pk="meid_num" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入MEID号段">
						<c:out value="${plan.planItems['meid_num'].itemValue}"/>
					</a>
				</td>
					<td>IMEI号段</td>
				<td colspan = "4">
					<a href="#" class="editable" id="imei_num" data-type="text" data-pk="imei_num" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入IMEI号段">
						<c:out value="${plan.planItems['imei_num'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<td>PSN/KSN</td>
				<td colspan = "3">
					<a href="#" class="editable" id="psn_ksn" data-type="text" data-pk="psn_ksn" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入PSN/KSN">
						<c:out value="${plan.planItems['psn_ksn'].itemValue}"/>
					</a>
				</td>
					<td>DSN/TUSN</td>
				<td colspan = "4">
					<a href="#" class="editable" id="dsn_tusn" data-type="text" data-pk="dsn_tusn" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入IMEI号段">
						<c:out value="${plan.planItems['dsn_tusn'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th>工单确认</th>
				<td colspan = "3">PM:</td>
				<td colspan = "3">SPM:</td>
				<td colspan = "3">PMC:</td>
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
