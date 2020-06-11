package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletContext;

public class BasketDAO {

	Connection con;
	PreparedStatement psmt;
	ResultSet rs;

	public BasketDAO(ServletContext ctx) {
		try {
			Class.forName(ctx.getInitParameter("MariaJDBCDriver"));
			String id = "j941223";
			String pw = "ejrfo123";
			con = DriverManager.getConnection(ctx.getInitParameter("MariaConnectURL"), id, pw);
			System.out.println("DB연결성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("연결실패");
		}
	}

	public int insertBasket(BasketDTO dto) {

		int affected = 0;
		
		try {
			
			String query= "INSERT INTO shop_basket("
					+ " num,id,qty,total) "
					+ " VALUES ( "
					+ " ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1,  dto.getNum());
			psmt.setString(2,  dto.getId());
			psmt.setInt(3,  dto.getQty());
			psmt.setInt(4,  dto.getTotal());
			
			affected = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("장바구니 예외발생");
			e.printStackTrace();
		}

		return affected;
	}
	
	public int deleteBasket(String id) {
		
		int affected = 0;
		
		try {
			
			String query= "delete from shop_basket "
					+ " where id = ? ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1,  id);
			
			affected = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("장바구니 제거 예외 발생");
			e.printStackTrace();
		}
		
		return affected;
	}
	
	public List<BasketDTO> selectList(String id){
		
		List<BasketDTO> bbs = new Vector<BasketDTO>();
		//기본쿼리문
		String query = "SELECT B.*, P.* " + 
				" FROM shop_products P INNER JOIN shop_basket B " + 
				" ON P.num=B.num " + 
				" WHERE id =? ";
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			//오라클이 반환해준 ResultSet의 갯수만큼 반복한다.
			while(rs.next()) {
				//하나의 레코드를 DTO객체에 저장하기 위해 새로운 객체생성
				BasketDTO dto = new BasketDTO();
				//setter()메소드를 사용하여 데이터 컬럼에 데이터 저장
				dto.setBasket_num(rs.getString(1));
				dto.setNum(rs.getString(2));
				dto.setId(rs.getString(3));
				dto.setQty(rs.getInt(4));
				dto.setTotal(rs.getInt(5));
				dto.setImage(rs.getString(7));
				dto.setName(rs.getString(8)); 
				dto.setPrice(rs.getInt(9));
				dto.setMileage(rs.getString(10));
				
				//저장된 DTO객체를 List컬렉션에 추가
				bbs.add(dto);
				
			}
		} catch (Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		return bbs;
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
