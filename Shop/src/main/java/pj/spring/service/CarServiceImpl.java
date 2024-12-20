package pj.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pj.spring.dao.CarDAO;

@Service
public class CarServiceImpl implements CarService{
	
	@Autowired
	public CarDAO carDAO;
	
	
}
