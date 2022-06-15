/**
 * 
 */
package com.api.turiscamp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.turiscamp.domain.Role;

/**
 * @author Gabriel
 *
 */
public interface IRoleRepository extends JpaRepository<Role, Long>{
	Role findRoleByName(String name);	
}
