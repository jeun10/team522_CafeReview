package com.project522.example;

public class IdExistNotCheckMatchedException extends RuntimeException{

	
	private String message;

    public IdExistNotCheckMatchedException(String message) {
        this.message = message;
    }

    public String getMessage() {
        return this.message;
    }
}
