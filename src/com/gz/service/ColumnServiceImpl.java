package com.gz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gz.bean.Columns;
import com.gz.bean.Page;
import com.gz.dao.ColumnDao;
@Service
public class ColumnServiceImpl implements ColumnService {
    @Autowired
	private ColumnDao dao;
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return dao.getCount();
	}

	@Override
	public int getCountByCondition(String condition) {
		// TODO Auto-generated method stub
		return dao.getCountByCondition(condition);
	}

	@Override
	public Page<Columns> selectAllColumnWithPage(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		int totalCount = dao.getCount();
		Page pg = new Page(totalCount,pageNow,pageSize);
		List<Columns> list = dao.selectAllColumnWithPage(pg.getStartPos(), pg.getPageSize());
		pg.setList(list);
		return pg;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Page<Columns> selectAllColumnByNameWithPage(int pageNow, int pageSize, String name) {
		// TODO Auto-generated method stub
		int totalCount = dao.getCountByCondition(name);
		@SuppressWarnings("rawtypes")
		Page pg = new Page(totalCount,pageNow,pageSize);
		List<Columns> list = dao.selectAllColumnByNameWithPage(pg.getStartPos(), pg.getPageSize(), name);
		pg.setList(list);
		return pg;
	}

	@Override
	public int insertColumn(Columns column) {
		// TODO Auto-generated method stub
		return dao.insertColumn(column);
	}

	@Override
	public int updateColumn(Columns column) {
		// TODO Auto-generated method stub
		return dao.updateColumn(column);
	}

	@Override
	public int deleteColumn(int id) {
		// TODO Auto-generated method stub
		return dao.deleteColumn(id);
	}

	@Override
	public Columns findColumnById(int id) {
		// TODO Auto-generated method stub
		return dao.findColumnById(id);
	}

	@Override
	public List<Columns> findChildColumnById(int id) {
		// TODO Auto-generated method stub
		return dao.selectChildrenById(id);
	}

	@Override
	public List<Columns> selectAllColumn() {
		// TODO Auto-generated method stub
		return dao.selectAllColumn();
	}

	

	
}
