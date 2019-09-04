<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@ page pageEncoding="utf-8" %>

<%
	int cPage = Integer.parseInt(request.getParameter("page"));
	int length = Integer.parseInt(request.getParameter("length"));
	int totalPage = 0; // 전체 페이지를 저장하는 변수
	int startPage = 0; // 페이지 버튼의 시작 값을 설정하는 변수
	int endPage = 0; // 페이지 버튼의 마지막 값을 설정하는 변수
	int pageLength = 10;
	int start = (cPage-1)*length;
	MemberDao dao = MemberDao.getInstance();
	ArrayList<MemberDto> list = dao.select(start, length);
%>
							<table class="table table-hover">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="15%" />
									<col width="20%" />
									<col width="20%" />
									<col width="20%" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">이름</th>
										<th scope="col">아이디</th>
										<th scope="col">이메일</th>
										<th scope="col">핸드폰번호</th>
										<th scope="col">등록날짜</th>
									</tr>
								</thead>
								<tbody id = "table_body">
								<%
									if(list.size() != 0){
										for(int i=0; i< list.size(); i++){
											MemberDto dto = list.get(i);
											int seq = dto.getSeq();
											String name = dto.getName();
											String id = dto.getId();
											String email = dto.getEmail();
											String phone = dto.getPhone();
											String regdate = dto.getRegdate();
								%>
									<tr>
										<th scope="row"><%=seq%></th>
										<td><%=name%></td>
										<td><a href="view.jsp?seq=<%=seq%>&page=<%=cPage%>"><%=id%></a></td>
										<td><%=email%></td>
										<td><%=phone%></td>
										<td><%=regdate%></td>
									</tr>
									
								<%
										}
									}else{
								%>
								 	<tr>
									 	<td class="text-center" colspan = "6" scope = "row"> 등록된 부서가 없습니다.</td>
									</tr>
								
								<%
									}
								%>
								</tbody>
							</table>

							<nav aria-label="Page navigation example">
								<ul class="pagination pagination-lg justify-content-center">
								
								<!-- <<버튼 설정  -->
								<%
								int totalRows = dao.getRows();
								
								totalPage = totalRows%length == 0 ? totalRows/length : totalRows/length+1; // 조건 ? true : false; // 26개
								if(totalPage == 0){
									totalPage = 1;
								}
								
								// pageLength개 씩의 페이지를 판별하는 블록
								int currentBlock = cPage % pageLength == 0 ? cPage/pageLength : cPage/pageLength+1;
								// 마지막 블록에서는 마지막 페이지가 있어야하기때문에 totalBlock을 구한다.
								int totalBlock = totalPage % pageLength == 0 ? totalPage/pageLength : totalPage/pageLength +1;
								
								// 등차수열 An = a1 + (n-1)*d => n이 currentBlock
								// 
								startPage = 1 + (currentBlock - 1) * pageLength;   
								endPage = pageLength + (currentBlock - 1) * pageLength;
								if(currentBlock == totalBlock){
									endPage = totalPage;
								}
									if(currentBlock !=1) {
								%>
									<li class="page-item "> <a class="page-link" href="javascript:util.pageLoading('<%=startPage-1%>','<%=length%>');" tabindex="-1">&laquo;</a></li>
								<%
									} else {
								%>
									<li class="page-item disabled"> <a class="page-link" href="#" tabindex="-1">&laquo;</a></li>
								<%
									}
								%>
								
								<!-- 숫자버튼 설정  -->
								<%
									for(int i = startPage ; i<=endPage; i++){
								%>
									<li class="page-item <%if(cPage==i){%>active <%}%>"><a class="page-link" href="javascript:util.pageLoading('<%=i%>','<%=length%>');"><%=i%></a></li>
								<%
									}
								%>
								
								<!-- >>버튼 설정  -->
								<%
									if(currentBlock != totalBlock){
								%>
									<li class="page-item" ><a class="page-link" href="javascript:util.pageLoading('<%=endPage+1%>','<%=length%>');"> &raquo;</a></li>
								<%
									} else{
								%>
									<li class="page-item disabled" ><a class="page-link" href="#"> &raquo;</a></li>
								<%
									}
								%>
								</ul>
							</nav>
