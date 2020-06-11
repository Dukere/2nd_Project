package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

public class requestDAO {
	
	Connection  con;
	PreparedStatement psmt;
	ResultSet rs;
	
	public requestDAO(ServletContext ctx) {
		
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
	
	public int orderBlue(blueDTO dto) {
		int affected =0;
		try {
			String query= "INSERT INTO request_form_blue("
					+ " name,addr,tel,mobile, email, cleantype, area, id, cleandate, receipt, memo) "
					+ " VALUES ( "
					+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				
			psmt = con.prepareStatement(query);
			psmt.setString(1,  dto.getName());
			psmt.setString(2,  dto.getAddr());
			psmt.setString(3,  dto.getTel());
			psmt.setString(4,  dto.getMobile());
			psmt.setString(5,  dto.getEmail());
			psmt.setString(6,  dto.getCleantype());
			psmt.setString(7,  dto.getArea());
			psmt.setString(8,  dto.getId());
			psmt.setString(9,  dto.getCleandate());
			psmt.setString(10,  dto.getReceipt());
			psmt.setString(11,  dto.getMemo());
			
			affected =psmt.executeUpdate();
			System.out.println(query);
		} catch (Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		return affected;
				
	}
	
	public int orderExp(ExpDTO dto) {
		int affected =0;
		try {
			String query= "INSERT INTO request_form_exp("
					+ " name, disabled, disabledtype, equip, equipname, tel, mobile, email, cakeexp, cookieexp, id, expdate, receipt, memo) "
					+ " VALUES ( "
					+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1,  dto.getName());
			psmt.setString(2,  dto.getDisabled());
			psmt.setString(3,  dto.getDisabledtype());
			psmt.setString(4,  dto.getEquip());
			psmt.setString(5,  dto.getEquipname());
			psmt.setString(6,  dto.getTel());
			psmt.setString(7,  dto.getMobile());
			psmt.setString(8,  dto.getEmail());
			psmt.setString(9,  dto.getCakeexp());
			psmt.setString(10,  dto.getCookieexp());
			psmt.setString(11,  dto.getId());
			psmt.setString(12,  dto.getExpdate());
			psmt.setString(13,  dto.getReceipt());
			psmt.setString(14,  dto.getMemo());
			
			affected =psmt.executeUpdate();
			System.out.println(query);
		} catch (Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		return affected;
		
	}
	
	public int getTotalRecordCountBlue() {

		//게시물의 수는 0으로 초기화
		int totalCount =0;
		//기본처리문(전체레코드를 대상으로 함)
		String query = "SELECT COUNT(*) FROM request_form_blue ";
			
		//JSP페이지에서 검색어를 입력한 경우where절이 동적으로 추가됨.
		
		try {
			psmt= con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
		}
		return totalCount;
	}
	
	public int getTotalRecordCountExp() {
		
		//게시물의 수는 0으로 초기화
		int totalCount =0;
		//기본처리문(전체레코드를 대상으로 함)
		String query = "SELECT COUNT(*) FROM request_form_exp ";
		
		//JSP페이지에서 검색어를 입력한 경우where절이 동적으로 추가됨.
		
		try {
			psmt= con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
		}
		return totalCount;
	}
	
	public List<blueDTO> selectListPageBlue(Map<String, Object> map){
		
		List<blueDTO> bbs = new Vector<blueDTO>();
	
			String query =" select * FROM request_form_blue "
					+ "	ORDER BY num DESC LIMIT ?,?";   //limit는 반드시 숫자로 표시해야한다.
			
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
				blueDTO dto = new blueDTO();
				//setter()메소드를 사용하여 데이터 컬럼에 데이터 저장
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setMobile(rs.getString("mobile"));
				dto.setCleandate(rs.getString("cleandate"));
				dto.setId(rs.getString("id"));
				
				//저장된 DTO객체를 List컬렉션에 추가
				bbs.add(dto);
				
			}
		} catch (Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		return bbs;
	}
	
	public List<ExpDTO> selectListPageExp(Map<String, Object> map){
		
		List<ExpDTO> bbs = new Vector<ExpDTO>();
		
		String query =" select * FROM request_form_exp "
				+ "	ORDER BY num DESC LIMIT ?,?";   //limit는 반드시 숫자로 표시해야한다.
		
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
				ExpDTO dto = new ExpDTO();
				//setter()메소드를 사용하여 데이터 컬럼에 데이터 저장
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setMobile(rs.getString("mobile"));
				dto.setExpdate(rs.getString("expdate"));
				dto.setId(rs.getString("id"));
				
				//저장된 DTO객체를 List컬렉션에 추가
				bbs.add(dto);
				
			}
		} catch (Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		return bbs;
	}
	
	public blueDTO selectViewBlue(String num) {
		
		blueDTO dto = new blueDTO();
		
		String query = "SELECT * " + 
				" FROM request_form_blue " + 
				" WHERE num =? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setAddr(rs.getString(3));
				dto.setTel(rs.getString(4));
				dto.setMobile(rs.getString(5));
				dto.setEmail(rs.getString(6));
				dto.setCleantype(rs.getString(7));
				dto.setArea(rs.getString(8));
				dto.setPostdate(rs.getDate(9));
				dto.setId(rs.getString(10));
				dto.setCleandate(rs.getString(11));
				dto.setReceipt(rs.getString(12));
				dto.setMemo(rs.getString(13));
			}
			
		} catch (Exception e) {
			System.out.println("상세보기시 예외발생");
			e.printStackTrace();
		}
		return dto;	
	}
	
	public ExpDTO selectViewExp(String num) {
		
		ExpDTO dto = new ExpDTO();
		
		String query = "SELECT * " + 
				" FROM request_form_exp " + 
				" WHERE num =? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setDisabled(rs.getString(3));
				dto.setDisabledtype(rs.getString(4));
				dto.setEquip(rs.getString(5));
				dto.setEquipname(rs.getString(6));
				dto.setTel(rs.getString(7));
				dto.setMobile(rs.getString(8));
				dto.setEmail(rs.getString(9));
				dto.setCakeexp(rs.getString(10));
				dto.setCookieexp(rs.getString(11));
				dto.setPostdate(rs.getDate(12));
				dto.setId(rs.getString(13));
				dto.setExpdate(rs.getString(14));
				dto.setReceipt(rs.getString(15));
				dto.setMemo(rs.getString(16));
			}
			
		} catch (Exception e) {
			System.out.println("상세보기시 예외발생");
			e.printStackTrace();
		}
		return dto;	
	}
	
	public int deleteBlue(blueDTO dto) {
		int affected =0;
		try {
			String query ="delete from request_form_blue where num=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			
			affected = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("delete중 예외발생");
			e.printStackTrace();
		}
		return affected;
	}
	
	public int deleteExp(ExpDTO dto) {
		int affected =0;
		try {
			String query ="delete from request_form_exp where num=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			
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
