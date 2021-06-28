package my.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.board.BoardDBBean;
import my.board.BoardDataBean;

public class WriteProAction implements CommandAction{
	//������
	public String requestPro(
			HttpServletRequest request, HttpServletResponse response) throws Throwable{
		
		request.setCharacterEncoding("euc-kr");
		
		BoardDataBean article = new BoardDataBean();
		article.setNum(Integer.parseInt(request.getParameter("num")));
		article.setWriter(request.getParameter("writer"));
		article.setEmail(request.getParameter("email"));
		article.setSubject(request.getParameter("subject"));
		article.setPasswd(request.getParameter("passwd"));
		article.setReg_date(new Timestamp(System.currentTimeMillis()));
		article.setRef(Integer.parseInt(request.getParameter("ref")));
		article.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		article.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		article.setContent(request.getParameter("content"));
		article.setIp(request.getRemoteAddr());
		
		/* request.getRemoteAddr()�� ���� 0:0:0:0:0:0:0:1�� ����� �� �������
		 * 1. ��Ĺ ���� ����Ŭ��
		 * 2. ���� Genaral Information �ϴ��� Open launch configuration ��ũ Ŭ��
		 * 3. Argument������ �̵�
		 * 4. VM arguments�� ������ ���� ���뿡�� ���ο� �ٷ� �̵�(����)
		 * 5. -Djava.net.preferIPv4Stack=true �Է�
		 * 6. Apply�� OK��ư Ŭ�� �� ���� �簡��
		 * 7. IP �����Է� Ȯ��
		 */
		
		BoardDBBean dbPro = BoardDBBean.getInstance();
		dbPro.insertArticle(article);
		
		return "writePro.jsp";
	}
}
