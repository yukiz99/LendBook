package com.library.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Book implements Serializable {

    private long bookId;
    private String name;
    private String author;
    private String publish;
    private String isbn;
    private String introduction;
    private int number;

}
