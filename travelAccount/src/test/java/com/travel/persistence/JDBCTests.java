package com.travel.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	
	static {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch(Exception e) {
			e.getStackTrace();
		}
	}
	
	@Test
	public void test() {
		try(Connection con = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:XE", 
				"travel_ssy", 
				"travel_ssy"
				)){
			log.info(con);
			
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
}
