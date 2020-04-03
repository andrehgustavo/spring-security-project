package br.imd.ufrn.springsecuritycustom.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.imd.ufrn.springsecuritycustom.entity.Role;
import br.imd.ufrn.springsecuritycustom.entity.User;
import br.imd.ufrn.springsecuritycustom.service.UserService;
import br.imd.ufrn.springsecuritycustom.user.CrmUser;

@Controller
@RequestMapping("/systems")
public class SystemsController {

	// need to inject our user service
	@Autowired
	private UserService userService;
	
	private Logger logger = Logger.getLogger(getClass().getName());

	// add request mapping for /systems
	@GetMapping("/")
	public String showSystems() {

		return "systems";
	}

	@GetMapping("/list")
	public String showEmployeesList(Model theModel) {

		// get user from the service
		List<User> theUsers = userService.getUsers();

		// add the user to the model
		theModel.addAttribute("users", theUsers);

		return "employees-list";
	}

	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("userId") int theId, Model theModel) {

		// get the user from our service
		CrmUser theUser = userService.getCrmUser(theId);
		
		// get the roles from our service
		Collection<Role> systemRoles = userService.getRoles();		
		
		String list = "";
		for(Role role : theUser.getFormRoles()) {
				list += "[" + role + "]";
		};
		logger.info("UserRoles: " + list);

		// set user as a model attribute to pre-populate the form
		theModel.addAttribute("crmUser", theUser);
		theModel.addAttribute("roleList", systemRoles);


		// send over to our form
		return "registration-form";
	}	

}
