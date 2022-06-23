package com.tencoding.jpa.advice;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

@ControllerAdvice
@RestController
public class ApiControllerAdvice {

	@ExceptionHandler(value = Exception.class)
	public String exception(Exception e) {
		return "<h2> " + e.getMessage() + " </h2>";
	}
}
