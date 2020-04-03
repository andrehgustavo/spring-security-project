package br.imd.ufrn.springsecuritycustom.dao;

import java.util.Collection;
import java.util.List;

import br.imd.ufrn.springsecuritycustom.entity.Role;
import br.imd.ufrn.springsecuritycustom.entity.User;

public interface UserDao {

	User findByUserName(String userName);

	void save(User user);

	List<User> getUsers();

	User getUser(int theId);

	Collection<Role> getRolesbyIdDao(int theId);
}
