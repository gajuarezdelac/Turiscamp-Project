package com.api.turiscamp.security;

import java.util.Date;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import com.api.turiscamp.exception.AuthException;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.SignatureException;
import io.jsonwebtoken.UnsupportedJwtException;

//Esta clase se encarga de generar el token 
@Component
public class JwtProvider {

	@Value("app.jwt-secret")
	private String jwtSecret;
	
//	@Value("app.jwt-expiration-milliseconds")
	private long jwtExpirationInMs = 503302020;
	
	public String generateToken(Authentication authentication)  {
		
		String username = authentication.getName();
		Date currentDate = new Date();
		Date expireDate = new Date(currentDate.getTime() + jwtExpirationInMs);
		
		String token = Jwts.builder()
				.setSubject(username)
				.setIssuedAt(new Date())
				.setExpiration(expireDate)
				.signWith(SignatureAlgorithm.HS512, jwtSecret)
				.compact();
	
		return token;
	}
	
	// Get Username from token
	public String getUsernameFromJWT(String token) {
		Claims claims = Jwts.parser().setSigningKey(jwtSecret).parseClaimsJws(token).getBody();
		return claims.getSubject();
	}
	
	
	public boolean validateToken(String token) {
		
	
		try {
			Jwts.parser().setSigningKey(jwtSecret).parseClaimsJws(token);
			return true;
		} catch (SignatureException e) {
			throw new AuthException(HttpStatus.BAD_REQUEST, "Invalid JWT Signature");
		} catch (MalformedJwtException e) {
			throw new AuthException(HttpStatus.BAD_REQUEST, "Invalid JWT Token");
		} catch (ExpiredJwtException e) {
			throw new AuthException(HttpStatus.BAD_REQUEST, "Expired JWT Token");
		} catch (UnsupportedJwtException e) {
			throw new AuthException(HttpStatus.BAD_REQUEST, "Unsupported JWT Token");
		} catch (IllegalArgumentException e) {
			throw new AuthException(HttpStatus.BAD_REQUEST, "JWT Claims string is empty");
		}
	
	}
	
	
	
}
