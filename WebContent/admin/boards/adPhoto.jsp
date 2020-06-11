<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table class="table table-hover">
	<colgroup>
		<col width="120px" />
		<col width="120px" />
		<col width="120px" />
	</colgroup>
	<tbody>
		<!-- 리스트반복 -->
		<%
			//List컬렉션에 입력된 데이터가 없을떄 true를 반환
			if (bbs.isEmpty()) {
		%>
		<tr>
			<td colspan="4" align="center" height="100">등록된 게시물이 없습니다.</td>
		</tr>

		<% 
			} else {
				//게시물의 가상번호로 사용할 변수
				int vNum = 0;
				int countNum = 0;
				int num = 0;

				/*
				컬렉션에 입력된 데이터가 있다면 저장된 BbsDTO의 객수만큼
				즉, DB가 반환해준 레코드의 갯수만큼 반복하면서 출력한다.
				*/
				for (BoardDTO dto : bbs) {
					vNum = totalRecordCount - (((nowPage - 1) * 9) + countNum++);

					/*  
					전체 게시물수 : 107개 
					페이지사이즈: 10
					
					현제페이지 1
						첫번쨰 게시물 : 107 - (((1-1)*10)+0)= 107
						두번쨰 게시물 : 107 - (((1-1)*10)+1)= 106
					현제페이지 2
						첫번쨰 게시물 : 107 - (((2-1)*10)+0)= 97
						두번쨰 게시물 : 107 - (((2-1)*10)+1)= 96
					*/

					if (num % 3 == 0) {
		%> 
		<tr>
			<%
				}
			%>
			<td> 
				<table class="table"> 
					<tr colspan="3" class="text-center">
						<a href="adBoardView.jsp?num=<%=dto.getNum()%>&nowPage=<%=nowPage%>&<%=queryStr%>">
							<img src="../../Upload/<%=dto.getSfile()%>" width="200px"	height="200px" alt="" />
						</a>
					</tr> 
					<tr colsspan="3" class="text-center"> 
						<td class="text-center"><%=dto.getTitle()%></td>
					</tr>
					<tr>
						<td class="text-center"><i class='far fa-user'></i>&nbsp;<%=dto.getId()%></td>
						<td class="text-center"><i class='far fa-clock'></i>&nbsp;<%=dto.getPostdate()%></td>
						<td class="text-center"><i class='far fa-eye'></i>&nbsp;<%=dto.getVisitcount()%></td>
					</tr>
				</table>
			</td> 
			<%
				if (num % 3 == 2) {
			%>
		</tr>
		<%
			}
					num++;
				}
			}
		%>
	</tbody>
</table>