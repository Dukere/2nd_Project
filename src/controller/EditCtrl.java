package controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.BoardDAO;
import model.BoardDTO;

public class EditCtrl extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//일련번호를 파라미터로 가져옴
		String num = req.getParameter("num");
		
		//서블릿에서 application 내장객체를 얻어오기 위해 메소드 호출
		ServletContext app = this.getServletContext();
		BoardDAO dao = new BoardDAO(app);
		
		//일련번호에 해당하는 게시물 가져오기
		BoardDTO dto = dao.selectView(num);
		req.setAttribute("dto", dto);
		
		req.getRequestDispatcher("/community/ComEdit.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");

		BoardDTO dto = new BoardDTO();
		
		ServletContext app = this.getServletContext();

		String saveDirectory = app.getRealPath("/Upload");
		
		String num = null;
		String bname= null;
		String realFileName=null;

		File oldFile= null;
		File newFile= null;
		
		//첨부파일 업로드
		MultipartRequest mr =  new MultipartRequest(req,
				saveDirectory,
				1024 * 5000,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		int sucOrFail;
		
		//MultipartRequest객체가 정상적으로 생성되면 나머지 폼 값을 받아온다.
		if(mr != null) {
			num = mr.getParameter("num");
			
			//수정 처리 후 상세 보기로 이동하므로 영역에 속성을 저장한다.
			bname = mr.getParameter("bname");
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			String sfile = mr.getParameter("sfile");
			String ofile = mr.getParameter("ofile");

			/*
			 만약 수정폼에서 첨부한 파일이 있다면 기존파일은 삭제해야 하고,
			 확인 후 만약 없다면 기존파일명으로 유지한다.
			 */
			if(mr.getParameter("file")!=""){
			String filename =mr.getFilesystemName("file");
			String nowTime = new SimpleDateFormat("yyyy_MM_dd_H_m_s_S").format(new Date());
			int idx=-1;
			
			idx=filename.lastIndexOf(".");
			realFileName = nowTime + filename.substring(idx, filename.length());
			
			oldFile = new File(saveDirectory+oldFile.separator+filename);
			newFile = new File(saveDirectory+oldFile.separator+realFileName);

			oldFile.renameTo(newFile);
			
			dto.setSfile(realFileName);
			dto.setOfile(mr.getOriginalFileName("file"));
			
			}
			
			//폼값을 DTO객체에 저장
			dto.setContent(content);
			dto.setTitle(title);
			dto.setNum(num);
			dto.setBname(bname);
			
			//DB처리(update)
			BoardDAO dao = new BoardDAO(app);
			sucOrFail = dao.myfileUpdate(dto);

			
			/*
			 레코드의 update가 성공이고 동시에 새로운 파일을 업로드 
			 완료했다면 기존의 파일은 삭제 처리한다.
			 첨부한 파일이 없다면 기존파일은 유지된다.
			 */
			if(sucOrFail==1 && mr.getFilesystemName("file")!=null) {
				File f = new File(saveDirectory+File.separator+realFileName);
				
				//만약 해당경로에 파일이 존재한다면 삭제처리 
				if(f.exists()) {
					f.delete();
				}
				
			}
			
			dao.close();
		}
		else {
			//MultipartRequest객체가 생성되지 않았다면 파일업로드 실패로 처리
			sucOrFail = -1;
		}
		//리퀘스트 영역에 메세지 출력을 위한 저장
		req.setAttribute("SUC_FAIL", sucOrFail);
		req.setAttribute("WHEREIS", "UPDATE");
		
		req.getRequestDispatcher("/community/Message.jsp?bname="+bname+"&num="+num).forward(req,resp);
	}
	
}
