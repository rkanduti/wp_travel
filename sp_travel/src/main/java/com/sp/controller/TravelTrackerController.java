package com.sp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.entity.*;
import com.sp.service.*;

@Controller
@RequestMapping("/")
@SessionAttributes(value = {"user"})
public class TravelTrackerController {

	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private TravelService travelService;
	
	@Autowired
	private UserService userService;
	
	User user;
	Company company;
	List<Travel> travels;
	
	public boolean checkLoginSession(HttpSession session) {
		boolean login = false;
		try {
			login = (Boolean) session.getAttribute("login");
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return login;
	}
	
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String home(HttpSession session, Model model) {
		if(checkLoginSession(session)) {
			model.addAttribute("user", user);
			model.addAttribute("company", company);
			model.addAttribute("travel", travels.get(0));
			return "first";
		}
		else {
			return "index";
		}
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String validateLogin(
		@RequestParam(value = "user", required = false) String username
	  , @RequestParam(value = "pass", required = false) String pass
	  , HttpSession session
	  , Model model
	  , RedirectAttributes redirectAttributes) {
		// Name of your jsp file as parameter
		
		user = loginService.validateLogin(username, pass);
		
		if(user != null) {
			//get User and data
			
			company = companyService.getCompany(user.getCompanyid());
			travels = travelService.getTravels(user.getUserid());
			
			model.addAttribute("user", user);
			model.addAttribute("company", company);
			model.addAttribute("travel", travels.get(0));
			
			session.setAttribute("login", true);
			return "redirect:/";
			
		}
		else {
			redirectAttributes.addFlashAttribute("welcomeMessage", "Incorrect username or password.");
			session.setAttribute("login", false);
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public String getLogin(HttpSession session, Model model) {
				
		return "index"; // home(session, model);
	}

	@RequestMapping(value = "/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		
		session.setAttribute("login", false);
		
		return "index";
	}

	@RequestMapping(value = "/overview", method=RequestMethod.GET)
	public String overview(HttpSession session, Model model) {
		if(checkLoginSession(session) && user != null) {
			model.addAttribute("user", user);
			model.addAttribute("travels", travels);
			return "overview";
		}
		else {
			return "index";
		}
	}
	
	@RequestMapping(value = "/add", method=RequestMethod.GET)
	public String add(HttpSession session, Model model) {
		if(checkLoginSession(session)) {
			return "add";
		}
		else {
			return "index";
		}
	}
	
	@RequestMapping(value = "/add", method=RequestMethod.POST)
	public String addPost(HttpSession session, Model model
			, @RequestParam(value = "departure", required = false) String departure
			, @RequestParam(value = "arrival", required = false) String arrival
			, @RequestParam(value = "destination", required = false) String destination) {
		
		if(checkLoginSession(session)) {
		
			Travel temp = travelService.addTravel(departure, arrival, destination, user.getUserid());
			travels.add(temp);
			travels = travelService.getTravels(user.getUserid());

			model.addAttribute("user", user);
			model.addAttribute("travels", travels);
			
			return "overview";
		}
		else {	
			return "index";
		}
	}

	
	@RequestMapping(value = "/manage/{id}", method=RequestMethod.GET)
	public String manageTravel(HttpSession session, Model model, @PathVariable("id") int id) {
		
		if(checkLoginSession(session)) {
			Travel travel = null;
			for (Travel temp : travels) {
				if(temp.getTravelid() == id)
					travel = temp;
			}
			List<Expense> expenses = travelService.getExpenses(id);
			travel.setExpenses(expenses);
			
			model.addAttribute("user", user);
			model.addAttribute("travel", travel);
			
			return "manage";
		}
		else {	
			return "index";
		}
	}
}
