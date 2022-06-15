package com.api.turiscamp.service.impl;

import java.util.Collections;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.api.turiscamp.domain.Role;
import com.api.turiscamp.domain.User;
import com.api.turiscamp.domain.dto.RegisterDTO;
import com.api.turiscamp.repository.IRoleRepository;
import com.api.turiscamp.repository.IUserRepository;
import com.api.turiscamp.service.IUserService;


@Service
public class UserServiceImpl implements IUserService{
	
	private IUserRepository userRepository;
	private IRoleRepository roleRepository;
	private BCryptPasswordEncoder passwordEncoder;
	
	public UserServiceImpl (IUserRepository userRepository, IRoleRepository roleRepository, BCryptPasswordEncoder passwordEncoder) {
		this.userRepository = userRepository;
		this.roleRepository = roleRepository;
		this.passwordEncoder = passwordEncoder;
	}


	@Override
	public User register(RegisterDTO userDTO) throws Exception {
		
		validateUsername(userDTO.getUsername());
		User user =  new User();
		user.setNames(userDTO.getNames());
		user.setSurnames(userDTO.getSurnames());
		user.setPassword(passwordEncoder.encode(userDTO.getPassword()));
		user.setUsername(userDTO.getUsername());
		Role role = roleRepository.findRoleByName("ROLE_USER");
		user.setRoles(Collections.singleton(role));
		userRepository.save(user);
	
		return user;
	}
	
	
	private User validateUsername(String username) throws Exception {
		
		User user = userRepository.findUserByUsername(username);
		
		if(user != null) {
		 throw new Exception("Usernarme already exist");
		}
		
		return user;
	}
		
}
