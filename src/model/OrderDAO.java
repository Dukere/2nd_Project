package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

public class OrderDAO {
	
	Connection  con;
	PreparedStatement psmt;
	ResultSet rs;

	public OrderDAO(ServletContext ctx) {
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
	
	public int insertOrder(OrderDTO dto) {
		int affected =0;
		try {
			String query= "INSERT INTO shop_ordering("
					+ " id,oname,ozip,oaddr,oextraaddr, omobile, oemail, sname,szip,saddr,sextraaddr, smobile, semail, ordering,total,payment) "
					+ " VALUES ( "
					+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?)";
				
			psmt = con.prepareStatement(query);
			psmt.setString(1,  dto.getId());
			psmt.setString(2,  dto.getOname());
			psmt.setString(3,  dto.getOzip());
			psmt.setString(4,  dto.getOaddr());
			psmt.setString(5,  dto.getOextraaddr());
			psmt.setString(6,  dto.getOmobile());
			psmt.setString(7,  dto.getOemail());
			psmt.setString(8,  dto.getSname());
			psmt.setString(9,  dto.getSzip());
			psmt.setString(10,  dto.getSaddr());
			psmt.setString(11,  dto.getSextraaddr());
			psmt.setString(12,  dto.getSmobile());
			psmt.setString(13,  dto.getSemail());
			psmt.setString(14,  dto.getOrdering());
			psmt.setString(15,  dto.getTotal());
			psmt.setString(16,  dto.getPayment());
			
			affected =psmt.executeUpdate();
			System.out.println(query);
		} catch (Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		return affected;
				
	}
	public int getTotalRecordCountOrder() {

		//게시물의 수는 0으로 초기화
		int totalCount =0;
		//기본처리문(전체레코드를 대상으로 함)
		String query = "SELECT COUNT(*) FROM shop_ordering ";
			
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
	
public List<OrderDTO> selectListPageOrder(Map<String, Object> map){
		
		List<OrderDTO> bbs = new Vector<OrderDTO>();
	
			String query =" select * FROM shop_ordering "
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
				OrderDTO dto = new OrderDTO();
				//setter()메소드를 사용하여 데이터 컬럼에 데이터 저장
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setOname(rs.getString("oname"));
				dto.setOmobile(rs.getString("omobile"));
				dto.setOemail(rs.getString("oemail"));
				
				//저장된 DTO객체를 List컬렉션에 추가
				bbs.add(dto);
				
			}
		} catch (Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		return bbs;
	}

public OrderDTO selectViewOrder(String num) {
	
	OrderDTO dto = new OrderDTO();
	
	String query = "SELECT * " + 
			" FROM shop_ordering " + 
			" WHERE num =? ";
	
	try {
		psmt = con.prepareStatement(query);
		psmt.setString(1, num);
		rs = psmt.executeQuery();
		if(rs.next()) {
			dto.setNum(rs.getString(1));
			dto.setId(rs.getString(2));
			dto.setOname(rs.getString(3));
			dto.setOzip(rs.getString(4));
			dto.setOaddr(rs.getString(5));
			dto.setOextraaddr(rs.getString(6));
			dto.setOmobile(rs.getString(7));
			dto.setOemail(rs.getString(8));
			dto.setSname(rs.getString(9));
			dto.setSzip(rs.getString(10));
			dto.setSaddr(rs.getString(11));
			dto.setSextraaddr(rs.getString(12));
			dto.setSmobile(rs.getString(13));
			dto.setSemail(rs.getString(14));
			dto.setOrdering(rs.getString(15));
			dto.setTotal(rs.getString(16));
			dto.setPayment(rs.getString(17));
		}
		
	} catch (Exception e) {
		System.out.println("상세보기시 예외발생");
		e.printStackTrace();
	}
	return dto;	
}

public int deleteOrder(OrderDTO dto) {
	int affected =0;
	try {
		String query ="delete from shop_ordering where num=?";
		
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
