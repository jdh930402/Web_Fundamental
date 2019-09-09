<%@page import="java.util.Calendar"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page pageEncoding="utf-8"%>


<%
	String coin = request.getParameter("coin");
	String start = request.getParameter("start");
	String end = request.getParameter("end");
	if (coin == null){
		coin = "bitcoin";
	}
	Calendar cal = Calendar.getInstance();
	String year = String.valueOf(cal.get(Calendar.YEAR));
	String month = String.valueOf(cal.get(Calendar.MONTH));
	String date = String.valueOf(cal.get(Calendar.DATE));
	if(start ==null){
		start = year+month+date;
	}
	if(end == null){
		end = year+month+date;
	}
	
	
	String url = "https://coinmarketcap.com/currencies/"+ coin +"/historical-data/?start=" +  start + "&end=" + end;
	Document doc = null;
	try {
		doc = Jsoup.connect(url).get();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	Elements bodyElements = doc.select(".table-responsive .table tbody tr");
%>


							<table class="table table-hover">
								<colgroup>
									<col width="20%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="20%" />
									<col width="0%" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">날짜</th>
										<th scope="col">시가</th>
										<th scope="col">고가</th>
										<th scope="col">저가	</th>
										<th scope="col">종가</th>
										<th scope="col">거래량</th>
										<th scope="col">시가총액</th>
									</tr>
								</thead>
								<tbody>
								
								<%
								if(bodyElements.size() != 0){
								for (int i = 0; i < bodyElements.size(); i++) {
									Element trElement = bodyElements.get(i);
									int index = 0;
									String date = trElement.child(index++).text();
									String open = trElement.child(index++).text();
									String high = trElement.child(index++).text();
									String low = trElement.child(index++).text();
									String close = trElement.child(index++).text();
									String volume = trElement.child(index++).text();
									String marketCap = trElement.child(index++).text();
								
								%>
									<tr>
										<th scope="row"><%=date%></th>
										<td><%=open%></td>
										<td><%=high%></td>
										<td><%=low%></td>
										<td><%=close%></td>
										<td><%=volume%></td>
										<td><%=marketCap%></td>
									</tr>	
							<%
									} 
								}
							%>
								</tbody>
							</table>

							