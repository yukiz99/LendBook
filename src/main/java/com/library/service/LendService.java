package com.library.service;

import com.library.bean.Lend;
import com.library.mapper.LendMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class LendService {
    @Autowired
    private LendMapper lendMapper;

    public boolean returnBook(long bookId, long readerId){
        return lendMapper.returnBookOne(bookId, readerId)>0 && lendMapper.returnBookTwo(bookId)>0;
    }

    public boolean lendBook(long bookId,long readerId){
        return lendMapper.lendBookOne(bookId,readerId)>0 && lendMapper.lendBookTwo(bookId)>0;
    }

    public ArrayList<Lend> findAll(){
        return lendMapper.findAll();
    }
    public ArrayList<Lend> findAllByReaderId(long readerId){
        return lendMapper.findAllByReaderId(readerId);
    }

    public int deleteBySerNum(long serNum) {
        return lendMapper.deleteBySerNum(serNum);
    }

}
