package com.saturn.app.web;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IAction {
	
	public abstract IView execute(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException;

	public abstract String requestMapping();
}	
