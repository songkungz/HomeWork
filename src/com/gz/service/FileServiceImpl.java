package com.gz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gz.bean.FileMeta;
import com.gz.dao.FileDao;
@Service
public class FileServiceImpl implements FileService {
  
	@Autowired
	private FileDao dao;
	@Override
	public int insertFile(FileMeta file) {
		// TODO Auto-generated method stub
		return dao.insertFile(file);
	}

	@Override
	public List<FileMeta> selectAllFile() {
		// TODO Auto-generated method stub
		return dao.selectAllFile();
	}

	@Override
	public FileMeta selectFileByName(String fileName) {
		// TODO Auto-generated method stub
		return dao.selectFileByName(fileName);
	}

	@Override
	public int deleteFileById(int id) {
		// TODO Auto-generated method stub
		return dao.deleteFileById(id);
	}

}
