package my.action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.board.BoardDBBean;

//�۸�� ó��
public class SearchAction implements CommandAction {
	public String requestPro(
			HttpServletRequest request, HttpServletResponse response) throws Throwable{
		
		request.setCharacterEncoding("euc-kr");
		
		String find = request.getParameter("find");
		String keyword = request.getParameter("keyword");
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) pageNum = "1";
		
		int pageSize = 10; //�� �������� ǥ�õǴ� �� ����
		int currentPage = Integer.parseInt(pageNum);//���� ������
		int startRow = (currentPage-1) * pageSize + 1;//�� �������� ���� �۹�ȣ
		int endRow = currentPage * pageSize;//�� �������� ������ �۹�ȣ
		int count = 0;
		int number = 0;
		
		List articleList = null;
		BoardDBBean dbPro = BoardDBBean.getInstance();
		//��ü ���� ����
		count = dbPro.searchArticleCount(find, keyword);
		
		//���� �������� �ش��ϴ� �� ���
		if(count > 0) articleList = dbPro.searchArticles(startRow, endRow,find, keyword);
		else articleList = Collections.EMPTY_LIST;
		
		//�� ��Ͽ� ǥ���� �۹�ȣ
		number = count - (currentPage-1) * pageSize;
		
		//�ش� �信�� ����� �Ӽ�
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
