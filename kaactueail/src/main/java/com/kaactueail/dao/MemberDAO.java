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
	
	public int insertmember(MemberDTO dto) {
		try {
			sqlSession = sqlSessionFactory.openSession();
			int result = sqlSession.insert("memberdao.insertmember",dto);
			sqlSession.commit();
			return result;	
		} catch (Exception e) {
			return 0;
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
	}
	
	public int selectmNum(int m_num) {
		try {
		sqlSession = sqlSessionFactory.openSession();
		int result = sqlSession.selectOne("memberdao.selectmnum", m_num); // 회원 번호가 중복됐는지 count로 처리
		if(result == 0) return m_num;
		else return 0;
		}catch (Exception e) {
			return 0;
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
	}
	
	public boolean checkMember(MemberDTO dto) {
		try {
			sqlSession = sqlSessionFactory.openSession();
			System.out.println("MemberDTO getM_id = " + dto.getM_id());
			System.out.println("MemberDTO getM_pwd" + dto.getM_pwd());
			boolean result = sqlSession.selectOne("memberdao.checkmember", dto);
			System.out.println(result);
			if(result == true)  return true;
			else return false;
		} catch (Exception e) {
			return false;
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
		
	}
}
