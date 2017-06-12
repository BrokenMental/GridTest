<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="testGrid.test.TestGrid" %>
<%@ page import="java.util.*" %>
<%@ page import="net.sf.json.util.JSONStringer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	TestGrid jm = new TestGrid();
	JSONStringer js = jm.getData();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="css/ui.jqgrid.css" />
	<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="js/i18n/grid.locale-en.js"></script>
	<script type="text/javascript" src="js/jquery.jqGrid.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#list").jqGrid({
			datatype: "local",
			height: 250,
			colNames:['이름','값'],
			colModel:[
				{name:'name',index:'name'},
				{name:'value',index:'value'},
				],
				caption: "그리드 배열 데이터 샘플링",
		        viewrecords: true,
		        gridview: true,
				pager: "#jqPager"
			});
	    var mydata = eval('<%=js%>');
	    for(var j=0;j<=mydata.length;j++){
	        jQuery("#list").addRowData(j+1,mydata[j]);
	    }
		});
	</script>
</head>
<body>
	<table id="list">
	</table>
	<div id="jqPager"></div>
</body>
</html>

<!-- <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>My First Grid</title>
 
<link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
 
<style type="text/css">
html, body {
    margin: 0;
    padding: 0;
    font-size: 75%;
}
</style>
 
<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="js/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="js/jquery.jqGrid.min.js" type="text/javascript"></script>
 
<script type="text/javascript">
$(function () {
    $("#list").jqGrid({
        url: "example.json",
        datatype: "json",
        mtype: "POST",
        colNames: ["Inv No", "Date", "Amount", "Tax", "Total", "Notes"],
        colModel: [
            { name: "invid", width: 55 },
            { name: "invdate", width: 90 },
            { name: "amount", width: 80, align: "right" },
            { name: "tax", width: 80, align: "right" },
            { name: "total", width: 80, align: "right" },
            { name: "note", width: 150, sortable: false }
        ],
        pager: "#pager",
        rowNum: 10,
        rowList: [10, 20, 30],
        sortname: "invid",
        sortorder: "desc",
        viewrecords: true,
        gridview: true,
        autoencode: true,
        caption: "My first grid"
    }); 
}); 
</script>
 
</head>
<body>
    <table id="list"><tr><td></td></tr></table> 
    <div id="pager"></div> 
</body>
</html> -->