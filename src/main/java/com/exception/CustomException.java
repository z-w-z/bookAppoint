package com.exception;

public class CustomException extends Exception{
	private static final long serialVersionUID = 48L;
	public String message;
	public CustomException(String message){
		super(message);
		this.message = message;
	}
	public String getMessage(){
		return message;
	}
	public void setMessage(String message){
		this.message = message;
	}
}
