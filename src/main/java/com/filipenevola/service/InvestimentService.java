package com.filipenevola.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filipenevola.dao.InvestimentDAO;
import com.filipenevola.model.Investiment;
import com.filipenevola.model.Users;
import com.filipenevola.util.Util;

/** 
 * @author Filipe Névola
 */
@Service
public class InvestimentService {

	@Autowired
	private InvestimentDAO investimentDAO;
	@Autowired
	private Util util;

	public List<Investiment> getInvestimentList(Users user){
		return investimentDAO.getInvestiments(user);
	}
	
	public List<Investiment> create(Object data, Users user) throws ParseException{
		
        List<Investiment> newInvestiments = new ArrayList<Investiment>();
		
		List<Investiment> list = util.getInvestimentsFromRequest(data);
		
		for (Investiment investiment : list){
			investiment.setUsers(user);
			newInvestiments.add(investimentDAO.addInvestiment(investiment));
		}
		
		return newInvestiments;
	}
	
	public List<Investiment> update(Object data) throws ParseException{
		
		List<Investiment> returnInvestiments = new ArrayList<Investiment>();
		
		List<Investiment> updatedInvestiments = util.getInvestimentsFromRequest(data);
		
		for (Investiment investiment : updatedInvestiments){
			returnInvestiments.add(investimentDAO.updateInvestiment(investiment));
		}
		
		return returnInvestiments;
	}
	
	public void delete(Object data){
		
		//it is an array - have to cast to array object
		if (data.toString().indexOf('[') > -1){
			
			List<Integer> deleteInvestiments = util.getListIdFromJSON(data);
			
			for (Integer id : deleteInvestiments){
				investimentDAO.deleteInvestiment(id);
			}
			
		} else { //it is only one object - cast to object/bean
			
			Integer id = Integer.parseInt(data.toString());
			
			investimentDAO.deleteInvestiment(id);
		}
	}
	
	
}
