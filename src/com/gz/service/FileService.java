package com.gz.service;

import java.util.List;


import com.gz.bean.FileMeta;
public interface FileService {
	int insertFile(FileMeta file);
	List<FileMeta> selectAllFile();
	FileMeta selectFileByName(String fileName);
	int deleteFileById(int id);
}
