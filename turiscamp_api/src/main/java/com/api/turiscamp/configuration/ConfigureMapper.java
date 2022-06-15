/**
 * 
 */
package com.api.turiscamp.configuration;

import org.modelmapper.ModelMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author Gabriel
 *
 */

@Configuration
public class ConfigureMapper {

	@Bean public ModelMapper modelMapper() {
		return new ModelMapper();
	}
	
}
