package my.board;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class boardDBBean {
	//�̱��� �۾� : �ν��Ͻ� ��ü�� �Ѱ��� �����.
	private static boardDBBean instance = new boardDBBean();
	
	public static boardDBBean getInstance() {
		return instance;
	}
	
	//������ �ʴ� �⺻�����ڴ� �������� ���� ������ �����ϴ� ���� ����.
	//���⼭�� ���ο����� �⺻�����ڸ� �����ϹǷ�
	private boardDBBean() { }
	
	public Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/oracle");
		
		return ds.getConnection();
	}
	
}
