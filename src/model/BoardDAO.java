package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

public class BoardDAO {

	//멤버변수(클래스 전체 멤버메소드에서 접근 가능)
	Connection  con;
	PreparedStatement psmt;
	ResultSet rs;
	
	public BoardDAO(ServletContext ctx) {
	      try {
	          Class.forName(ctx.getInitParameter("MariaJDBCDriver"));
	          String id = "j941223";
	          String pw = "ejrfo123";
	          con = 
	                DriverManager.getConnection(ctx.getInitParameter("MariaConnectURL"), id, pw);
	          System.out.println("DB연결성공");
	       }catch(Exception e){	       
	    	   e.printStackTrace();
	          System.out.println("연결실패");
	       }
	}
	
	//글쓰기  처리 메소드 
	public int insertWrite(BoardDTO dto) {
		//실제 입력된 행의 갯수를 저장하기 위한 변수 
		int affected =0;
		try {
			/*
			 	Oracle에서는 시퀀스를 사용해서 일련번호를 입력하지만
			 	MariaDB에서는 auto_increment 제약조건으로 컬럼 자체를 
			 	자동증가 컬럼으로 지정한다. 자동증가컬럼은 임의의 값을
			 	입력하는것보다 쿼리에서 제외시켜주는편이 훨씬 좋다.
			 * */
			String query= "INSERT INTO board("
					+ " title,content,id,visitcount,bname,progdate) "
					+ " VALUES ( "
					+ " ?, ?, ?, 0, ?, ?)";
				
			psmt = con.prepareStatement(query);
			psmt.setString(1,  dto.getTitle());
			psmt.setString(2,  dto.getContent());
			psmt.setString(3,  dto.getId());
			psmt.setString(4,  dto.getBname());
			psmt.setString(5,  dto.getProgdate());
			
			affected =psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		return affected;
				
	}
	//일련번호 num에 해당하는 게시물의 조회수 증가 
	public void updateVisitCount(String num) {
		String query ="UPDATE board SET "
				+ " visitcount=visitcount+1 "
				+ " where num=?";
		try {
			psmt =con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("조회수 증가시 예외발생");
			e.printStackTrace();
		}
	}
	//일련번호에 해당하는 게시물을 가져와소DTO객체에 저장후 반환
	public BoardDTO selectView(String num) {
	
		BoardDTO dto = new BoardDTO();
		//기존쿼리문: member테이블과 join없을댸...
//		String query = "SELECT * FROM board where num=?";
		
		//변경된쿼리문: member테이블과 join하여 사용자이름 가져옴.
		String query = "SELECT B.*, M.name, M.email " + 
				" FROM membership M INNER JOIN board B " + 
				" ON M.id=B.id " + 
				" WHERE num =? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				dto.setOfile(rs.getString(8));
				dto.setSfile(rs.getString(9));
				//테이블join으로 컬럼추가 
				
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
			}
			
		} catch (Exception e) {
			System.out.println("상세보기시 예외발생");
			e.printStackTrace();
		}
		return dto;	
	}
	/*
	 게시판 리스트에서 게시물의 객수를 count()함수를 통해 구해서 반환함.
	 가상번호, 페이지번호 처리를 위해 사용함.
	 
	 * */
	
	
	public int getTotalRecordConunt(Map<String, Object> map) {

		//게시물의 수는 0으로 초기화
		int totalCount =0;
		//기본처리문(전체레코드를 대상으로 함)
		String query = "SELECT COUNT(*) FROM board "	
				+" WHERE bname='"+map.get("bname")+"' ";
			
		//JSP페이지에서 검색어를 입력한 경우where절이 동적으로 추가됨.
		if(map.get("Word")!=null) {
			query += " AND "+ map.get("Column")+" "
					+ " LIKE '%"+map.get("Word")+"%'";
		}
		
		try {
			psmt= con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
		}
		return totalCount;
	}
	/*
	 게시판 리스트에서 조건에 맞는 레코드를 select하여 ResultSet(결과셋)을
	 List컬렉션에 저장후 반환하는 메소드
	 * 
	 */
		public List<BoardDTO> selectList(Map<String, Object> map){
			
			List<BoardDTO> bbs = new Vector<BoardDTO>();
			//기본쿼리문
			String query = "SELECT * FROM board";
			//검색어가 있는경우 조건절 동적 추가 
			if(map.get("Word")!=null) {
				query += " WHERE "+ map.get("Column") + " "
						+ " LIKE '%" + map.get("Word")+"%'";
						
			}
			//최근게시물의 항상 위로 노출되야 하므로 작성된 순서의 역순으로 정렬한다.
			query += " ORDER BY num DESC";
			try {
				
				psmt = con.prepareStatement(query);
				rs =psmt.executeQuery();
				//오라클이 반환해준 ResultSet의 갯수만큼 반복한다.
				while(rs.next()) {
					//하나의 레코드를 DTO객체에 저장하기 위해 새로운 객체생성
					BoardDTO dto = new BoardDTO();
					//setter()메소드를 사용하여 데이터 컬럼에 데이터 저장
					dto.setNum(rs.getString(1));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString(3));
					dto.setPostdate(rs.getDate("postdate"));
					dto.setId(rs.getString("id"));
					dto.setVisitcount(rs.getString(6));
					
					//저장된 DTO객체를 List컬렉션에 추가
					bbs.add(dto);
					
				}
			} catch (Exception e) {
				System.out.println("Select시 예외발생");
				e.printStackTrace();
			}
			return bbs;
		}
		//게시판 리스트 페이징 처리 추가 메소드 
		public List<BoardDTO> selectListPage(Map<String, Object> map){
			
			List<BoardDTO> bbs = new Vector<BoardDTO>();
		
				String query =" select * FROM board WHERE bname='"+map.get("bname")+"' ";
				if(map.get("Word")!= null)
				{
					query += " AND "+ map.get("Column")+ " "
							+ " LIKE '%"+map.get("Word")+"%' "; 
				}
				query += " "
						+ "		ORDER BY num DESC LIMIT ?,?";   //limit는 반드시 숫자로 표시해야한다.
				
			try {
				
				
				psmt = con.prepareStatement(query);
				
				//JSP에서 계산한 페이지 범위값을 이용해 인파라미터를 설정함.
				/*
				 setString()으로 인파라미터를 설정하면 문자형이 되므로 
				 여기서는 setInt()를 통해 정수 형태로 설정해야 한다.
				 * */
				psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
				psmt.setInt(2, Integer.parseInt(map.get("end").toString()));				
				
				rs =psmt.executeQuery();
				
				//오라클이 반환해준 ResultSet의 갯수만큼 반복한다.
				while(rs.next()) {
					
					//하나의 레코드를 DTO객체에 저장하기 위해 새로운 객체생성
					BoardDTO dto = new BoardDTO();
					//setter()메소드를 사용하여 데이터 컬럼에 데이터 저장
					dto.setNum(rs.getString("num"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setPostdate(rs.getDate("postdate"));
					dto.setId(rs.getString("id"));
					dto.setVisitcount(rs.getString("visitcount"));
					dto.setOfile(rs.getString("ofile"));
					dto.setSfile(rs.getString("sfile"));
					
					//저장된 DTO객체를 List컬렉션에 추가
					bbs.add(dto);
					
				}
			} catch (Exception e) {
				System.out.println("Select시 예외발생");
				e.printStackTrace();
			}
			return bbs;
		}
		
		public List<BoardDTO> selectListMain(String bname, int num1, int num2){
			
			List<BoardDTO> bbs = new Vector<BoardDTO>();
		
				String query =" select * FROM board WHERE bname='"+bname+"' "
						+ "	ORDER BY num DESC LIMIT ?,?";   //limit는 반드시 숫자로 표시해야한다.
				
			try {
				
				
				psmt = con.prepareStatement(query);
				
				//JSP에서 계산한 페이지 범위값을 이용해 인파라미터를 설정함.
				/*
				 setString()으로 인파라미터를 설정하면 문자형이 되므로 
				 여기서는 setInt()를 통해 정수 형태로 설정해야 한다.
				 * */
				psmt.setInt(1, num1);
				psmt.setInt(2, num2);				
				
				rs =psmt.executeQuery();
				
				//오라클이 반환해준 ResultSet의 갯수만큼 반복한다.
				while(rs.next()) {
					
					//하나의 레코드를 DTO객체에 저장하기 위해 새로운 객체생성
					BoardDTO dto = new BoardDTO();
					//setter()메소드를 사용하여 데이터 컬럼에 데이터 저장
					dto.setNum(rs.getString("num"));
					dto.setTitle(rs.getString("title"));
					dto.setPostdate(rs.getDate("postdate"));
					dto.setSfile(rs.getString("sfile"));
					
					//저장된 DTO객체를 List컬렉션에 추가
					bbs.add(dto);
					
				}
			} catch (Exception e) {
				System.out.println("Select시 예외발생");
				e.printStackTrace();
			}
			return bbs;
		}
		
		
		//게시물 수정하기
		public int updateEdit(BoardDTO dto) {
			int affected=0;
			try {
				String query ="UPDATE board set "
						+ " title=?, content=? "
						+ " where num=?";
				psmt = con.prepareStatement(query);
				psmt.setString(1,dto.getTitle());
				psmt.setString(2,dto.getContent());
				psmt.setString(3,dto.getNum());
				
				affected = psmt.executeUpdate();
						
			} catch (Exception e) {
				System.out.println("update중 예외발생");
				e.printStackTrace();
			}
			
			return affected;
		}
		
		
		
	//게시물 삭제 처리
	public int delete(BoardDTO dto) {
		int affected =0;
		try {
			String query ="delete from board where num=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			
			affected = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("delete중 예외발생");
			e.printStackTrace();
		}
		return affected;
	}
	
	public int myfileInsert(BoardDTO dto) {
		int affected = 0;
		try {
			String query = "INSERT INTO Board( "
					+" title, content, id, bname, ofile, sfile) "
					+" VALUES ( "
					+" ?, ?, ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			psmt.setString(4, dto.getBname());
			psmt.setString(5, dto.getOfile());
			psmt.setString(6, dto.getSfile());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("insert 중 예외 발생");
			e.printStackTrace();
		}
		return affected;
	}
	
	public int myfileUpdate(BoardDTO dto) {
		
		int affected = 0;
		try {
			String query = "UPDATE board set "
					+ " title=?, content=?, ofile=?, sfile=?"
					+ " where num=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getOfile());
			psmt.setString(4, dto.getSfile());
			psmt.setString(5, dto.getNum());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("insert 중 예외 발생");
			e.printStackTrace();
		}
		return affected;
	}
	
	public List<BoardDTO> progSelect(String progdate) {
		
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		String query =" select * FROM board WHERE progdate='"+progdate+"' ";
		
		try {
			
			
			psmt = con.prepareStatement(query);
			
			//JSP에서 계산한 페이지 범위값을 이용해 인파라미터를 설정함.
			/*
			 setString()으로 인파라미터를 설정하면 문자형이 되므로 
			 여기서는 setInt()를 통해 정수 형태로 설정해야 한다.
			 * */		
			
			rs =psmt.executeQuery();
			
			//오라클이 반환해준 ResultSet의 갯수만큼 반복한다.
			while(rs.next()) {
				
				//하나의 레코드를 DTO객체에 저장하기 위해 새로운 객체생성
				BoardDTO dto = new BoardDTO();
				//setter()메소드를 사용하여 데이터 컬럼에 데이터 저장
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setProgdate(rs.getString("progdate"));
				
				//저장된 DTO객체를 List컬렉션에 추가
				bbs.add(dto);
				
			}
		} catch (Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		return bbs;
		
	}
	
	//DB자원해제 
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(rs!=null) rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("자원반납시 예외발생");
		}
	}
	
	
	
}
