package br.imd.ufrn.springsecuritycustom.service;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import br.imd.ufrn.springsecuritycustom.entity.Role;
import br.imd.ufrn.springsecuritycustom.entity.User;
import br.imd.ufrn.springsecuritycustom.user.CrmUser;

public interface UserService extends UserDetailsService{ 
	
	User findByUserName(String userName);

    void save(CrmUser crmUser);

	List<User> getUsers();

	User getUser(int theId);

	CrmUser getCrmUser(int theId);

	Collection<Role> getRolesbyId(int theId);

	Collection<Role> getRoles();

	Collection<Role> validationRole(CrmUser theCrmUser);

	Role findRoleByName(String string);

}
