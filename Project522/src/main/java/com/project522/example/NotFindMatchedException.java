package com.project522.example;

public class NotFindMatchedException extends RuntimeException{

	
	private String message;

    public NotFindMatchedException(String message) {
        this.message = message;
    }

    public String getMessage() {
        return this.message;
    }
}
