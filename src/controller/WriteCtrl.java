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
import com.oreilly.servlet.multipart.FileRenamePolicy;

import model.BoardDAO;
import model.BoardDTO;

public class WriteCtrl extends HttpServlet {
	/*
	 * 글쓰기 페이지의 경우 doGet() 메소드는 글쓰기 폼으로 이동할때의 요청을 처리하고 doPost() 메소드는 글쓰기를 완료할 때의 요청을
	 * 처리한다.
	 */

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 글쓰기 페이지로 진입시에는 JSP와 매핑만 해주면 된다.
		req.getRequestDispatcher("/community/ComWrite.jsp").forward(req, resp);
	}

	// 게시물 내용 작성후 submit했을때의 요청을 처리함
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ServletContext app = this.getServletContext();
		// 글쓰기 관련 폼값에 대한 한글처리
		req.setCharacterEncoding("UTF-8");

		File oldFile = null;
		String bname= null;
		File newFile = null;
		String realFileName = null;

		String saveDirectory = app.getRealPath("/Upload");

		int maxPostSize = 1024 * 5000;
		
		String encoding = "UTF-8";
		
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		int sucOrFail;
		
		MultipartRequest mr = new MultipartRequest(req, saveDirectory, maxPostSize,
				encoding, policy);

		if (mr != null) {

			if(mr.getFilesystemName("file")!=null){ 
			String filename = mr.getFilesystemName("file");
			String nowTime = new SimpleDateFormat("yyyy_MM_dd_H_m_s_S").format(new Date());

			int idx = -1;

			idx = filename.lastIndexOf(".");
			realFileName = nowTime + filename.substring(idx, filename.length());

			oldFile = new File(saveDirectory + oldFile.separator + filename);
			newFile = new File(saveDirectory + oldFile.separator + realFileName);

			oldFile.renameTo(newFile);
			}
			bname = mr.getParameter("bname");
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			String id = mr.getParameter("id");

			// 서버에 저장된 실제파일명을 가져온다.

			// DTO객체에 폼값을 저장한다.
			BoardDTO dto = new BoardDTO();
			dto.setContent(content);
			dto.setTitle(title);
			dto.setId(id);
			dto.setBname(bname);
			if(mr.getFilesystemName("file")!=null){
			dto.setOfile(mr.getOriginalFileName("file"));
			dto.setSfile(realFileName);
			}
			// DAO객체 생성 및 DB연결 .. insert 처리
			BoardDAO dao = new BoardDAO(app);
			sucOrFail = dao.myfileInsert(dto);
			dao.close();
		} else {
			// mr객체가 생성되지 않았을때(업로드 실패시)
			sucOrFail = -1;
		}

		if (sucOrFail == 1) {
			// 파일 업로드 성공 및 글쓰기처리 성공일때
			resp.sendRedirect("../community/ComList?bname="+bname);
		} else {
			// 나머지는 실패로 처리한다. 실패시 글쓰기페이지로 돌아간다.
			req.getRequestDispatcher("/community/ComWrite.jsp?bname="+bname).forward(req, resp);
		}

	}

}