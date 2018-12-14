package com.gz.bean;

import java.util.Arrays;

public class FileMeta {
	 
	//文件名称
    private String fileName;
    //文件大小
    private String fileSize;
    //文件类型
    private String fileType;
    //文件字节数组
    private byte[] bytes;
    //文件存储路径
    private  String filePath;
    //上传时间
    private String fileTime;
    public String getFileName() {
        return fileName;
    }
    
    public void setFileName(String fileName) {
            this.fileName = fileName;
    }
    
    public String getFileSize() {
            return fileSize;
    }
    
    public void setFileSize(String fileSize) {
            this.fileSize = fileSize;
    }
    
    public String getFileType() {
            return fileType;
    }
    
    public void setFileType(String fileType) {
            this.fileType = fileType;
    }
    
    public byte[] getBytes() {
            return bytes;
    }
    
    public void setBytes(byte[] bytes) {
            this.bytes = bytes;
    }

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileTime() {
		return fileTime;
	}

	public void setFileTime(String fileTime) {
		this.fileTime = fileTime;
	}
	@Override
	public String toString() {
		return "FileMeta [fileName=" + fileName + ", fileSize=" + fileSize + ", fileType=" + fileType + ", bytes="
				+ Arrays.toString(bytes) + ", filePath=" + filePath + ", fileTime=" + fileTime + "]";
	}
}
