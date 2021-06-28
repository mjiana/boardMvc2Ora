package my.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.board.BoardDBBean;
import my.board.BoardDataBean;

public class DeleteProAction implements CommandAction {
	//오버라이딩
		public String requestPro(HttpServletRequest request, HttpServletResponse response) 
				throws Throwable{
			request.setCharacterEncoding("euc-kr");
			
			int num = Integer.parseInt(request.getParameter("num"));
			String pageNum = request.getParameter("pageNum");
			String passwd = request.getParameter("passwd");
			
			BoardDBBean dbPro = BoardDBBean.getInstance();
			int check = dbPro.deleteArticle(num, passwd);
			
			//해당 뷰에서 사용할 속성
			request.setAttribute("pageNum", new Integer(pageNum));
			request.setAttribute("check", check);
			
			return "deletePro.jsp";			
		}
}
