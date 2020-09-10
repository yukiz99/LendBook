package com.library.service;

import com.library.bean.Reader;
import com.library.mapper.ReaderMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ReaderService {
    @Autowired
    private ReaderMapper readerMapper;

    public ArrayList<Reader> findAll() {
        return readerMapper.findAll();
    }
    
    public Reader findByReaderId(long readerId) {
        return readerMapper.findByReaderId(readerId);
    }

    public List<Reader> queryByUsername(String searchWord) {
		return readerMapper.queryByUsername(searchWord);
	} 
    
    public boolean deleteByReaderId(long readerId) {
        return readerMapper.deleteByReaderId(readerId) > 0;
    }

    public boolean edit(Reader reader) {
        return readerMapper.edit(reader) > 0;
    }

    public long add(Reader reader) {
        return readerMapper.add(reader);
    }
   
   
    //重置密码
    public boolean resetPassword(long readerId, String newPassword) {
        return readerMapper.resetPassword(readerId, newPassword) > 0;
    }

	
}
