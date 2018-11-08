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
<h3 align="center">生产计划通知书</h3>
<table class="oms_table" style="margin-left: auto; margin-right: auto; border: 0px">
	<tr>
		<td style="width:100px">客户名称:</td>
		<td style="width:200px" align="left">
			<div style="width:200px; text-align:left;  word-break: break-all;">
			<a href="#" id="customer" data-type="text" data-pk="customer" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入客户名称">
				<c:out value="${plan.customer}"/>
			</a>
			</div>
			<c:if test="${empty param.view}">
			<script>
			$('#customer').editable({
					placement: 'bottom'
			});
			</script>
			</c:if>
		</td>
		<td style="width:100px">销售性质：</td>
		<td style="width:200px" align="left">
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
</table>
<table class="oms_table" border="1" style="margin-left: auto;margin-right: auto; width:80%">
    <tbody>
		<tr>
			<td rowspan = "17" width=10%px>生产资料(无请填写/)</td>
			<td colspan = "2" width=15%px>产品名称 </td>
			<td colspan = "3" width=25%px>产品型号 </td>
			<td colspan = "2" width=25%px>PCB 版本号 </td>
			<td colspan = "2" width=25%px>产品P/N (PCBA料号)</td>
		</tr>
		<tr>
			<td colspan = "2"><a href="#" class="editable" id="productName" data-type="text" data-pk="productName" 
				data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品名称">
				<c:out value="${plan.planItems['productName'].itemValue}"/>
			</a></td>
			<td colspan = "3">
				<a href="#" class="editable" id="productModel" data-type="text" data-pk="productModel" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品型号">
					<c:out value="${plan.planItems['productModel'].itemValue}"/>
				</a>
			</td>
			<td colspan = "2">
				<a href="#" class="editable" id="pcbVer" data-type="text" data-pk="pcbVer" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入PCB版本号 ">
					<c:out value="${plan.planItems['pcbVer'].itemValue}"/>
				</a>
			</td>
			<td colspan = "2">
				<a href="#" class="editable" id="productPN" data-type="text" data-pk="productPN" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品P/N">
					<c:out value="${plan.planItems['productPN'].itemValue}"/>
				</a>
			</td>
			
		</tr>
		<tr>
			<td colspan="2">类别</td>
			<td colspan="7">
				<label><input id="cat-smt" class="ajaxCheckbox-cat" type="checkbox" name="cat-smt" ${plan.planItems['cat-smt'].itemValue}><span> SMT</span></label>
				<label><input id="cat-chajian" class="ajaxCheckbox-cat" type="checkbox" name="cat-chajian" ${plan.planItems['cat-chajian'].itemValue}><span> 插件</span></label>
				<label><input id="cat-zuzhuang" class="ajaxCheckbox-cat" type="checkbox" name="cat-zuzhuang" ${plan.planItems['cat-zuzhuang'].itemValue}><span> 组装</span></label>
				<label><input id="cat-other" class="ajaxCheckbox-cat" type="checkbox" name="cat-other" ${plan.planItems['cat-other'].itemValue}><span> 其他</span></label>
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
			<td colspan = "2">贴片BOM</td>
			<td colspan="5">
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
			<td rowspan ="7" colspan = "2">
				<a href="#" id="custel" data-type="textarea" data-pk="custel" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入客户信息"><c:out value="${plan.planItems['custel'].itemValue}"/></a>
			<script>
				$(function(){
				    $('#custel').editable({
				        url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '客户信息',
				        rows: 2
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td colspan = "2">SMT资料包</td>
			<td colspan="5"><a href="#" id="smtDocPackage" data-type="textarea" data-pk="smtDocPackage" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品P/N"><c:out value="${plan.planItems['smtDocPackage'].itemValue}"/></a>
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
			<td colspan = "2">下载软件名</td>
			<td colspan = "5"><a href="#" id="software_name" data-type="textarea" data-pk="software_name" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入下载软件名"><c:out value="${plan.planItems['software_name'].itemValue}"/></a>
			<script>
				$(function(){
				    $('#software_name').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '下载软件名',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td colspan = "2">烧录软件校验和</td>
			<td colspan="5"><a href="#" id="softChecksum" data-type="textarea" data-pk="softChecksum" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入烧录软件校验和"><c:out value="${plan.planItems['softChecksum'].itemValue }"/></a>
			<script>
				$(function(){
				    $('#softChecksum').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '烧录软件校验和',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td colspan = "2">测试流程要求</td>
			<td colspan="5"><a href="#" id="test_request" data-type="textarea" data-pk="test_request" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入测试流程要求"><c:out value="${plan.planItems['test_request'].itemValue }"/></a>
			<script>
				$(function(){
				    $('#test_request').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '测试流程要求',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td colspan = "2">测试工具版本</td>
			<td colspan="5"><a href="#" id="testtool_ver" data-type="textarea" data-pk="testtool_ver" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入测试工具版本"><c:out value="${plan.planItems['testtool_ver'].itemValue }"/></a>
			<script>
				$(function(){
				    $('#testtool_ver').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '测试工具版本',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td colspan = "2">烧录器件编码</td>
			<td colspan="5"><a href="#" id="qijianCode" data-type="textarea" data-pk="qijianCode" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入烧录器件编码"><c:out value="${plan.planItems['qijianCode'].itemValue }"/></a>
			<script>
				$(function(){
				    $('#qijianCode').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '烧录器件编码',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td colspan = "2">LCM</td>
			<td colspan = "2"><a href="#" id="lcm" data-type="textarea" data-pk="lcm" 
				data-url="<%=request.getContextPath()%>/do/plan/save.html" 
				data-title="LCM"><c:out value="${plan.planItems['lcm'].itemValue }"/></a>
			<script>
				$(function(){
				    $('#lcm').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: 'LCM',
				        rows: 5
				    });
				});
				</script>
			</td>
			
			<td>摄像头</td>
			<td ><a href="#" id="camera" data-type="textarea" data-pk="camera" 
				data-url="<%=request.getContextPath()%>/do/plan/save.html" 
				data-title="摄像头"><c:out value="${plan.planItems['camera'].itemValue }"/></a>
			<script>
				$(function(){
				    $('#camera').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '摄像头',
				        rows: 5
				    });
				});
				</script>
			</td>
			
			<td>主副板配套信息</td>
			<td colspan = "2"><a href="#" id="zhufubanpeitao" data-type="textarea" data-pk="zhufubanpeitao" 
				data-url="<%=request.getContextPath()%>/do/plan/save.html" 
				data-title="主副板配套信息"><c:out value="${plan.planItems['zhufubanpeitao'].itemValue }"/></a>
			<script>
				$(function(){
				    $('#zhufubanpeitao').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<th rowspan = "6">测试频段</th>
			<td>GSM</td>
			<td colspan = "7">
				<a href="#" class="editable" id="gsm_number" data-type="text" data-pk="gsm_number" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入GSM频段">
					<c:out value="${plan.planItems['gsm_number'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td>CDMA</td>
			<td colspan = "7">
				<a href="#" class="editable" id="cdma_number" data-type="text" data-pk="cdma_number" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入CDMA频段">
					<c:out value="${plan.planItems['cdma_number'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td>WCDMA</td>
			<td colspan = "7">
				<a href="#" class="editable" id="wcdma_number" data-type="text" data-pk="wcdma_number" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入WCDMA频段">
					<c:out value="${plan.planItems['wcdma_number'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td>TDSCDMA</td>
			<td colspan = "7">
				<a href="#" class="editable" id="tdscdma_number" data-type="text" data-pk="tdscdma_number" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入TDSCDMA频段">
					<c:out value="${plan.planItems['tdscdma_number'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td>TDD-LTE</td>
			<td colspan = "7">
				<a href="#" class="editable" id="tdd-lte_number" data-type="text" data-pk="tdd-lte_number" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入TDD-LTE频段">
					<c:out value="${plan.planItems['tdd-lte_number'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td>FDD-LTE</td>
			<td colspan = "7">
				<a href="#" class="editable" id="fdd-lte_number" data-type="text" data-pk="fdd-lte_number" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入FDD-LTE频段">
					<c:out value="${plan.planItems['fdd-lte_number'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td style="width:140px; word-break:break-all;" colspan = "2">绿色产品<br/>生产要求(必选)</td>
			<td colspan = "8">工艺要求：
				<label><input id="fabrication-wuqian" class="ajaxCheckbox-fabrication" type="checkbox"  ${plan.planItems['fabrication-wuqian'].itemValue}><span> 无铅工艺</span></label>
				<label><input id="fabrication-youqian" class="ajaxCheckbox-fabrication" type="checkbox" ${plan.planItems['fabrication-youqian'].itemValue}><span> 有铅工艺</span></label>
				<label><input id="fabrication-rohs" class="ajaxCheckbox-fabrication" type="checkbox" ${plan.planItems['fabrication-rohs'].itemValue}><span> ROHS工艺</span></label>
				<label><input id="fabrication-wulu" class="ajaxCheckbox-fabrication" type="checkbox" ${plan.planItems['fabrication-wulu'].itemValue}><span> 无卤工艺</span></label>
				<label><input id="fabrication-other" class="ajaxCheckbox-fabrication" type="checkbox" ${plan.planItems['fabrication-other'].itemValue}><span> 其他要求</span></label>
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
			<td colspan = "2">生产性质（必选）</td>
			<td colspan = "8">
				<label><input id="manufacture-lianchan" class="ajaxCheckbox-manufacture" type="checkbox"  ${plan.planItems['manufacture-lianchan'].itemValue}><span> 量产</span></label>
				<label><input id="manufacture-shichan" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-shichan'].itemValue}><span> 试产（小批量设计验证）</span></label>
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
			<td>委托加工方</td>
			<td colspan = "3">订单批量</td>
			<td colspan = "2">要求出货数量</td>
			<td colspan = "2">预计生产日期</td>
			<td colspan = "2">预计交货日期</td>
		</tr>
		<tr>
			<td>
				<a href="#" class="editable" id="producer" data-type="text" data-pk="producter" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入委托加工方">
					<c:out value="${plan.planItems['producer'].itemValue}"/>
				</a>
			</td>
			<td colspan = "3">
				<a href="#" class="editable" id="dingdan_total" data-type="text" data-pk="dingdan_total" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入订单批量">
					<c:out value="${plan.planItems['dingdan_total'].itemValue}"/>
				</a>
			</td>
			<td colspan = "2">
				<a href="#" class="editable" id="fenpi_total" data-type="text" data-pk="fenpi_total" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入分批投产数量">
					<c:out value="${plan.planItems['fenpi_total'].itemValue}"/>
				</a>
			</td>
			<td colspan = "2">
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
				<td rowspan = "3">客户确认</td>
				<th rowspan = "3">标记</th>
				<td colspan = "2">主板S/N</td>
				<td colspan = "3">
					<a href="#" class="editable" id="zhuban_sn" data-type="text" data-pk="zhuban_sn" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入主板S/N">
						<c:out value="${plan.planItems['zhuban_sn'].itemValue}"/>
					</a>
				</td>
				<td>MAC地址</td>
				<td colspan = "2">
					<a href="#" class="editable" id="mac_address" data-type="text" data-pk="mac_address" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入MAC地址">
						<c:out value="${plan.planItems['mac_address'].itemValue}"/>
					</a>
				</td>
		</tr>
		<tr>
				<td colspan = "2">IMEI</td>
				<td colspan = "3">
					<a href="#" class="editable" id="imei" data-type="text" data-pk="imei" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入IMEI">
						<c:out value="${plan.planItems['imei'].itemValue}"/>
					</a>
				</td>
				<td>MEID</td>
				<td colspan = "2">
					<a href="#" class="editable" id="meid" data-type="text" data-pk="meid" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入MEID">
						<c:out value="${plan.planItems['meid'].itemValue}"/>
					</a>
				</td>
		</tr>
		<tr>
				<td colspan = "2">蓝牙地址</td>
				<td colspan = "3" style=" word-wrap: break-word; word-break: normal;">
					<a href="#" class="editable" id="bluetooth_address" data-type="text" data-pk="bluetooth_address" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入蓝牙地址">
						<c:out value="${plan.planItems['bluetooth_address'].itemValue}"/>
					</a>
				</td>
				<td></td>
				<td colspan = "2"></td>
		</tr>
		<tr>
				<td>备注</td>
				<td colspan = "9" >
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
			<th rowspan = "3">会签</th>
			<td colspan = "2">项目部:</td>
			<td colspan = "3">
				<a href="#" class="editable" id="project_part" data-type="text" data-pk="project_part" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入项目部信息">
					<c:out value="${plan.planItems['project_part'].itemValue}"/>
				</a>
			</td>
			<td colspan = "2">硬件部:</td>
			<td colspan = "2">
				<a href="#" class="editable" id="rf_name" data-type="text" data-pk="rf_name" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入硬件部信息">
					<c:out value="${plan.planItems['rf_name'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td colspan = "2">软件部:</td>
			<td colspan = "3">
				<a href="#" class="editable" id="software_part" data-type="text" data-pk="software_part" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入软件部信息">
					<c:out value="${plan.planItems['software_part'].itemValue}"/>
				</a>
			</td>
			<td colspan = "2">结构部:</td>
			<td colspan = "2">
				<a href="#" class="editable" id="jiegou_part" data-type="text" data-pk="jiegou_part" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入结构部信息">
					<c:out value="${plan.planItems['jiegou_part'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td colspan = "2">运营部:</td>
			<td colspan = "3">
				<a href="#" class="editable" id="run_part" data-type="text" data-pk="run_part" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入运营部信息">
					<c:out value="${plan.planItems['run_part'].itemValue}"/>
				</a>
			</td>
			<td colspan = "2">质量部:</td>
			<td colspan = "2">
				<a href="#" class="editable" id="zhiliang_part" data-type="text" data-pk="zhiliang_part" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入质量部信息">
					<c:out value="${plan.planItems['zhiliang_part'].itemValue}"/>
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