package my.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.board.BoardDBBean;
import my.board.BoardDataBean;

public class WriteProAction implements CommandAction{
	//재정의
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
		
		/* request.getRemoteAddr()의 값이 0:0:0:0:0:0:0:1로 저장될 때 설정방법
		 * 1. 톰캣 서버 더블클릭
		 * 2. 왼쪽 Genaral Information 하단의 Open launch configuration 링크 클릭
		 * 3. Argument탭으로 이동
		 * 4. VM arguments에 기존에 적힌 내용에서 새로운 줄로 이동(엔터)
		 * 5. -Djava.net.preferIPv4Stack=true 입력
		 * 6. Apply와 OK버튼 클릭 후 서버 재가동
		 * 7. IP 정상입력 확인
		 */
		
		BoardDBBean dbPro = BoardDBBean.getInstance();
		dbPro.insertArticle(article);
		
		return "writePro.jsp";
	}
}
