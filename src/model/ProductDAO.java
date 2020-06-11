package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

public class ProductDAO {
	
	Connection  con;
	PreparedStatement psmt;
	ResultSet rs;
	
	public ProductDAO(ServletContext ctx) {
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
	
	public ProductDTO selectView(String num) {
		
		ProductDTO dto = new ProductDTO();
		
		String query = "SELECT * from shop_products " + 
				" WHERE num =? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setImage(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setPrice(rs.getInt(4));
				dto.setMileage(rs.getString(5));
			}
			
		} catch (Exception e) {
			System.out.println("상세보기시 예외발생");
			e.printStackTrace();
		}
		return dto;	
	}
	
	public int getTotalRecordCount() {

		//게시물의 수는 0으로 초기화
		int totalCount =0;
		//기본처리문(전체레코드를 대상으로 함)
		String query = "SELECT COUNT(*) FROM shop_products ";
		
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
		public List<ProductDTO> selectList(){
			
			List<ProductDTO> bbs = new Vector<ProductDTO>();
			//기본쿼리문
			String query = "SELECT * FROM shop_products";
			
			query += " ORDER BY num DESC";
			try {
				
				psmt = con.prepareStatement(query);
				rs =psmt.executeQuery();
				//오라클이 반환해준 ResultSet의 갯수만큼 반복한다.
				while(rs.next()) {
					//하나의 레코드를 DTO객체에 저장하기 위해 새로운 객체생성
					ProductDTO dto = new ProductDTO();
					//setter()메소드를 사용하여 데이터 컬럼에 데이터 저장
					dto.setNum(rs.getString(1));
					dto.setImage(rs.getString(2));
					dto.setName(rs.getString(3));
					dto.setPrice(rs.getInt(4));
					dto.setMileage(rs.getString(5));
					
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
		public List<ProductDTO> selectListPage(Map<String, Object> map){
			
			List<ProductDTO> bbs = new Vector<ProductDTO>();
		
				String query =" select * FROM shop_products "
						+ "	ORDER BY num DESC LIMIT ?,?" ;  
				
			try {
				
				psmt = con.prepareStatement(query);
				
				psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
				psmt.setInt(2, Integer.parseInt(map.get("end").toString()));				
				
				rs =psmt.executeQuery();
				
				while(rs.next()) {
					
					ProductDTO dto = new ProductDTO();
					dto.setNum(rs.getString(1));
					dto.setImage(rs.getString(2));
					dto.setName(rs.getString(3));
					dto.setPrice(rs.getInt(4));
					dto.setMileage(rs.getString(5));
					
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
