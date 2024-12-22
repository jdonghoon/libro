package pj.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pj.spring.dao.CartDAO;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	public CartDAO carDAO;
	
	
}
