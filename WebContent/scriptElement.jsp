<%@page import="java.util.Calendar"%>
<%@ page pageEncoding="utf-8" %>
<html>
	<body>
		<h1>Scripting Element</h1>
		<%!
			// declaration
			private int age;
			public void m(){
				
			}
		%>
		
		<table>
			<tr>
				<td>  </td>
			</tr>
		</table>
		<%
			//★ scriptlet => 변수나 함수의 호출만 가능하다. 일반적으로 html중간에 삽입되는 자바코드는 scriptlet을 이용하여 삽입한다.
			int tt;
			m();
		%>
		
		<select>
			<%
				Calendar c = Calendar.getInstance();
				int year = c.get(Calendar.YEAR);
				for(int i=1900 ; i<= year ; i++){
			%>
			<option value='<%=i%>' <%if(year-20 == i){%>selected= "selected"<%}%>> <%=i%> </option>
			<%
				}
			%>
			
		</select>
	</body>
</html>