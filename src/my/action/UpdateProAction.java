package my.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.board.BoardDBBean;
import my.board.BoardDataBean;

public class UpdateProAction implements CommandAction {
	//오버라이딩
		public String requestPro(HttpServletRequest request, HttpServletResponse response) 
				throws Throwable{
			request.setCharacterEncoding("euc-kr");
			
			String pageNum = request.getParameter("pageNum");
			
			BoardDataBean article = new BoardDataBean();
			article.setNum(Integer.parseInt(request.getParameter("num")));
			article.setWriter(request.getParameter("writer"));
			article.setEmail(request.getParameter("email"));
			article.setSubject(request.getParameter("subject"));
			article.setPasswd(request.getParameter("passwd"));
			article.setContent(request.getParameter("content"));
			
			BoardDBBean dbPro = BoardDBBean.getInstance();
			int check = dbPro.updateArticle(article);
			
			//해당 뷰에서 사용할 속성
			request.setAttribute("pageNum", new Integer(pageNum));
			request.setAttribute("check", check);
			
			return "updatePro.jsp";			
		}
}
