<%@page import="chap11.Thermometer"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%날씨
	Thermometer thermometer = new Thermometer();
/* t엔 thermometer 객체가 포함되어 있을것. */
	request.setAttribute("t", thermometer);
%>
<html>
<head>
	<title>온도 변환 예제</title>
</head>
<body>
	
	${t.setCelsius('서울', -13.8)}
	<!-- 스크립렛으로 표현하면 아래와 같이 표현가능 -->
	<%thermometer.setCelsius("서울",-13.8); %>
	서울 온도: 섭씨 ${t.getCelsius('서울')}도 / 화씨 ${t.getFahrenheit('서울')}

	<br/>
	<!-- t의 인포를 의미함. -->
	정보: ${t.info}
<!-- 위나 아래나 똑같은데, 위의 코드는 scope가 없다. scope 없어도 하나하나 돌면서 다 찾음. -->	
	 ${requestScope.t.getInfo()}
</body>
</html>
