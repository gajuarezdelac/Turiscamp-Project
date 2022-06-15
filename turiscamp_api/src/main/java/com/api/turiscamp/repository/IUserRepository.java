/**
 * 
 */
package com.api.turiscamp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.turiscamp.domain.User;

/**
 * @author Gabriel
 *
 */
public interface IUserRepository extends JpaRepository<User, Long> {

	User findUserByUsername(String username);
	
	Boolean existsUserByUsername(String username);
	
	
}
