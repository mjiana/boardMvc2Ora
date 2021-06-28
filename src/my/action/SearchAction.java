package my.action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.board.BoardDBBean;

//글목록 처리
public class SearchAction implements CommandAction {
	public String requestPro(
			HttpServletRequest request, HttpServletResponse response) throws Throwable{
		
		request.setCharacterEncoding("euc-kr");
		
		String find = request.getParameter("find");
		String keyword = request.getParameter("keyword");
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) pageNum = "1";
		
		int pageSize = 10; //한 페이지당 표시되는 글 개수
		int currentPage = Integer.parseInt(pageNum);//현재 페이지
		int startRow = (currentPage-1) * pageSize + 1;//한 페이지의 시작 글번호
		int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
		int count = 0;
		int number = 0;
		
		List articleList = null;
		BoardDBBean dbPro = BoardDBBean.getInstance();
		//전체 글의 개수
		count = dbPro.searchArticleCount(find, keyword);
		
		//현재 페이지에 해당하는 글 목록
		if(count > 0) articleList = dbPro.searchArticles(startRow, endRow,find, keyword);
		else articleList = Collections.EMPTY_LIST;
		
		//글 목록에 표시할 글번호
		number = count - (currentPage-1) * pageSize;
		
		//해당 뷰에서 사용할 속성
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
		request.setAttribute("articleList", articleList);
		
		return "list.jsp";
	}
}
