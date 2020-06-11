package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;

public class DownloadCtrl extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");

		 //파일이 업로드된 디렉토리의 물리적 경로
		String root = req.getSession().getServletContext().getRealPath("/");
		String savePath = root + "Upload";
		
		String sfile = req.getParameter("sfile");
		String ofile = req.getParameter("ofile");
		String num = req.getParameter("num");
		ServletContext app = this.getServletContext();

		/*
		 서버에 저장된 파일을 무조건 '원본파일명.jpg'로 이름을 변경하며
		 다운로드한다. 차후 DB처리 해야 함.
		 */
		
		//스트림 및 파일객체 생성
		InputStream in = null;
		OutputStream os = null;
		File file = null;
		boolean skip = false;
		String client = "";
		
		try{
			file = new File(savePath, sfile);
			in = new FileInputStream(file);
		}
		catch(FileNotFoundException fe){
			skip = true;
		}

		client = req.getHeader("User-Agent");
		
		resp.reset() ;
		resp.setContentType("application/octet-stream");
		resp.setHeader("Content-Description", "JSP Generated Data");
		
		if(!skip){
			
			if(client.indexOf("MSIE") != -1){
				//웹브라우저의 종류가 익스플로러일 떄 한글 파일명 처리
				resp.setHeader ("Content-Disposition", "attachment; filename="+new String(ofile.getBytes("KSC5601"),"ISO8859_1"));
			}else{
				//익스플로러가 아닐 떄 한글 파일명 처리
				//다운로드 시 원본 파일명으로 변경할 때 이 부분을 사용함. 
				ofile = new String(ofile.getBytes("utf-8"),"iso-8859-1");
				resp.setHeader("Content-Disposition", "attachment; filename=\"" + ofile + "\"");
				resp.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
			} 
			 
			resp.setHeader ("Content-Length", ""+file.length() );
			
			//웹브라우저에 연결한 출력스트림 생성
			os = resp.getOutputStream();
			byte b[] = new byte[(int)file.length()];
			int leng = 0;
			
			//input스트림으로 파일 내용을 읽어와서 output스트림으로 웹브라우저에 출력함.
			//이 때 웹브라우저는 인식하지 못하므로 다운로드창을 통해 다운로드 시킴
			while( (leng = in.read(b)) > 0 ){
				os.write(b,0,leng);
			}
		}else{
			resp.setContentType("text/html;charset=UTF-8");
			System.out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
		}

		in.close();
		os.close();
	}

}
