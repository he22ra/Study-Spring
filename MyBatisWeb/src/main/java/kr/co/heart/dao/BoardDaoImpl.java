package kr.co.heart.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.heart.domain.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.heart.dao.BoardMapper.";	//.으로 BoardMapper.xml의 select 이어짐
	
	@Override
	public BoardDto select(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "select", bno);
	}

}
