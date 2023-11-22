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

	private final String M_INSERT = "insert into member (userid, password, username, email, photo, detail)"
			+ " values (?,sha1(?),?,?,?,?)";
	private final String M_UPDATE = "update member set username=?, email=?, photo=?, detail=?" + "where sid=?";
	private final String M_DELETE = "delete from member  where sid=?";
	private final String M_GET = "select * from member  where sid=?";
	private final String M_LIST = "select * from member order by regdate desc";

	String M_SELECT = "select * form member where sid = ?";

	public int insertMember(MemberVO data) {
		int result = 0;
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(M_INSERT);
			stmt.setString(1, data.getUserid());
			stmt.setString(2, data.getPassword());
			stmt.setString(3, data.getUsername());
			stmt.setString(4, data.getEmail());
			stmt.setString(5, data.getPhoto());
			stmt.setString(6, data.getDetail());
			result = stmt.executeUpdate();
		} catch (SQLException e) {
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
			e.printStackTrace();
		}
	}

	public int updateBoard(MemberVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_UPDATE);
			stmt.setString(1, vo.getUserid());
			stmt.setString(2, vo.getPassword());
			stmt.setString(3, vo.getUsername());
			stmt.setString(4, vo.getEmail());
			stmt.setString(5, vo.getPhoto());
			stmt.setString(6, vo.getDetail());
			int result = stmt.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	//dao 의 member중 하나를 가져오는 함수
	public MemberVO getMember(int sid) {
		MemberVO one = null;
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(M_GET);
			stmt.setInt(1, sid);
			rs = stmt.executeQuery();
			if (rs.next()) {
				one.setSid(rs.getInt("sid"));
				one.setUserid(rs.getString("userid"));
				one.setUsername(rs.getString("username"));
				one.setEmail(rs.getString("email"));
				one.setPhoto(rs.getString("photo"));
				one.setDetail(rs.getString("detail"));
				one.setRegdate(rs.getDate("regdate"));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return one;
	}

	//데이터 목록 페이지에서 출력
	public List<MemberVO> getList() {
		List<MemberVO> list = null;
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
				one.setPhoto(rs.getString("photo"));
				one.setRegdate(rs.getDate("regdate"));
				list.add(one);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
