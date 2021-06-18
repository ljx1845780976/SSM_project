package com.service;

import com.dao.ProductDao;
import com.domain.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 *
 **/

public interface ProductService {
    public List<Product> findAll() throws Exception;
    public void save(Product product);
}
