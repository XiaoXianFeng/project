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
<h3 align="center">竞天数码生产计划通知书</h3>
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
			<td rowspan = "8" width=10%px>生产资料</td>
			<td width=15%px>产品名称 </td>
			<td width=25%px>产品型号 </td>
			<td width=25%px>PCB 版本号 </td>
			<td width=25%px>产品P/N </td>
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
			<td>
				<a href="#" class="editable" id="productPN" data-type="text" data-pk="productPN" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品P/N">
					<c:out value="${plan.planItems['productPN'].itemValue}"/>
				</a>
			</td>
			
		</tr>
		<tr>
			<td>类别</td>
			<td colspan="3">
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
			<td>组装和包装BOM</td>
			<td colspan="2">
				<a href="#" id="zuzbaoz_bom" data-type="textarea" data-pk="zuzbaoz_bom" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入组装和包装"><c:out value="${plan.planItems['zuzbaoz_bom'].itemValue}"/></a>
			<script>
				$(function(){
				    $('#zuzbaoz_bom').editable({
				        url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '组装和包装BOM',
				        rows: 2
				    });
				});
				</script>
			</td>
			<td rowspan ="5">
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
			<td>测试文件</td>
			<td colspan="2"><a href="#" id="test_file" data-type="textarea" data-pk="test_file" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入测试文件"><c:out value="${plan.planItems['test_file'].itemValue}"/></a>
			<script>
				$(function(){
				    $('#test_file').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '测试文件',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>
				<a href="#" class="editable" id="message1" data-type="text" data-pk="message1" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入新增信息1名称">
					<c:out value="${plan.planItems['message1'].itemValue}"/>
				</a>
			</td>
			<td colspan="2"><a href="#" id="input_message1" data-type="textarea" data-pk="input_message1" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入新增信息1内容"><c:out value="${plan.planItems['input_message1'].itemValue}"/></a>
			<script>
				$(function(){
				    $('#input_message1').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '新增信息1内容',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>
				<a href="#" class="editable" id="message2" data-type="text" data-pk="message2" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入新增信息2名称">
					<c:out value="${plan.planItems['message2'].itemValue}"/>
				</a>
			</td>
			<td colspan="2"><a href="#" id="input_message2" data-type="textarea" data-pk="input_message2" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入新增信息2内容"><c:out value="${plan.planItems['input_message2'].itemValue}"/></a>
			<script>
				$(function(){
				    $('#input_message2').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '新增信息2内容',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>
				<a href="#" class="editable" id="message3" data-type="text" data-pk="message3" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入新增信息3名称">
					<c:out value="${plan.planItems['message3'].itemValue}"/>
				</a>
			</td>
			<td colspan="2"><a href="#" id="input_message3" data-type="textarea" data-pk="input_message3" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入新增信息3内容"><c:out value="${plan.planItems['input_message3'].itemValue}"/></a>
			<script>
				$(function(){
				    $('#input_message3').editable({
				    	url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '新增信息3内容',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td style="width:140px; word-break:break-all;">绿色产品<br/>生产要求(必选)</td>
			<td colspan = "4">工艺要求：
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
			<td>生产性质（必选）</td>
			<td colspan = "4">
				<label><input id="manufacture-lianchan" class="ajaxCheckbox-manufacture" type="checkbox"  ${plan.planItems['manufacture-lianchan'].itemValue}><span> 量产</span></label>
				<label><input id="manufacture-shichan" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-shichan'].itemValue}><span> 试产（小批量设计验证）</span></label>
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
			<td>委托加工方</td>
			<td>订单批量</td>
			<td>要求出货数量</td>
			<td>预计生产日期</td>
			<td>预计交货日期</td>
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
				<a href="#" class="editable" id="request_total" data-type="text" data-pk="request_total" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入要求出货数量">
					<c:out value="${plan.planItems['request_total'].itemValue}"/>
				</a>
			</td>
			<td>
				<a href="#" class="editable" id="manufactureDate" data-type="date" data-pk="manufactureDate" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入预计生产日期">
					<c:out value="${plan.planItems['manufactureDate'].itemValue}"/>
				</a>
			</td>
			<td>
				<a href="#" class="editable" id="completeDate" data-type="date" data-pk="completeDate" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入预计交货日期">
					<c:out value="${plan.planItems['completeDate'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
				<td rowspan = "2">客户确认（标记）</td>
				<td>主板S/N</td>
				<td>
					<a href="#" class="editable" id="zhuban_sn" data-type="text" data-pk="zhuban_sn" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入主板S/N">
						<c:out value="${plan.planItems['zhuban_sn'].itemValue}"/>
					</a>
				</td>
				<td>MAC地址</td>
				<td>
					<a href="#" class="editable" id="mac_address" data-type="text" data-pk="mac_address" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入MAC地址">
						<c:out value="${plan.planItems['mac_address'].itemValue}"/>
					</a>
				</td>
		</tr>
		<tr>
				<td>IMEI</td>
				<td>
					<a href="#" class="editable" id="imei" data-type="text" data-pk="imei" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入IMEI">
						<c:out value="${plan.planItems['imei'].itemValue}"/>
					</a>
				</td>
				<td>MEID</td>
				<td>
					<a href="#" class="editable" id="meid" data-type="text" data-pk="meid" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入MEID">
						<c:out value="${plan.planItems['meid'].itemValue}"/>
					</a>
				</td>
		</tr>
		<tr>
				<td>物料信息</td>
				<td colspan = "4" >
					<div id="wuliao_messages" data-type="wysihtml5" data-pk="wuliao_messages">
						<c:out value="${plan.planItems['wuliao_messages'].itemValue}" escapeXml="false"/>
					</div>
					<script>
					$('#wuliao_messages').editable({
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
				<td>备注</td>
				<td colspan = "4" >
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