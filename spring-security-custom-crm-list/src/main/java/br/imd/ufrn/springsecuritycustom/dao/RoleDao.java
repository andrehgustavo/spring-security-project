package br.imd.ufrn.springsecuritycustom.dao;


import java.util.Collection;

import br.imd.ufrn.springsecuritycustom.entity.Role;

public interface RoleDao {

	public Role findRoleByName(String theRoleName);

	public Collection<Role> getRoles();
	
}
