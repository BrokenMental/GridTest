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
			colNames:['신문사','통계'], //화면에 표시되는 컬럼제목
			colModel:[ //데이터와 매핑되는 명칭(name), 대소문자를 가지니 주의하자
				{name:'name',index:'name', width:200, align:"center", sorttype:"string"},
				{name:'total',index:'total', width:200, align:"center", sorttype:"string"},
				],
				caption: "뉴스 통계", //그리드 제목
				// multiselect : true, //체크박스 생성
		        viewrecords: true,
				gridview: true,
				// data: temp? // json 형식의 데이터 매핑 할 경우 사용
				// pager: "#jqPager" // 페이지 정보 표시
			});
		
		var mydata = eval('<%=js%>');
		
		//여러 데이터 집어넣을경우(반복문 사용)
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


<!--
// jqgrid 다운로드 
// http://www.trirand.com/blog/?page_id=6

// jquery ui 다운로드
// https://jqueryui.com/download/

// jquery 다운로드
// https://jquery.com/download/

<link rel="stylesheet" type="text/css" href="ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" href="jquery-ui.css" />
//<link rel="stylesheet" type="text/css" href="jqGrid/css/addons/ui.multiselect.css" />
	
<section class="content">
<script type="text/javascript" src="jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="jquery-ui-1.10.3.min.js"></script>
<script type="text/javascript" src="locale_kr.js"></script>
<script type="text/javascript" src="jquery.jqGrid.min.js"></script>
<table id="jqGrid"></table>
<div id="jqGridPager"></div>
<script type="text/javascript">
	$(function(){
	    $.ajax({
	        type: "GET",
	        url: "공공데이터 api json url",
	        success:function(data){
	        	let test = data.octastatapi10619.row;

                $("#jqGrid").jqGrid({
                	datatype: "json", // 이건 왜쓰는건지 모르겠음, local 이나 json을 써도 변화가 없음
                    colNames: ["기간", "구간", "계", "자치구", "지역"], // 필드에 표시할 제목
                    colModel: [ // json 데이터 연동될 필드명 'name'에 입력, label은 모르겠음
                        { name: 'GIGAN', width: 75 },
                        { name: 'GUGAN', width: 150 },
                        { name: 'GYE', width: 150 },
                        { name: 'JACHIGU', width: 150 },
                        { name: 'JIGEOP', width: 150 }
                    ],
                    viewrecords: true, // 우측 하단에 '보기'?
                    height: 250, // 크기
                    pager: "#jqGridPager", // pager 사용시 추가할 태그
                });

		        for(var i=0;i<test.length;i++){ // 외부 json을 grid에 집어넣으려면 for문으로 돌려야 하는듯?
                    jQuery("#jqGrid").addRowData(i+1,test[i]);
                    //jQuery().jqgrid() 라는 형식은 왜쓰는지 모르겠음
                }
		    }
        })
        
    })
    
    // 참조 : https://www.google.co.kr/search?hl=ko&sxsrf=ACYBGNS27svXPBIMFFz5kYqq2bwWvyN6cQ%3A1571649283015&ei=A3etXbw50vrBA7uWquAC&q=jqgrid+json+%EB%8D%B0%EC%9D%B4%ED%84%B0+%EB%84%A3%EA%B8%B0&oq=jqgrid+json+%EB%8D%B0%EC%9D%B4%ED%84%B0+%EB%84%A3%EA%B8%B0&gs_l=psy-ab.3..0.1088.6734..6824...8.0..2.124.2456.19j6......0....1..gws-wiz.......0i20i263j35i39j0i30j33i160.YL9JFbd2CDk&ved=0ahUKEwj8xubpga3lAhVSfXAKHTuLCiwQ4dUDCAs&uact=5
</script>
</section>
 -->