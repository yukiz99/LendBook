package com.library.service;

import com.library.bean.Book;
import com.library.mapper.BookMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class BookService {
    @Autowired
    private BookMapper bookMapper;

    public ArrayList<Book> query(String searchWord) {
        return bookMapper.query(searchWord);
    }

    public ArrayList<Book> findAll() {
        return bookMapper.findAll();
    }


    public boolean add(Book book) {
        return bookMapper.add(book) > 0;
    }

    public Book findByBookId(Long bookId) {
        return bookMapper.findByBookId(bookId);
    }

    public boolean edit(Book book) {
        return bookMapper.edit(book) > 0;
    }

    public boolean deleteByBookId(Long bookId) {
        return bookMapper.deleteByBookId(bookId) > 0;
    }

}
