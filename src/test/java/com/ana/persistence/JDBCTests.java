package com.ana.persistence;

import static org.junit.Assert.fail;
import java.sql.Connection;
import java.sql.DriverManager;
import org.junit.Test;
import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testConnection() {

		try (Connection con = DriverManager.getConnection("jdbc:log4jdbc:oracle:thin:@hanokay.cvgigvuis47p.ap-northeast-2.rds.amazonaws.com:1521:hanokay", "admin",
				"dlth126!")) {

			log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}

}
