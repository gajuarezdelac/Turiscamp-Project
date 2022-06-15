/**
 * 
 */
package com.api.turiscamp.service;

import org.springframework.stereotype.Component;

import com.api.turiscamp.domain.User;
import com.api.turiscamp.domain.dto.RegisterDTO;

/**
 * @author Gabriel
 *
 */

@Component
public interface IUserService {

	User register(RegisterDTO user) throws Exception;

}
