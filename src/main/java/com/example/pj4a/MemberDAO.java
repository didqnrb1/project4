package com.example.pj4a;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class MemberDAO {

	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	private final String M_INSERT = "insert into member (userid, password, username, email, sex, detail)"
			+ " values (?,sha1(?),?,?,?,?)";
	private final String M_UPDATE = "update member set userid=?, password=?, username=?, email=?, sex=?, detail=? where sid=?";
	private final String M_DELETE = "delete from member  where sid=?";
	private final String M_GET = "select * from member  where sid=?";
	private final String M_LIST = "select * from member order by regdate desc";


	public int insertMember(MemberVO data) {
		int result = 0;
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(M_INSERT);
			stmt.setString(1, data.getUserid());
			stmt.setString(2, data.getPassword());
			stmt.setString(3, data.getUsername());
			stmt.setString(4, data.getEmail());
			stmt.setString(5, data.getsex());
			stmt.setString(6, data.getDetail());
			result = stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("failed");
			e.printStackTrace();
		}
		return result;
	}


	public void deleteMember(MemberVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_DELETE);
			stmt.setInt(1, vo.getSid());
			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("failed");
			e.printStackTrace();
		}
	}

	public int updateBoard(MemberVO vo) {
		System.out.println("MEM동작");

		try {
			conn = JDBCUtil.getConnection();
			System.out.println("Connection established");

			stmt = conn.prepareStatement(M_UPDATE);
			System.out.println("Statement created");

			stmt.setString(1, vo.getUserid());
			stmt.setString(2, vo.getPassword());
			stmt.setString(3, vo.getUsername());
			stmt.setString(4, vo.getEmail());
			stmt.setString(5, vo.getsex());
			stmt.setString(6, vo.getDetail());
			stmt.setInt(7, vo.getSid());
			System.out.println("Parameters set: " + vo.getUserid() + "-" + vo.getPassword() + "-" + vo.getUsername() + "-" + vo.getEmail() + "-" + vo.getDetail());

			System.out.println("Query: " + stmt.toString());

			int rowsAffected = stmt.executeUpdate();
			System.out.println(rowsAffected + " row(s) affected");

			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("failed");
		} finally {


		}
		return 0;
	}


	//dao 의 member중 하나를 가져오는 함수
	public MemberVO getMember(int sid) {
		MemberVO one = new MemberVO();
		System.out.println("===> JDBC로 getMember() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_GET);
			stmt.setInt(1, sid);
			rs = stmt.executeQuery();
			if (rs.next()) {
				one.setSid(rs.getInt("sid"));
				one.setUserid(rs.getString("userid"));
				one.setUsername(rs.getString("username"));
				one.setEmail(rs.getString("email"));
				one.setsex(rs.getString("sex"));
				one.setDetail(rs.getString("detail"));
				one.setRegdate(rs.getDate("regdate"));
			}
			rs.close();
		} catch (Exception e) {
			System.out.println("failed");
			e.printStackTrace();
		}
		return one;
	}

	//데이터 목록 페이지에서 출력
	public List<MemberVO> getList() {
		List<MemberVO> list = new ArrayList<>();
		conn = JDBCUtil.getConnection();
		try {

			stmt = conn.prepareStatement(M_LIST);
			rs = stmt.executeQuery();
			while (rs.next()) {
				MemberVO one = new MemberVO();
				one.setSid(rs.getInt("sid"));
				one.setUserid(rs.getString("userid"));
				one.setUsername(rs.getString("username"));
				one.setEmail(rs.getString("email"));
				one.setsex(rs.getString("sex"));
				one.setRegdate(rs.getDate("regdate"));
				list.add(one);
			}
			rs.close();
		} catch (Exception e) {
			System.out.println("failed");
			e.printStackTrace();
		}
		return list;
	}
}
