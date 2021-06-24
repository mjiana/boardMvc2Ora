package my.board;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class boardDBBean {
	//싱글톤 작업 : 인스턴스 객체는 한개만 만든다.
	private static boardDBBean instance = new boardDBBean();
	
	public static boardDBBean getInstance() {
		return instance;
	}
	
	//사용되지 않는 기본생성자는 안정성과 보안 때문에 삭제하는 것이 좋다.
	//여기서는 내부에서만 기본생성자를 참조하므로
	private boardDBBean() { }
	
	public Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/oracle");
		
		return ds.getConnection();
	}
	
}
