package com.helloBar;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class barDAO {
	Connection connection;

	public Connection getConnection() {
		try {
			String name = "root";
			String password = "mcrhenryh";
			String url = "jdbc:mysql://localhost:3306/computer";
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(url, name, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}

	public void setConnection(Connection connection) {
		this.connection = connection;
	}

	public List<barBean> listAll() {
		ArrayList<barBean> list = new ArrayList<barBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = this.getConnection().prepareStatement("SELECT * FROM bar");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				barBean bar = new barBean();
				bar.setName(rs.getString("name"));
				bar.setNum(rs.getInt("num"));
				list.add(bar);
				System.out.println("连接数据库成功");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

}
