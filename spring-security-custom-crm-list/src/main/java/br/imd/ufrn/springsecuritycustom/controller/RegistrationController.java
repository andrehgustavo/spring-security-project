package br.imd.ufrn.springsecuritycustom.controller;

import java.util.logging.Logger;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import br.imd.ufrn.springsecuritycustom.entity.Role;
import br.imd.ufrn.springsecuritycustom.entity.User;
import br.imd.ufrn.springsecuritycustom.service.UserService;
import br.imd.ufrn.springsecuritycustom.user.CrmUser;

@Controller
@RequestMapping("/register")
public class RegistrationController {

	@Autowired
	private UserService userService;

	private Logger logger = Logger.getLogger(getClass().getName());

	// It is used in the form validation
	// process. Here we add support to trim empty strings to null.
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {

		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);

		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

	// request mapping to show the registration form.
	// We also create a CrmUser and add it as a model attribute.
	@GetMapping("/showRegistrationForm")
	public String showMyLoginPage(Model theModel) {

		theModel.addAttribute("crmUser", new CrmUser());

		return "registration-form";
	}

	// On the registration form, the user will enter their user id, password,
	// matching password, first name, last name, email. The password will be entered
	// as plain text. The data is then sent to the request mapping

	@PostMapping("/processRegistrationForm")
	public String processRegistrationForm(@Valid @ModelAttribute("crmUser") CrmUser theCrmUser,
			BindingResult theBindingResult, Model theModel) {

		String userName = theCrmUser.getUserName();
		int userId = theCrmUser.getId();
		logger.info("Processing registration form for: " + userName);
		logger.info("Processing registration form for id: " + userId);
		
		//Verification if the user checked employee, if doesn't add.		
		theCrmUser.setFormRoles(userService.validationRole(theCrmUser));
		
		String list = "";
		for(Role role : theCrmUser.getFormRoles()) {
				list += "[" + role + "]";
		};
		logger.info("Roles: " + list);

		// form validation
		if (theBindingResult.hasErrors()) {
			return "registration-form";
		}

		// check the database if user already exists
		User existing = userService.findByUserName(userName);

		if (userId == 0 && existing != null) {
			theModel.addAttribute("crmUser", new CrmUser());
			theModel.addAttribute("registrationError", "User name already exists.");

			logger.warning("User name already exists.");
			return "registration-form";
		}
		// create user account
		userService.save(theCrmUser);

		logger.info("Successfully created user: " + userName);
		
		return "registration-confirmation";

			
	}
}
