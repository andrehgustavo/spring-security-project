package br.imd.ufrn.springsecuritycustom.service;

import br.imd.ufrn.springsecuritycustom.dao.RoleDao;
import br.imd.ufrn.springsecuritycustom.dao.UserDao;
import br.imd.ufrn.springsecuritycustom.entity.Role;
import br.imd.ufrn.springsecuritycustom.entity.User;
import br.imd.ufrn.springsecuritycustom.user.CrmUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

	// need to inject user dao
	@Autowired
	private UserDao userDao;

	@Autowired
	private RoleDao roleDao;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	@Transactional
	public User findByUserName(String userName) {
		// check the database if the user already exists
		return userDao.findByUserName(userName);
	}

	@Override
	@Transactional
	public void save(CrmUser crmUser) {
		User user = new User();
		// assign user details to the user object
		if(crmUser.getId() != 0) {
			user.setId(crmUser.getId());
			
		}

		user.setRoles(crmUser.getFormRoles());
		user.setUserName(crmUser.getUserName());
		user.setPassword(passwordEncoder.encode(crmUser.getPassword()));
		user.setFirstName(crmUser.getFirstName());
		user.setLastName(crmUser.getLastName());
		user.setEmail(crmUser.getEmail());		

		// save user in the database
		userDao.save(user);
	}

	@Override
	@Transactional
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		User user = userDao.findByUserName(userName);
		if (user == null) {
			throw new UsernameNotFoundException("Invalid username or password.");
		}
		return new org.springframework.security.core.userdetails.User(user.getUserName(), user.getPassword(),
				mapRolesToAuthorities(user.getRoles()));
	}

	private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Collection<Role> roles) {
		return roles.stream().map(role -> new SimpleGrantedAuthority(role.getName())).collect(Collectors.toList());
	}

	@Override
	@Transactional
	public List<User> getUsers() {
		return userDao.getUsers();
	}

	@Override
	@Transactional
	public User getUser(int theId) {
		return userDao.getUser(theId);
	}

	@Override
	@Transactional
	public CrmUser getCrmUser(int theId) {
		CrmUser crmUser = new CrmUser();
		crmUser.setId(userDao.getUser(theId).getId());
		crmUser.setUserName(userDao.getUser(theId).getUserName());
		crmUser.setPassword(userDao.getUser(theId).getPassword());
		crmUser.setFirstName(userDao.getUser(theId).getFirstName());
		crmUser.setLastName(userDao.getUser(theId).getLastName());
		crmUser.setEmail(userDao.getUser(theId).getEmail());
		crmUser.setFormRoles(userDao.getUser(theId).getRoles());
		return crmUser;
	}

	@Override
	@Transactional
	public Collection<Role> getRolesbyId(int theId) {
		return userDao.getRolesbyIdDao(theId);
	}
	
	@Override
	@Transactional
	public Collection<Role> getRoles() {
		return roleDao.getRoles();
	}

	@Override
	@Transactional
	public Collection<Role> validationRole(CrmUser theCrmUser){
		Collection<Role> checkRoles = new ArrayList<Role>();
		if(theCrmUser.getId()==0) {
			checkRoles.add(findRoleByName("ROLE_EMPLOYEE"));
		}
		else if(!theCrmUser.getFormRoles().contains(findRoleByName("ROLE_EMPLOYEE"))) {
			checkRoles = theCrmUser.getFormRoles();
			checkRoles.add(findRoleByName("ROLE_EMPLOYEE"));
		}else {
			checkRoles = theCrmUser.getFormRoles();
		}
		return checkRoles;
	}

	@Override
	public Role findRoleByName(String role) {
		return roleDao.findRoleByName(role);
	}

}
