package com.project522.example;

public class PasswordNotMatchedException extends RuntimeException{

	
	private String message;

    public PasswordNotMatchedException(String message) {
        this.message = message;
    }

    public String getMessage() {
        return this.message;
    }
}
