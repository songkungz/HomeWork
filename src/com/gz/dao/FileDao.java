package com.gz.dao;

import java.util.List;

import com.gz.bean.FileMeta;

public interface FileDao {
int insertFile(FileMeta file);
List<FileMeta> selectAllFile();
FileMeta selectFileByName(String fileName);
int deleteFileById(int id);
}
