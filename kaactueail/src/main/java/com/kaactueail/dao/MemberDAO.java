package com.kaactueail.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Component;

import com.kaactueail.model.MemberDTO;
import com.kosa.config.SqlSessionFactoryService;

@Component
public class MemberDAO {
	private SqlSessionFactory sqlSessionFactory;
	private SqlSession sqlSession = null;

	public MemberDAO() {
		sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
	}
	
	//회원가입
	public int insertmember(MemberDTO dto) {
		try {
			sqlSession = sqlSessionFactory.openSession();
			int result = sqlSession.insert("memberdao.insertmember",dto);
			sqlSession.commit();
			return result;	
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		
	}
	
	//회원번호 중복체크
	public int selectmNum(int mNum) {
		try {
		sqlSession = sqlSessionFactory.openSession();
		int result = sqlSession.selectOne("memberdao.selectmnum", mNum); // 회원 번호가 중복됐는지 count로 처리
		if(result == 0) return mNum;
		else return 0;
		}catch (Exception e) {
			return 0;
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
	}
	
	//로그인
	public boolean checkMember(MemberDTO dto) {
		try {
			sqlSession = sqlSessionFactory.openSession();
			
			boolean result = sqlSession.selectOne("memberdao.checkmember", dto);
			if(result == true)  return true;
			else return false;
		} catch (Exception e) {
			return false;
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
	}
	
	//로그인한 사용자 권한 얻어오기
	public String memberRole(String mId) {
		try {
			sqlSession = sqlSessionFactory.openSession();
			String result = sqlSession.selectOne("memberdao.memberrole", mId);
			return result;
		} catch (Exception e) {
			return null;
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
	}
	
	//로그인한 사용자 번호 얻어오기
	public int memberNum(String mId) {
		try {
			sqlSession = sqlSessionFactory.openSession();
			int  result = sqlSession.selectOne("memberdao.membernum", mId);
			return result;
		} catch (Exception e) {
			return 0;
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
	}
	
	//로그인 중복처리
	public int membercheck(String mId) {
		try {
			sqlSession = sqlSessionFactory.openSession();
			int result = sqlSession.selectOne("memberdao.checkid", mId);
			return result;
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
	}
}
