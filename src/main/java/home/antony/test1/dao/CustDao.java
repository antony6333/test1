
package home.antony.test1.dao;

import home.antony.test1.model.Cust;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

@Repository
public class CustDao {

	@Resource
	private SqlSession sqlSession;

	public Cust getCustById(Long id) {
		return sqlSession.selectOne("CustMapper.selectCustById", id);
	}

}
