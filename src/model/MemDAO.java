package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

public class MemDAO {

	Connection  con;
	PreparedStatement psmt;
	ResultSet rs;
	
	
	
	public MemDAO(ServletContext ctx) {
		try {
			Class.forName(ctx.getInitParameter("MariaJDBCDriver"));
			String id = "j941223";
			String pw = "ejrfo123";
			con = DriverManager.getConnection(ctx.getInitParameter("MariaConnectURL"), id, pw);
			System.out.println("DB연결성공");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("연결실패");
		}
	}
	
	public int insertMemDTO(MemDTO dto) {
		int affected =0;
		try {
			String query= "INSERT INTO membership("
					+ " name,id,pass,tel,mobile, email, openemail, zip, addr, extraaddr) "
					+ " VALUES ( "
					+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				
			psmt = con.prepareStatement(query);
			psmt.setString(1,  dto.getName());
			psmt.setString(2,  dto.getId());
			psmt.setString(3,  dto.getPass());
			psmt.setString(4,  dto.getTel());
			psmt.setString(5,  dto.getMobile());
			psmt.setString(6,  dto.getEmail());
			psmt.setString(7,  dto.getOpenemail());
			psmt.setString(8,  dto.getZip());
			psmt.setString(9,  dto.getAddr());
			psmt.setString(10,  dto.getExtraaddr());
			
			affected =psmt.executeUpdate();
			System.out.println(query);
		} catch (Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		return affected;
				
	}
	
	//로그인 처리
	public MemDTO getMemDTO(String uid, String upass) {
		//DTO객체를 생성한다.
		MemDTO dto = new MemDTO();
		//쿼리문을 작성  
		String query ="SELECT id, pass, name, auth FROM " //*를 써도됌 
				+ " membership WHERE id=? AND pass=?";
	
		try {
			//prepared 객체 생성 
			psmt=con.prepareStatement(query);
			//쿼리문의 인파라미터 설정
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			//오라클로 쿼리문 전송 및 결과셋(ResultSet) 반환받음
			rs= psmt.executeQuery();
			
			//오라클이 반환해준 ResultSet이 있는지 확인 
			if(rs.next()) {
				//true를 반환했다면 결과셋 있음. 
				//DTO객체에 회원 레코드의 값을 저장한다. 
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setAuth(rs.getString("auth"));
				
			}else {
				//false를 반환했따면 결과셋 없음. 
				System.out.println("결과셋이 없습니다.");
			}
			
		} catch (Exception e) {
			System.out.println("getMemDTO오류");
			e.printStackTrace();
		}
		
		//DTO객체를 반환한다.
		return dto;
	}
	
	//아이디 중복체크 확인용
	public MemDTO getMemDTO(String uid) {
		//DTO객체를 생성한다.
		MemDTO dto = new MemDTO();
		//쿼리문을 작성  
		String query ="SELECT id FROM " //*를 써도됌 
				+ " membership WHERE id=?";
	
		try {
			//prepared 객체 생성 
			psmt=con.prepareStatement(query);
			//쿼리문의 인파라미터 설정
			psmt.setString(1, uid);
			//오라클로 쿼리문 전송 및 결과셋(ResultSet) 반환받음
			rs= psmt.executeQuery();
			
			//오라클이 반환해준 ResultSet이 있는지 확인 
			if(rs.next()) {
				//true를 반환했다면 결과셋 있음. 
				//DTO객체에 회원 레코드의 값을 저장한다. 
				dto.setId(rs.getString("id"));
				
			}else {
				//false를 반환했따면 결과셋 없음. 
				System.out.println("결과셋이 없습니다.");
			}
			
		} catch (Exception e) {
			System.out.println("getMemDTO오류");
			e.printStackTrace();
		}
		
		//DTO객체를 반환한다.
		return dto;
	}
	
	//아이디 찾기용
	public String getId(String name, String email) {
		//DTO객체를 생성한다.
		
		String id =null;
		//쿼리문을 작성  
		String query ="SELECT id FROM " //*를 써도됌 
				+ " membership WHERE name=? AND email=?";
	
		try {
			//prepared 객체 생성 
			psmt=con.prepareStatement(query);
			//쿼리문의 인파라미터 설정
			psmt.setString(1, name);
			psmt.setString(2, email);
			//오라클로 쿼리문 전송 및 결과셋(ResultSet) 반환받음
			rs= psmt.executeQuery();
			
			//오라클이 반환해준 ResultSet이 있는지 확인 
			if(rs.next()) {
				//true를 반환했다면 결과셋 있음. 
				//DTO객체에 회원 레코드의 값을 저장한다. 
				id =rs.getString("id");
				
			}else {
				//false를 반환했따면 결과셋 없음. 
				System.out.println("결과셋이 없습니다.");
			}
			
		} catch (Exception e) {
			System.out.println("getMemDTO오류");
			e.printStackTrace();
		}
		
		//DTO객체를 반환한다.
		return id;
	}
	
	//비밀번호 찾기
	public String getPass(String id, String name, String email) {
		
		String query ="SELECT pass FROM " //*를 써도됌 
				+ " membership WHERE id=? AND name=? AND email=?";
	
		String pass = null;
		try {
			//prepared 객체 생성 
			psmt=con.prepareStatement(query);
			//쿼리문의 인파라미터 설정
			psmt.setString(1, id);
			psmt.setString(2, name);
			psmt.setString(3, email);
			//오라클로 쿼리문 전송 및 결과셋(ResultSet) 반환받음
			rs= psmt.executeQuery();
			
			//오라클이 반환해준 ResultSet이 있는지 확인 
			if(rs.next()) {
				//true를 반환했다면 결과셋 있음. 
				//DTO객체에 회원 레코드의 값을 저장한다. 
				pass =rs.getString("pass");
				
			}else {
				//false를 반환했따면 결과셋 없음. 
				System.out.println("결과셋이 없습니다.");
			}
			
		} catch (Exception e) {
			System.out.println("getMemDTO오류");
			e.printStackTrace();
		}
		
		//DTO객체를 반환한다.
		return pass;
	}
	  
	public int getTotalRecordConunt(Map<String, Object> map) {

		//게시물의 수는 0으로 초기화
		int totalCount =0;
		//기본처리문(전체레코드를 대상으로 함)
		String query = "SELECT COUNT(*) FROM membership ";
			
		//JSP페이지에서 검색어를 입력한 경우where절이 동적으로 추가됨.
		if(map.get("Word")!=null) {
			query += " WHERE "+ map.get("Column")+" "
					+ " LIKE '%"+map.get("Word")+"%'";
		}
		System.out.println("query="+query);
		
		try {
			psmt= con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
		}
		return totalCount;
	}
	public List<MemDTO> selectList(Map<String, Object> map){
		
		List<MemDTO> mem = new Vector<MemDTO>();
		//기본쿼리문
		String query = "SELECT * FROM membership";
		//검색어가 있는경우 조건절 동적 추가 
		if(map.get("Word")!=null) {
			query += " WHERE "+ map.get("Column") + " "
					+ " LIKE '%" + map.get("Word")+"%'";
					
		}
		//최근게시물의 항상 위로 노출되야 하므로 작성된 순서의 역순으로 정렬한다.
		query += " ORDER BY regidate DESC";
		try {
			
			psmt = con.prepareStatement(query);
			rs =psmt.executeQuery();
			//오라클이 반환해준 ResultSet의 갯수만큼 반복한다.
			while(rs.next()) {
				//하나의 레코드를 DTO객체에 저장하기 위해 새로운 객체생성
				MemDTO dto = new MemDTO();
				//setter()메소드를 사용하여 데이터 컬럼에 데이터 저장
				dto.setName(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setPass(rs.getString(3));
				dto.setTel(rs.getString(4));
				dto.setMobile(rs.getString(5));
				dto.setEmail(rs.getString(6));
				dto.setOpenemail(rs.getString(7));
				dto.setAddr(rs.getString(8));
				dto.setRegidate(rs.getDate(9));
				dto.setAuth(rs.getString(10));
				
				//저장된 DTO객체를 List컬렉션에 추가
				mem.add(dto);
				
			}
		} catch (Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		return mem;
	}
	
	public List<MemDTO> selectListPage(Map<String, Object> map){
		
		List<MemDTO> mem = new Vector<MemDTO>();
	
			String query =" "
					+ " 	select * FROM membership ";
			if(map.get("Word")!= null)
			{
				query += " WHERE "+ map.get("Column")+ " "
						+ " LIKE '%"+map.get("Word")+"%' "; 
			}
			query += " "
					+ "		ORDER BY regidate DESC LIMIT ?,?";   //limit는 반드시 숫자로 표시해야한다.
			System.out.println("쿼리문:"+query);
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
				MemDTO dto = new MemDTO();
				//setter()메소드를 사용하여 데이터 컬럼에 데이터 저장
				dto.setName(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setPass(rs.getString(3));
				dto.setTel(rs.getString(4));
				dto.setMobile(rs.getString(5));
				dto.setEmail(rs.getString(6));
				dto.setOpenemail(rs.getString(7));
				dto.setZip(rs.getString(8));
				dto.setAddr(rs.getString(9));
				dto.setExtraaddr(rs.getString(10));
				dto.setRegidate(rs.getDate(11));
				dto.setAuth(rs.getString(12));
				
				//저장된 DTO객체를 List컬렉션에 추가
				mem.add(dto);
				
			}
		} catch (Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		return mem;
	}
	
	public MemDTO selectView(String id) {
		
		MemDTO dto = new MemDTO();
		//기존쿼리문: member테이블과 join없을댸...
//		String query = "SELECT * FROM board where num=?";
		
		//변경된쿼리문: member테이블과 join하여 사용자이름 가져옴.
		String query = "SELECT * " + 
				" FROM membership " + 
				" WHERE id =? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setName(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setPass(rs.getString(3));
				dto.setTel(rs.getString(4));
				dto.setMobile(rs.getString(5));
				dto.setEmail(rs.getString(6));
				dto.setOpenemail(rs.getString(7));
				dto.setZip(rs.getString(8));
				dto.setAddr(rs.getString(9));
				dto.setExtraaddr(rs.getString(10));
				dto.setRegidate(rs.getDate(11));
				dto.setAuth(rs.getString(12));
				//테이블join으로 컬럼추가 
			}
			
		} catch (Exception e) {
			System.out.println("상세보기시 예외발생");
			e.printStackTrace();
		}
		return dto;	
	}
	
	//회원 수정하기
			public int updateEdit(MemDTO dto) {
				int affected=0;
				try {
					String query ="UPDATE membership set "
							+ " name=?,pass=?,tel=?,mobile=?, email=?, openemail=?, auth=?, zip=?, addr=?, extraaddr=? "
							+ " where id=?";

					psmt = con.prepareStatement(query);
					psmt.setString(1,  dto.getName());
					psmt.setString(2,  dto.getPass());
					psmt.setString(3,  dto.getTel());
					psmt.setString(4,  dto.getMobile());
					psmt.setString(5,  dto.getEmail());
					psmt.setString(6,  dto.getOpenemail());
					psmt.setString(7,  dto.getAuth());
					psmt.setString(8,  dto.getZip());
					psmt.setString(9,  dto.getAddr());
					psmt.setString(10,  dto.getExtraaddr());
					psmt.setString(11,  dto.getId());
					
					affected = psmt.executeUpdate();
							
				} catch (Exception e) {
					System.out.println("update중 예외발생");
					e.printStackTrace();
				}
				
				return affected;
			}
			
			//회원 삭제
			public int delete(MemDTO dto) {
				int affected =0;
				try {
					String query ="delete from membership where id=?";
					
					psmt = con.prepareStatement(query);
					psmt.setString(1, dto.getId());
					
					affected = psmt.executeUpdate();
					
				} catch (Exception e) {
					System.out.println("delete중 예외발생");
					e.printStackTrace();
				}
				return affected;
			}		
	
	
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
